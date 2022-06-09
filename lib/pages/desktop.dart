import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DesktopConfig extends StatefulWidget {
  const DesktopConfig({Key? key}) : super(key: key);

  @override
  State<DesktopConfig> createState() => _DesktopConfigState();
}

class _DesktopConfigState extends State<DesktopConfig> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = '1 minutes';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: SizedBox(
            height: 50,
            child: Text(
              "Desktop configurator",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
        ),
        toolbarHeight: 50,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Choose a wallpaper'),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                  } else {
                    // User canceled the picker
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:  [
                    Column(
                      children: [
                        Text("Turn off after"),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[  '1 minutes',
                                            '2 minutes',
                                            '3 minutes',
                                            '5 minutes',
                                            '10 minutes',
                                            '15 minutes',
                                            '20 minutes',
                                            '25 minutes',
                                            '30 minutes',
                                            '45 minutes',
                                            '1 hour',
                                            '2 hours',
                                            '3 hours',
                                            '4 hours',
                                            '5 hours',
                                            'Never',
                          ]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Go to sleep after"),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[  '1 minutes',
                            '2 minutes',
                            '3 minutes',
                            '5 minutes',
                            '10 minutes',
                            '15 minutes',
                            '20 minutes',
                            '25 minutes',
                            '30 minutes',
                            '45 minutes',
                            '1 hour',
                            '2 hours',
                            '3 hours',
                            '4 hours',
                            '5 hours',
                            'Never',
                          ]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Container(

                    ),
                  ),

                ],
              ),


              Row(
                children: [
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm'),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
