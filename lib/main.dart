import 'package:flutter/material.dart';

import 'ecran2.dart';
import 'pages/Ecran3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _keyboardSwitch = false;
  var _mouseSwitch = false;
  var _desktopSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: [
            const Text(
              'Configurator',
              style: TextStyle(fontSize: 40.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 128.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildRow('keyboard', 0),
                  buildRow('mouse', 1),
                  buildRow('desktop', 2),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xff009e49),
                              ),
                              onPressed: () => {},
                              child: const Text(
                                'RUN',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xfffff100),
                              ),
                              onPressed: () => {},
                              child: const Text(
                                'SAVE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildRow(name, int _switchValue) {
    return SizedBox(
      width: 400,
      child: Row(
        children: [
          Switch(
            value: (_switchValue == 0)
                ? _keyboardSwitch
                : (_switchValue == 1)
                    ? _mouseSwitch
                    : _desktopSwitch,
            activeColor: const Color(0xFF6200EE),
            onChanged: (bool value) => {
              setState(() {
                if (_switchValue == 0) {
                  _keyboardSwitch = value;
                } else if (_switchValue == 1) {
                  _mouseSwitch = value;
                } else {
                  _desktopSwitch = value;
                }
              })
            },
          ),
          Text(name),
          const Spacer(
            flex: 4,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Card(
              color: const Color(0xff0018ff),
              child: InkWell(
                onTap: () {
                  if (_switchValue == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KeyboardConfig()),
                    );
                  } else if (_switchValue == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MouseConfig()),
                    );
                  } else {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const KeyboardConfig()),
                    // );
                  }
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
