import 'package:flutter/material.dart';

class KeyboardConfig extends StatefulWidget {
  const KeyboardConfig ({Key? key}) : super (key: key);
  @override
  State<KeyboardConfig> createState() => _KeyConfigState();
}

class _KeyConfigState extends State<KeyboardConfig> {
  @override
  Widget build(BuildContext context) {
    const title = 'Keyboard Configurator';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: SizedBox(
              height: 100,
              child: Text(title, style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),),
            ),
          )
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,

            child: Column(
              children: [
                Row(
                  children: const [
                    MyStatefulWidget()
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'AZERTY';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
      items: <String>['AZERTY', 'QWERTY', 'BEPO']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


