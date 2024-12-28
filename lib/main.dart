import 'package:finance_digest/locator.dart';
import 'package:finance_digest/src/presentation/demo/views/demo.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Digest',
      home: DemoPage(),
    );
  }
}
