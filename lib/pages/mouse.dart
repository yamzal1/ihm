import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MouseConfig extends StatefulWidget {
  const MouseConfig({Key? key}) : super(key: key);

  @override
  State<MouseConfig> createState() => _MouseConfigState();
}

class _MouseConfigState extends State<MouseConfig> {
  int _mouseSensitivity = 0;
  bool _checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: SizedBox(
              height: 100,
              child: Text(
                "Mouse configurator",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          toolbarHeight: 100,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Mouse Sensitivity",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SfSlider(
                        min: 0,
                        max: 10,
                        stepSize: 1,
                        value: _mouseSensitivity,
                        onChanged: (dynamic value) {
                          setState(() {
                            _mouseSensitivity = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      _mouseSensitivity.toString(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _checkBoxValue,
                        onChanged: (value) {
                          setState(() {
                            _checkBoxValue = value!;
                          });
                        }),
                    const Text("Mouse Acceleration")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Multiply the cursor sensitivity relatively to the force applied to the mouse.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                        ),
                      )
                    ],
                  ),
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
      ),
    );
  }
}
