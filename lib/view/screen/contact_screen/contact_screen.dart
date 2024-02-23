import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/cubits/contact_us/contact_controllers.dart';
import '../../../controller/cubits/contact_us/contact_us_cubit.dart';
import '../../widget/my_drop_down.dart';
import '../../widget/my_text_field.dart';
import '../../widget/required_field_label.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController requestForController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController description = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Contact us'),
      ),

      //      allow read, write:if request.auth !=null;
      body: BlocListener<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsLoading) {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      width: 400.sp,
                      height: 100.sp,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                });
          }if(state is ContactUsLoaded){
            Navigator.of(context).pop();
            showDialog(context: context, builder: (context){
              return Dialog(
                child: Container(
                  width: 0.4.sw,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20.sp,),
                      Center(child: Text('Thanks for submitting',style: GoogleFonts.mulish(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600
                      ),)),
                      SizedBox(height: 20.sp,),
                      Center(child: Text('You will be inform in 3-4 working days',style: GoogleFonts.mulish(
                          fontSize: 16.sp,
                      ),)),
                      SizedBox(height: 20.sp,),

                      Container(height: 40.sp,
                        child: ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Cancel"),),
                      ),
                      SizedBox(height: 20.sp,),

                    ],
                  ),
                ),
              );
            });
          }
          if(state is ContactUsError){
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: state.error);
          }
          // TODO: implement listener
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Text(
              'Please Enter your detail',
              style: GoogleFonts.mulish(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(100),
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                ),
                width: 550.sp,
                child: Form(
                  key: formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      const RequiredFieldLabel(title: 'Your name'),
                      MyTextField(
                        controller: nameController,
                        label: 'Name',
                        hintText: 'Enter your name',
                      ),
                      const RequiredFieldLabel(title: 'Request for'),
                      MyDropDownButton(
                        items: ['Account Deletion', 'Feedback'],
                        onChange: (x) {
                          requestForController.text = x ?? '';
                        },
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      const RequiredFieldLabel(title: 'Email'),
                      SizedBox(
                        height: 4.sp,
                      ),
                      MyTextField(
                        controller: emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                      ),
                      const RequiredFieldLabel(
                        title: 'Message',
                        isRequired: false,
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      MyTextField(
                        maxLines: 3,
                        isRequired: false,
                        controller: description,
                        label: 'Description',
                        hintText: 'Type here....',
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        height: 40.sp,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ContactController.controller['user_name'] =
                                  nameController.text.trim();
                              ContactController.controller['request_for'] =
                                  requestForController.text.isEmpty
                                      ? 'Account Deletion'
                                      : requestForController.text.trim();
                              ContactController.controller['email'] =
                                  emailController.text.trim();
                              ContactController.controller['message'] =
                                  description.text.trim();

                              context.read<ContactUsCubit>().submitForm();
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Please fill the required fields');
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
