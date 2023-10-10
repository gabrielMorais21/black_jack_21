import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showResultModal(BuildContext context, {required String text, required Function callback, bool dismissible = true}) {
  showDialog(
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: '',
      barrierColor: Colors.black26,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Wrap(
                          children: [
                            Text(
                              text,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              callback();
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
