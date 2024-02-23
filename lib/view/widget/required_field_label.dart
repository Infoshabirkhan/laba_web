import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequiredFieldLabel extends StatelessWidget {
  final Color? textColor;
  final String title;
  final bool isRequired;

  const RequiredFieldLabel({
    Key? key,
    this.textColor,
    this.isRequired = true,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.sp),
        child: RichText(
          text: TextSpan(
              text: title,
              style: TextStyle(
                fontSize: 12.sp,
                color: textColor ?? Colors.black,
              ),
              children: [
                isRequired
                    ? TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xffB82323),
                  ),
                )
                    : const TextSpan()
              ]),
        ),
      ),
    );
  }
}
