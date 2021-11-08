import 'package:flutter/material.dart';
import 'package:string_to_hex/string_to_hex.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynammic color',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _backgroundColor = int.parse('ffffffff', radix: 16);

  void changeColor() async {
    // flask local host 
    var url = Uri.parse('http://localhost:5000');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body); // decode response
      setState(() {
        // set new hex code 
        _backgroundColor = int.parse(data['hex_code'], radix: 16);
      });
    } else {
        throw Exception('Failed to change color');
    }
    // update backgroud color
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(_backgroundColor),
      body: Center(
        child: ElevatedButton(
          //padding: const EdgeInsets.all(40),
          onPressed: changeColor, 
          child: Text(
            'Change Color',
            style: TextStyle(
              color: Colors.black,
            ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )
        )

      ),
      ),
    );
  }
}
