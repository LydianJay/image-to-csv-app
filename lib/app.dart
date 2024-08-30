import 'package:flutter/material.dart';
import 'package:imgtextcsv/views/cameraview.dart';
import 'package:imgtextcsv/views/mainview.dart';
import 'package:camera/camera.dart';

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({required this.cameras, super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  CameraView(cameras: cameras),
    );
  }
}