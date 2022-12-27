import 'package:flutter/material.dart';

class UpcommingPage extends StatefulWidget {
  const UpcommingPage({Key? key}) : super(key: key);

  @override
  _UpcommingPage createState() => _UpcommingPage();
}

class _UpcommingPage extends State<UpcommingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('예정'),
      ),

      body: SafeArea(
        child: ListView(
          
        ),
      ),
    );
  }
}