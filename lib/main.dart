import 'package:flutter/material.dart';
import 'package:software_prototype/ui/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ui/home.dart';

//main method to run application
Future<void> main() async {
  //connection to firebase database
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: divide_conquer(),
  ));
}
