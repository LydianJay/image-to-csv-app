import 'package:flutter/material.dart';
import 'package:imgtextcsv/app.dart';
import 'package:window_manager/window_manager.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      maximumSize: Size(800, 600),
      center: false,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: false,
      title: "Image To CSV");
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp( const MyApp());
}

