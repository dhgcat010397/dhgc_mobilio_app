import 'package:flutter/material.dart';
import 'package:dhgc_mobilio_app/src/app.dart';
import 'package:dhgc_mobilio_app/src/services/dependencies_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init();

  runApp(const MyApp());
}
