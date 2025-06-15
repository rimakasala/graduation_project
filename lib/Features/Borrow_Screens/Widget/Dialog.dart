import 'package:flutter/material.dart';
import 'package:graduation_project/Core/constent.dart';
import 'package:graduation_project/Core/Push_button.dart';

void showFirstDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AlertDialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // لجعل الحواف مستديرة
            ),
            title: const Text(
                "يرجى التوجه إلى المكتبة خلال 24 ساعة من الموافقة على طلبك"),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showSecondDialog(context);
                    },
                    child: const PushButton(
                      width: 90,
                      nameCard: "تأكيد الطلب",
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const PushButton(
                      width: 90,
                      nameCard: "إلغاء الطلب",
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
  );
}

void showSecondDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("تم إرسال طلبك بنجاح"),
        content: const Text(
          "انتظر الرد",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "إغلاق",
              style: TextStyle(color: blueUses),
            ),
          ),
        ],
      );
    },
  );
}
