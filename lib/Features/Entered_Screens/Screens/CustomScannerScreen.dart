// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/Core/Clicked_Button.dart';
// import 'package:graduation_project/Core/Our_appBar.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// main(){
//   runApp(CustomScannerScreen());
// }
// class CustomScannerScreen extends StatefulWidget {
//   const CustomScannerScreen({super.key});
//
//   @override
//   _CustomScannerScreenState createState() => _CustomScannerScreenState();
// }
//
// class _CustomScannerScreenState extends State<CustomScannerScreen> {
//   MobileScannerController cameraController = MobileScannerController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Match app bar color
//       body: Stack(
//         children: [
//           const OurAppbar(),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 6,
//                         spreadRadius: 2
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     /// Scanner View - Full Size Without Background Color
//                     SizedBox(
//                       width: double.infinity,
//                       height: 185,
//                       child: MobileScanner(
//                         controller: cameraController,
//                         fit: BoxFit.cover,
//                         // Ensure full coverage
//                         onDetect: (capture) {
//                           final List<Barcode> barcodes = capture.barcodes;
//                           if (barcodes.isNotEmpty) {
//                             final String? scannedData = barcodes.first.rawValue;
//                             if (scannedData != null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content: Text('Scanned: $scannedData'),
//                                   backgroundColor: Colors.cyan,
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25,),
//               InkWell(
//                 onTap: (){
//                   context.go('/EnteredScreen');
//                 },
//
//                   child: const ClickedButton(named: 'الدخول', height: 40, width: 105,),
//               )
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/Clicked_Button.dart';
import 'package:graduation_project/Core/Our_appBar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MaterialApp(home: CustomScannerScreen()));
}

class CustomScannerScreen extends StatefulWidget {
  const CustomScannerScreen({super.key});

  @override
  _CustomScannerScreenState createState() => _CustomScannerScreenState();
}

class _CustomScannerScreenState extends State<CustomScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool isTorchOn = false;

  // ✅ متغيرات لتخزين البيانات
  String? scannedData;
  final String userId = "user_001"; // لاحقًا ممكن تجيبيه من تسجيل دخول

  bool hasScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // نخلي الخلفية بيضاء
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
                        spreadRadius: 2),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// ✅ الكاميرا
                    SizedBox(
                      width: double.infinity,
                      height: 185,
                      child: MobileScanner(
                        controller: cameraController,
                        fit: BoxFit.cover,
                        onDetect: (capture) {
                          if (hasScanned) return;

                          final List<Barcode> barcodes = capture.barcodes;
                          if (barcodes.isNotEmpty) {
                            final String? data = barcodes.first.rawValue;
                            if (data != null) {
                              setState(() {
                                hasScanned = true;
                                scannedData = data;
                              });

                              final payload = {
                                'user_id': userId,
                                'qr_data': data,
                              };

                              print('✅ بيانات محفوظة مؤقتًا:');
                              print(payload);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('تم قراءة الكود: $data'),
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
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  if (scannedData != null) {
                    print('إرسال البيانات لاحقًا..');
                    print('User: $userId | QR: $scannedData');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يرجى مسح كود أولاً'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  context.go('/EnteredScreen'); // الانتقال
                },
                child: const ClickedButton(
                  named: 'الدخول',
                  height: 40,
                  width: 105,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
