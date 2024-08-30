import 'package:ethel_ai_chat/ui/screens/home.dart';
import 'package:ethel_ai_chat/ui/screens/introduction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const EthelChat());
}

class EthelChat extends StatefulWidget {
  const EthelChat({super.key});

  @override
  State<EthelChat> createState() => _EthelChatState();
}

class _EthelChatState extends State<EthelChat> {
  late Future<bool> verifyWelcome;
  @override
  void initState() {
    super.initState();
    verifyWelcome = welcomeVerification();
  }

  Future<bool> welcomeVerification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("seen")) {
      return false;
    } else {
      //prefs.setBool("seen", true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ethel Chat',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xffF3F5F6),
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
      ),
      home: FutureBuilder(
          future: verifyWelcome,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data!) {
                return const HomeScreen();
              } else {
                return const IntroductionScreen();
              }
            } else {
              return Container();
            }
          }),
      routes: {'home': (context) => const HomeScreen()},
    );
  }
}
