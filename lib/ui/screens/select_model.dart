import 'package:ethel_ai_chat/classes/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectModelScreen extends StatefulWidget {
  const SelectModelScreen({super.key});

  @override
  State<SelectModelScreen> createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
  late String selectedModel;

  void setModel(String modelName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("model_selected", modelName);
  }

  @override
  void initState() {
    selectedModel = AppPreferences.getModelSelected() ?? 'full';
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            RadioListTile<String>(
              value: 'full',
              groupValue: selectedModel,
              onChanged: (String? value) {
                setState(() {
                  selectedModel = value.toString();
                });
                setModel(value.toString());
              },
              title: const Text('Pickles'),
              subtitle: const Text('Supporting text'),
            ),
          ],
        ),
      ),
    ));
  }
}
