import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Image? img;
  final _picker = ImagePicker();
  final textRecognizer = TextRecognizer();
  void _parseImage(String imgPath) async {
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(imgPath));

    for (TextBlock block in recognizedText.blocks) {
      final text = block.text;
      debugPrint(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: scrWidth,
            height: scrHeight,
            child: img ?? const Icon(Icons.hide_image),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: IconButton.filled(
                        onPressed: () async {
                          final file = await _picker.pickMedia();

                          setState(() {
                            img = Image.file(File(file!.path));
                            _parseImage(file!.path);
                          });
                        },
                        icon: const Icon(Icons.image),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
