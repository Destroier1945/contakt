import 'package:flutter/material.dart';

class SplasshScreen extends StatefulWidget {
  const SplasshScreen({super.key});
  @override
  State<SplasshScreen> createState() => _SplasshScreenState();
}

class _SplasshScreenState extends State<SplasshScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Carregando dados...")
        ],
      )),
    );
  }
}
