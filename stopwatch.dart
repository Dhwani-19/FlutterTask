import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFuture extends StatefulWidget {
  const TestFuture({Key? key}) : super(key: key);

  @override
  State<TestFuture> createState() => _TestFutureState();
}

class _TestFutureState extends State<TestFuture> {
  List<int> logs = [1];
  var flag = 0;

  // Future<String> longTask() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   return "Task has been done";
  // }

  Stream<int> autoCounter() async* {
    int count = 1;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future builder"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          initialData: 1,
          stream: autoCounter(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return const Text("Some thing went wrong");
            }
            if (snapshot.data != null) {
              var textToDisplay = snapshot.data.toString();
              var result = snapshot.data! % 20;
              if (result == 0) {
                logs.add(snapshot.data!);
                if (logs.length-1 == 15) {
                  // textToDisplay = "Time Out";
                  flag = 1;
                  print("Time Out");
                }
              }
              if(flag == 1){
                return const Text("Time Out");
              }else{
                return Text(textToDisplay);
              }
            }
            return const Text("Starting...");
          },
        ),
      ),
    );
  }
}
