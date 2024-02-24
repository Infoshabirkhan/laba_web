import 'package:flutter/material.dart';
import 'package:laba_web/view/screen/download_app_screen.dart';

import '../../view/screen/contact_screen/contact_screen.dart';

class AppRoutes {
  static const contactUs = '/contact_us';
  static const downloadScreen = '/';


  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      contactUs: (context) => const ContactScreen(),
      downloadScreen: (context) => const DownloadAppScreen(),
    };
  }
}
