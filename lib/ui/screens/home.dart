import 'package:ethel_ai_chat/global.dart';
import 'package:ethel_ai_chat/ui/screens/chat.dart';
import 'package:ethel_ai_chat/ui/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [const ChatScreen(), const SettingsScreen()];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EthelColors.mainBackground,
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomAppBar(
        elevation: 48.0,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                tooltip: 'AI Chat',
                onPressed: () {
                  onItemTapped(0);
                },
                icon: const Icon(Symbols.chat_bubble_outline_rounded)),
            IconButton(
                tooltip: 'App Settings',
                onPressed: () {
                  onItemTapped(1);
                },
                icon: const Icon(Symbols.settings))
          ],
        ),
      ),
    );
  }
}
