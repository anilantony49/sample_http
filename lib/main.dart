import 'package:flutter/material.dart';
import 'package:sample_https/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
    );
  }
}

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String _resultText= 'Type the number and press the button to get result';
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter a number", border: OutlineInputBorder()),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    displayFact();
                  },
                  child: const Text('Get Fact')),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(_resultText),
             ),
          ],
        ),
      ),
    );
  }

  Future<void> displayFact() async {
    final _number = textcontroller.text;
    if (_number.isEmpty) {
      return;
    }
 final _result=  await getNumberFact(number: _number);
 setState(() {
   _resultText=_result.text!;
 });
 print(_result.text);
  }
}
