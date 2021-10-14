import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var response;
              try {
                var result = await MethodChannel('flutter.native/helper')
                    .invokeMethod('helloFromNativeCode');
                response = result;

                print(result);
              } on PlatformException catch (e) {
                response = "Failed to Invoke: '${e.message}'.";
              }
            },
            child: Text('Click Here')),
      ),
    );
  }
}
