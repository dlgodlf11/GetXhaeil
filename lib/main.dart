import 'package:decnnect/testController.dart';
import 'package:decnnect/testpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Colors.green),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
      // NOTE: Optional - use themeMode to specify the startup theme
      themeMode: ThemeMode.system,

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController text = new TextEditingController();
  var testC = Get.find<testController>();

  @override
  Widget build(BuildContext context) {
    print(testC);
    return GetX(
        init: testController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
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
                  TextButton(
                      onPressed: () {
                        Get.to(TestPage());
                      },
                      child: Text("다른페이지")),
                  TextField(
                    controller: text,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => TextButton(
                            onPressed: () {
                              if (text.text == "") {
                                _.addTodo(text.text);
                                text.clear();
                              }
                              print(testC.counter);
                            },
                            child: Text("넣기")),
                      )
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    child: ListView.builder(
                        itemCount: _.todo.length,
                        itemBuilder: (context, index) {
                          return Text(_.todo[index]);
                        }),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _.incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
