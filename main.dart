import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'this is title',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();

  String text = '';

  getText(){
    setState(() {
      text = myController.text;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Task 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(hintText: 'Enter Text Here'),
              ),
            ),
            ElevatedButton(onPressed: getText, child: const Text('Click here to get the text')),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child :
                Text(text, style: const TextStyle(fontSize: 20))
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(context: context, builder: (context){
          return AlertDialog(
            content: Text(myController.text),
          );
        });
      },
      ),
    );
  }
}
