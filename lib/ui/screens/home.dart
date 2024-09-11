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
        elevation: 40.0,
        shadowColor: Colors.black,
        surfaceTintColor: const Color(0xfff5f6f5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'AI Chat',
              onPressed: () {
                onItemTapped(0);
              },
              icon: Icon(Symbols.mark_unread_chat_alt_rounded,
                  color: currentIndex == 0
                      ? EthelColors.selected
                      : EthelColors.unselected),
            ),
            IconButton(
              tooltip: 'App Settings',
              onPressed: () {
                onItemTapped(1);
              },
              icon: Icon(Icons.settings_outlined,
                  color: currentIndex == 1
                      ? EthelColors.selected
                      : EthelColors.unselected),
            )
          ],
        ),
      ),
    );
  }
}
