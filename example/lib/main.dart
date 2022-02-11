import 'package:flutter/material.dart';
import 'package:responsive_one/responsive_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: const [
              ListTile(
                title: Text('Element 1'),
              ),
              ListTile(
                title: Text('Element 2'),
              ),
              ListTile(
                title: Text('Element 3'),
              ),
              ListTile(
                title: Text('Element 4'),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Hello, world!'),
        ));
  }
}
