import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Borrow_Screens/Widget/Dialog.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Our_appBar.dart';
import 'package:graduation_project/Features/Entered_Screens/Widget/Push_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BorrowRequestPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BorrowRequestPageState createState() => _BorrowRequestPageState();
}

class _BorrowRequestPageState extends State<BorrowRequestPage> {
  File? idImage;
  File? govPaperImage;
  final TextEditingController phoneController = TextEditingController();

  Future<void> pickImage(Function(File) onImagePicked) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  void submitRequest() {
    // هنا تقدر تضيف منطق الإرسال أو التحقق من البيانات
    if (idImage != null &&
        govPaperImage != null &&
        phoneController.text.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('تم إرسال الطلب بنجاح')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('يرجى ملء كل البيانات')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OurAppbar(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 15),
                const Text(
                  ":اكمل البيانات التاليه للإستعارة",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "صورة البطاقة:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () =>
                      pickImage((file) => setState(() => idImage = file)),
                  child: uploadBox(idImage),
                ),
                const SizedBox(height: 16),
                const Text(
                  " ورقة مختومة بختم النسر من\n:مؤسسة حكوميه بتوقيع 2 موظفين",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () =>
                      pickImage((file) => setState(() => govPaperImage = file)),
                  child: uploadBox(govPaperImage),
                ),
                const SizedBox(height: 16),
                const Text(" :رقم التليفون",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    submitRequest;
                    showFirstDialog(context);
                  },
                  child: const PushButton(
                    width: 322,
                    nameCard: 'طلب',
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadBox(File? imageFile) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: imageFile == null
            ? const Icon(Icons.camera_alt, size: 32)
            : Image.file(imageFile),
      ),
    );
  }
}
