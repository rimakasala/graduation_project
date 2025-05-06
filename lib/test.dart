import 'package:flutter/material.dart';
import 'package:graduation_project/Core/Clicked_Button.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

main(){
  runApp(CustomScannerScreen());
}
class CustomScannerScreen extends StatefulWidget {
  const CustomScannerScreen({super.key});

  @override
  _CustomScannerScreenState createState() => _CustomScannerScreenState();
}

class _CustomScannerScreenState extends State<CustomScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool isTorchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match app bar color
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text('Scan QR Code'),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         isTorchOn ? Icons.flash_on : Icons.flash_off,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         setState(() {
      //           isTorchOn = !isTorchOn;
      //         });
      //         cameraController.toggleTorch();
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          const OurAppbar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 2
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Scanner View - Full Size Without Background Color
                    SizedBox(
                      width: double.infinity,
                      height: 185,
                      child: MobileScanner(
                        controller: cameraController,
                        fit: BoxFit.cover,
                        // Ensure full coverage
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          if (barcodes.isNotEmpty) {
                            final String? scannedData = barcodes.first.rawValue;
                            if (scannedData != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Scanned: $scannedData'),
                                  backgroundColor: Colors.cyan,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context,'enterd');
                },
                  child: const ClickedButton(named: 'الدخول', height: 40, width: 105,),
              )

            ],
          ),
        ],
      ),
    );
  }
}
