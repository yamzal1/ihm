import 'package:flutter/material.dart';

import 'pages/keyboard.dart';
import 'pages/mouse.dart';

import '../theme/appColors.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: SizedBox(
            height: 100,
            child: Text(
              "Configurator",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Center(
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
                          backgroundColor: AppColors.green,
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
                          backgroundColor: AppColors.yellow,
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
            activeColor: AppColors.blue,
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
              color: AppColors.blue,
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
