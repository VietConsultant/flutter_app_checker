import 'package:app_checker/app_checker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = 'Please click the button to check app installation';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Checker'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              String schema =
                  "spotify://"; // Replace with the desired app's schema
              bool isInstalled = await AppChecker.isAppInstalled(schema);
              String message =
                  isInstalled ? 'App is installed' : 'App is not installed';
              setState(() {
                this.message = message;
              });
            },
            child: Text(message),
          ),
        ),
      ),
    );
  }
}
