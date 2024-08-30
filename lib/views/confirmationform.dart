import 'package:flutter/material.dart';

class ConfirmationForm extends StatefulWidget {
  final Map<String, String> content;

  const ConfirmationForm({required this.content, super.key});

  @override
  State<ConfirmationForm> createState() => _ConfirmationFormState();
}

class _ConfirmationFormState extends State<ConfirmationForm> {
  final TextEditingController _ctrlStudentID =
      TextEditingController(text: '1234567');
  final TextEditingController _ctrlLName =
      TextEditingController(text: 'DELA CRUZ');
  final TextEditingController _ctrlFName = TextEditingController(text: 'JUAN');
  final TextEditingController _ctrlMName = TextEditingController(text: ' ');
  final TextEditingController _ctrlCourse = TextEditingController(
      text: 'BSCS Bachelor Of Science in Computer Science');
  final TextEditingController _ctrlAddress =
      TextEditingController(text: 'P2, HABAG, LANUZ, SURIGAO DEL SUR');
  final TextEditingController _ctrlBday =
      TextEditingController(text: 'January 01, 1999');

  @override
  void initState() {
    super.initState();
    _ctrlStudentID.text = widget.content['Student ID No.'] ?? "";
    String nameParse = widget.content['Name'] ?? "";
    _ctrlFName.text = nameParse.split(',').first;
    _ctrlLName.text =
        nameParse.split(',').length >= 2 ? nameParse.split(',')[1] : "";
    _ctrlCourse.text = widget.content['Course'] ?? "";
    _ctrlAddress.text = widget.content['Permanent Address'] ?? "";
    _ctrlBday.text = widget.content['Birthday'] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    var container = SizedBox(
      width: scrWidth,
      height: scrHeight,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: SizedBox(
              width: scrWidth,
              height: scrHeight * 0.1,
              child: TextField(
                controller: _ctrlFName,
                decoration: const InputDecoration(label: Text('First Name')),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              width: scrWidth,
              height: scrHeight * 0.1,
              child: TextField(
                controller: _ctrlMName,
                decoration: const InputDecoration(label: Text('Middle Name')),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              width: scrWidth,
              height: scrHeight * 0.1,
              child: TextField(
                controller: _ctrlLName,
                decoration: const InputDecoration(label: Text('Last Name')),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              width: scrWidth,
              height: scrHeight * 0.1,
              child: TextField(
                controller: _ctrlCourse,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  label: Text('Course'),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              width: scrWidth,
              height: scrHeight * 0.1,
              child: TextField(
                controller: _ctrlAddress,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(label: Text('Address')),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: scrWidth * 0.45,
                  height: scrHeight * 0.1,
                  child: TextField(
                    controller: _ctrlStudentID,
                    decoration:
                        const InputDecoration(label: Text('Student ID: ')),
                  ),
                ),
                SizedBox(
                  width: scrWidth * 0.45,
                  height: scrHeight * 0.1,
                  child: TextField(
                    controller: _ctrlBday,
                    decoration:
                        const InputDecoration(label: Text('Birthday: ')),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            margin: const EdgeInsets.only(top: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton.filled(
                    onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm Entry',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Calibre',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(child: container),
    );
  }
}
