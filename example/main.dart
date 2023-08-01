import 'package:flutter/material.dart';
import 'package:toast_notification/ToasterController.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Toast Notification Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ToasterController toasterController = ToasterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stack(children: [
          Center(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue)),
                    onPressed: () {
                      ToastMe(
                        controller: toasterController,
                        text: "Hello world",
                        type: ToasterType.Check,
                      ).showToast(context);
                    },
                    child: const Text(
                      "Without Duration",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue)),
                    onPressed: () {
                      toasterController.end();
                    },
                    child: const Text(
                      "Close Toast without Duration",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue)),
                    onPressed: () {
                      ToastMe(
                              text: "Hello World",
                              type: ToasterType.Error,
                              duration: 2000)
                          .showToast(context);
                    },
                    child: const Text(
                      "Toast with 2 Seconds Duration",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ))
        ]));
  }
}
