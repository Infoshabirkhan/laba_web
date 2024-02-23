import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controller/cubits/contact_us/contact_controllers.dart';

class ContactUsRepo{
static var docRef =   FirebaseFirestore.instance.collection('UserRequest');


  static Future<bool> submitRequest()async{

   try {
     await docRef.add(ContactController.controller);
     return true;
   } on Exception catch (e) {
     rethrow;
     // TODO
   }



  }
}