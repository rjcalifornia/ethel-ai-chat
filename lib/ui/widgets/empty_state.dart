import 'package:flutter/material.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({super.key});

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Center(
            child: Column(
          children: [
            SizedBox(
              width: 200,
              child: Image.asset("images/ethel-ai-logo.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Ethel AI",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 40,
            ),
            const Icon(
              Icons.book_outlined,
              size: 40,
            ),
            const Text(
              "Ejemplos",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 190,
                    height: 88,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: const Color(0xffF7F6F9)),
                      child: const Text(
                        "¿Quien es el Presidente de El Salvador?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    )),
                SizedBox(
                    width: 190,
                    height: 88,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: const Color(0xffF7F6F9)),
                      child: const Text(
                        "Dame el codigo para crear una funcion asincrona en NodeJS.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    )),
              ],
            )
          ],
        ))
      ],
    );
  }
}
