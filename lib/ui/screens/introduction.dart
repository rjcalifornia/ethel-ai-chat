import 'package:ethel_ai_chat/global.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 22,
            ),
            Center(
              child: SizedBox(
                width: 360,
                child: Image.asset("images/ethel-ai-logo.png"),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text("Explora el poder de la",
                style: TextStyle(
                    color: Color(0xff26272A),
                    fontSize: 24,
                    fontWeight: FontWeight.normal)),
            const Text("Inteligencia Artificial",
                style: TextStyle(
                    color: Color(0xff26272A),
                    fontSize: 24,
                    fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Analiza. Crea. Innova. Descubre.",
              style: TextStyle(
                  color: EthelColors.infoSmall,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 386,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: EthelColors.brand,
                ),
                child: const Text(
                  "Iniciar ahora",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            SizedBox(
              width: 380,
              child: Text(
                license_1,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: EthelColors.infoSmall, fontSize: 10),
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
                style:
                    const TextStyle(color: EthelColors.infoSmall, fontSize: 10),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
