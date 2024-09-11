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
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Acerca de',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ExpansionTile(
                  title: const Text("Ethel AI"),
                  iconColor: EthelColors.selected,
                  collapsedIconColor: EthelColors.unselected,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: 100,
                        child: Image.asset("images/ethel-ai-logo.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Ethel AI Chat',
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      'Build 09.11.2024.001',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
