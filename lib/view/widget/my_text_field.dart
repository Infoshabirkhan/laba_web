import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatefulWidget {
  final bool? enabled;
  final bool? isPasswordField;
  final TextEditingController? controller;
  final String hintText;
  final String? label;
  final bool? isRequired;
  final Widget? suffixIcon;
  final int? maxLines;

  const MyTextField({
    Key? key,
    this.maxLines = 1,
    this.enabled = true,
    this.isRequired = true,
    this.suffixIcon,
    this.isPasswordField = false,
    required this.controller,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxLines == 1 ? 60.sp : widget.maxLines! * 35,
     child:  TextFormField(
       maxLines: widget.maxLines,
       enabled: widget.enabled,
       autovalidateMode: AutovalidateMode.onUserInteraction,
       obscureText: widget.isPasswordField! ? showPassword : false,
       controller: widget.controller,
       validator: !widget.isRequired!
           ? (value) {
         return null;
       }
           : (value) {
         if (value == null || value.isEmpty) {
           return '"${widget.label}" is required';
         }
         // if ((widget.label?.toLowerCase() ?? "")
         //     .contains("email")) {
         //   if (!emailRegex.hasMatch(value)) {
         //     return "email is badly formatted";
         //   }
         // }

         else {
           return null;
         }
       },
       style: TextStyle(fontSize: 14.sp),
       decoration: InputDecoration(
         isCollapsed: true,
         filled: true,
         errorMaxLines: 1,
         fillColor: widget.enabled!
             ? Colors.white
             : const Color(0xffF5F5F5),
         contentPadding:
         EdgeInsets.symmetric(horizontal: 5.sp, vertical: 13.sp),
         // constraints: BoxConstraints(
         //   maxHeight: 36.sp,
         // ),

         errorStyle: TextStyle(fontSize: 10.sp, height: 0.4.sp),
         hintStyle: TextStyle(fontSize: 14.sp),
         hintText: widget.hintText,
         suffixIcon: widget.isPasswordField!
             ? IconButton(
           onPressed: () {
             setState(() {
               showPassword = !showPassword;
             });
           },
           icon: Icon(
             showPassword
                 ? Icons.visibility
                 : Icons.visibility_off,
           ),
         )
             : widget.suffixIcon,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Color(0xffD8D5CD),
           ),
         ),
         disabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Color(0xffD8D5CD),
             width: 1,
           ),
         ),
         focusedErrorBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Colors.redAccent,
             width: 1,
           ),
         ),
         errorBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Colors.red,
             width: 1,
           ),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Color(0xffD8D5CD),
           ),
         ),
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(4.sp),
           borderSide: const BorderSide(
             color: Color(0xffD8D5CD),
           ),
         ),
       ),
     ),    );
  }
}

//    return SizedBox(
//       height: 58.sp,
//       child: Column(
//         children: [
//           widget.label == null
//               ? const SizedBox()
//               : Expanded(
//                   child: RequiredFieldLabel(
//                     isRequired: widget.isRequired!,
//                     title: widget.label!,
//                   ),
//                 ),
//           Expanded(
//             flex: 3,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: SizedBox(
//                 child: TextFormField(
//                   enabled: widget.enabled,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   obscureText: widget.isPasswordField! ? showPassword : false,
//                   controller: widget.controller,
//                   validator: !widget.isRequired!
//                       ? (value) {
//                           return null;
//                         }
//                       : (value) {
//                           if (value == null || value.isEmpty) {
//                             return '"${widget.label}" is required';
//                           }
//                           if ((widget.label?.toLowerCase() ?? "")
//                               .contains("email")) {
//                             if (!emailRegex.hasMatch(value)) {
//                               return "email is badly formatted";
//                             }
//                           } else {
//                             return null;
//                           }
//                           return null;
//                         },
//                   style: TextStyle(fontSize: 14.sp),
//                   decoration: InputDecoration(
//                     filled: true,
//                     errorMaxLines: 1,
//                     fillColor: widget.enabled!
//                         ? Colors.white
//                         : const Color(0xffF5F5F5),
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 5.sp, vertical: 0),
//                     constraints: BoxConstraints(
//                       maxHeight: 36.sp,
//                     ),
//                     errorStyle: TextStyle(fontSize: 8.sp, height: 0.2.sp),
//                     hintStyle: TextStyle(fontSize: 14.sp),
//                     hintText: widget.hintText,
//                     suffixIcon: widget.isPasswordField!
//                         ? IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 showPassword = !showPassword;
//                               });
//                             },
//                             icon: Icon(
//                               showPassword
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                           )
//                         : widget.suffixIcon,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Color(0xffD8D5CD),
//                       ),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Color(0xffD8D5CD),
//                         width: 1,
//                       ),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Colors.redAccent,
//                         width: 1,
//                       ),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Colors.red,
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Color(0xffD8D5CD),
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(4.sp),
//                       borderSide: const BorderSide(
//                         color: Color(0xffD8D5CD),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );