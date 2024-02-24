import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadAppScreen extends StatelessWidget {
  const DownloadAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Text("You don't have Laba mobile App?",style: TextStyle(
              fontSize: 20.sp
            ),),

            SizedBox(height: 20.sp,),
            ElevatedButton(onPressed: (){}, child: Text('Download it now'))
          ],
        ),
      ),
    );
  }
}
