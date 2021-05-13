import 'package:decnnect/testController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: testController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("다른화면"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${_.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _.decrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.delete),
            ),
          );
        });
  }
}
