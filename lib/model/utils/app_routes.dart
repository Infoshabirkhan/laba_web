import 'package:flutter/material.dart';

import '../../view/screen/contact_screen/contact_screen.dart';

class AppRoutes {
  static const contactUs = '/contact_us';


  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      contactUs: (context) => const ContactScreen(),
    };
  }
}
