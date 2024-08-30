import 'package:flutter/material.dart';
import 'package:imgtextcsv/app.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp( MyApp(cameras: cameras,));
}

