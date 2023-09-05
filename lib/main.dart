import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fp_test/model.dart';
import 'package:fp_test/second_page.dart';
import 'package:fp_test/utils/commons.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Model> values = [];
  getData() async {
    http
        .get(Uri.parse('http://coding-assignment.bombayrunning.com/data.json'))
        .then((response) {
      var data = jsonDecode(response.body);
      setState(() {
        values = List<Model>.from(data.map((model) => Model.fromJson(model)));
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (_, index) => ListTile(
                title: Text(values[index].name),
                subtitle: Text(
                  values[index].tag,
                  style: TextStyle(color: getColor(values[index].color)),
                ),
                onTap: () {
                  Navigator.push(
                      _,
                      MaterialPageRoute(
                          builder: (_) => SecondPage(data: values[index])));
                },
              )),
    );
  }
}
