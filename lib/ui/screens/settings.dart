import 'package:ethel_ai_chat/global.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.only(top: 40, bottom: 18, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Configuración",
            style: TextStyle(
                color: EthelColors.infoSmall,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              ListTile(
                title: const Column(
                  children: [
                    Row(
                      children: [Text("Elegir modelo")],
                    ),
                    Row(
                      children: [
                        Text(
                          "Seleccione un LLM con el cual desee trabajar",
                          style: TextStyle(
                              fontSize: 12, color: EthelColors.unselected),
                        )
                      ],
                    )
                  ],
                ),
                trailing: const Icon(
                  Icons.chevron_right_outlined,
                  color: EthelColors.unselected,
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    ));
  }
}
