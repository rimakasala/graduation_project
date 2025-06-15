import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/Core/Back_Arrow.dart';
import 'package:graduation_project/Features/Borrow_Screens/Widget/Dialog.dart';
import 'package:graduation_project/Core/Our_appBar.dart';
import 'package:graduation_project/Features/Borrow_Screens/Widget/Phone_Input_Field.dart';
import 'package:graduation_project/Core/Push_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Widget/upload_box.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const OurAppbar(),
          const BackArrow(),
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
                  onTap: () {
                    pickImage((File file) {
                      setState(() {
                        idImage = file;
                      });
                    });
                  },
                  child: UploadBox(imageFile: idImage,),
                ),
                const SizedBox(height: 16),
                const Text(
                  " ورقة مختومة بختم النسر من\n:مؤسسة حكوميه بتوقيع 2 موظفين",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (){
                    pickImage((File file){
                      setState(() {
                        govPaperImage=file;
                      });
                    });
                  },

                  child: UploadBox(
                      imageFile: govPaperImage,

                      ),
                ),
                const SizedBox(height: 16),
                PhoneInputField(phoneController: phoneController),
                const SizedBox(height: 16),
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
}