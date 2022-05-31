import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../theme/appcolors.dart';

class MouseConfig extends StatefulWidget {
  const MouseConfig({Key? key}) : super(key: key);

  @override
  State<MouseConfig> createState() => _MouseConfigState();
}

class _MouseConfigState extends State<MouseConfig> {
  final SensiController = TextEditingController();

  int _sensibiliteSouris = 0;
  bool checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.blanc,
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.blanc,
            title: Center(
              child: SizedBox(
                height: 100,
                child: Text(
                  "Mouse configurator",
                  style: TextStyle(
                    color: AppColors.noir,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            toolbarHeight: 100,
          ),
          backgroundColor: AppColors.blanc,
          body: Center(
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.55, //largeur de la row

              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Mouse Sensivity",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.5, //largeur du slider
                        child: SfSlider(
                          min: 0,
                          max: 10,
                          stepSize: 1,
                          value: _sensibiliteSouris,
                          onChanged: (dynamic value) {
                            setState(() {
                              _sensibiliteSouris = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        _sensibiliteSouris.toString(),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          onChanged: (value) {
                            setState(() {
                              checkBoxValue = value!;
                            });
                          }),
                      Text("Mouse Acceleration")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Multiplise the cursor sensitivity relatively to the force applied to the mouse.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.5,
                          ),)
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
        ));
  }
}
