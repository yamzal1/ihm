import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyboardConfig extends StatefulWidget {
  const KeyboardConfig({Key? key}) : super(key: key);

  @override
  State<KeyboardConfig> createState() => _KeyboardConfigState();
}

class _KeyboardConfigState extends State<KeyboardConfig> {
  bool _checkBoxValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'AZERTY (French)';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: SizedBox(
            height: 50,
            child: Text(
              "Keyboard configurator",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                Flexible(
                  flex: 1,
                  child: DropdownButton<String>(
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
                    items: <String>['AZERTY (French)', 'QWERTY (US - International)', '...']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
                ],
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
                  Checkbox(
                      value: _checkBoxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkBoxValue = value!;
                        });
                      }),
                  const Text("Sticky Keys")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "Makes key combination sequential rather than simultaneous.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.5,
                      ),
                    ),
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
    );
  }
}
