import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(const SafeShakeApp());
}

class SafeShakeApp extends StatelessWidget {
  const SafeShakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeShake Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShakeCounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShakeCounterPage extends StatefulWidget {
  const ShakeCounterPage({super.key});

  @override
  State<ShakeCounterPage> createState() => _ShakeCounterPageState();
}

class _ShakeCounterPageState extends State<ShakeCounterPage> {
  int _count = 0;
  ShakeDetector? _detector;

  @override
  void initState() {
    super.initState();


    _detector = ShakeDetector.autoStart(
      onPhoneShake: (event) {
        setState(() {
          _count++;
        });
      },
    );
  }

  @override
  void dispose() {
    _detector?.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeShake Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Shake Count: $_count',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
