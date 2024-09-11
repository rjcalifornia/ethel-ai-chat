import 'package:ethel_ai_chat/global.dart';
import 'package:ethel_ai_chat/ui/screens/select_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final Uri url =
        Uri.parse('https://github.com/rjcalifornia/KCalc/blob/master/LICENSE');
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectModelScreen()),
                ),
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
                  title: const Text("Ethel AI Chat"),
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
                    Link(
                      uri: url,
                      target: LinkTarget.blank,
                      builder: (BuildContext ctx, FollowLink? openLink) {
                        return TextButton.icon(
                          onPressed: openLink,
                          label: const Text(
                            'Lee la licencia',
                            style: TextStyle(color: EthelColors.brand),
                          ),
                          icon: const Icon(
                            Icons.book_outlined,
                            color: EthelColors.brand,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 380,
                      child: Text(
                        license_1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: EthelColors.infoSmall, fontSize: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 380,
                      child: Text(
                        license_2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: EthelColors.infoSmall, fontSize: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
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
