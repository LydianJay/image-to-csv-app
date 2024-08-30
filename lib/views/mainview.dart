import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:imgtextcsv/views/confirmationform.dart';
import 'package:to_csv/to_csv.dart' as exportCSV;

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Image? img;
  final _picker = ImagePicker();
  final textRecognizer = TextRecognizer();
  void _parseImage(String imgPath, BuildContext context) async {
    final RecognizedText recognizedText =
        await textRecognizer.processImage(InputImage.fromFilePath(imgPath));
    List<List<String>> stringParsed = [];
    List<String> list = [];
    final List<String> headers = [
      'Student ID No.',
      'Course',
      'Permanent Address',
      'Birthday'
    ];

    Map<String, String> map = {};

    for (TextBlock block in recognizedText.blocks) {
      final text = block.text;

      bool contains = headers.any((word) => text.contains(word));
      if (contains) {
        if (text.contains(':')) {
          final splitted = text.split(':');
          if (splitted.length > 1 && !splitted.first.contains('Complete')) {
            final val = splitted[1];
            final key = splitted.first.trimRight();
            debugPrint("Key: [$key]  Value: [$val]");
            map[key] = val;
            list.add(val);
          }
        }
      } else if (text.contains(',') &&
          text.contains('.') &&
          !text.contains('TANDAG')) {
        debugPrint("name: $text");
        map['Name'] = text;
      }
    }
    headers.insert(0, 'Name');
    // stringParsed.add(map.values.toList());
    // exportCSV.myCSV(headers, stringParsed);
    //debugPrint(map.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConfirmationForm(content: map)));
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
                            _parseImage(file!.path, context);
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
