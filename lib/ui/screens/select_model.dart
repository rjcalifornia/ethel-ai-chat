import 'package:flutter/material.dart';

class SelectModelScreen extends StatefulWidget {
  const SelectModelScreen({super.key});

  @override
  State<SelectModelScreen> createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.chevron_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(),
    ));
  }
}
