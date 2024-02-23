import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/cubits/contact_us/contact_us_cubit.dart';
import 'firebase_options.dart';
import 'model/utils/app_routes.dart';
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactUsCubit())
        ],
        child: MaterialApp(

          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.contactUs ,
          routes: AppRoutes.getRoutes(),
        ),
      ),
    );
  }
}

