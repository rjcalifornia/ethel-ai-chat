import 'package:ethel_ai_chat/classes/app_preferences.dart';
import 'package:ethel_ai_chat/global.dart';
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
        padding:
            const EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Modelos disponibles",
              style: TextStyle(
                  color: EthelColors.infoSmall,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            RadioListTile<String>(
              value: 'full',
              groupValue: selectedModel,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return EthelColors.selected;
                }
                return EthelColors.unselected;
              }),
              onChanged: (String? value) {
                setState(() {
                  selectedModel = value.toString();
                });
                setModel(value.toString());
              },
              title: const Text(
                'Ethel Full AI',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: EthelColors.hof),
              ),
              subtitle: const Text(
                'El LLM más completo, entrenada con información hasta Junio de 2024 (Recomendado),',
                style: TextStyle(color: EthelColors.infoSmall),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            RadioListTile<String>(
              value: 'basic',
              groupValue: selectedModel,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return EthelColors.selected;
                }
                return EthelColors.unselected;
              }),
              onChanged: (String? value) {
                setState(() {
                  selectedModel = value.toString();
                });
                setModel(value.toString());
              },
              title: const Text(
                'Ethel Basic AI',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: EthelColors.hof),
              ),
              subtitle: const Text(
                'Altamente experimental. LLM en proceso de entrenamiento para adaptarlo a Latinoamérica. Usar con discreción.',
                style: TextStyle(color: EthelColors.infoSmall),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
