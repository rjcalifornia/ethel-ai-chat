// ignore_for_file: use_build_context_synchronously

import 'package:ethel_ai_chat/global.dart';
import 'package:ethel_ai_chat/ui/widgets/emptyState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'dart:math';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final ethelUser = const types.User(
      id: '2c7a057c-e9f5-411a-8ba1-0f7c7384a70b', firstName: 'Ethel AI');
  List<types.User> test = [];
  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  Future<String> sendPrompt(dynamic query) async {
    setState(() {
      test.add(ethelUser);
    });
    dynamic queryJson = await http.post(
        Uri.parse(
            'http://10.0.2.2:8000/api/v1/ethel-ia/full/procesar-consulta'),
        body: json.encode({"pregunta": query.toString()}),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Accept": "application/json",
          'Authorization': '14dbd762-2487-4d13-9d97-58cbb8f95c89',
          'Client': '6a696a4d-5d9d-402f-aac1-c7157655ca93',
        }).timeout(const Duration(minutes: 5));

    final queryParsed = json.decode(queryJson.body);

    setState(() {
      test.clear();
    });

    return queryParsed['respuesta'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Chat(
            theme: const DefaultChatTheme(
              inputBackgroundColor: EthelColors.brand,
            ),
            messages: _messages,
            emptyState: EmptyStateWidget(),
            l10n: const ChatL10nEn(
              inputPlaceholder: "Preguntale algo a la AI",
            ),
            typingIndicatorOptions: TypingIndicatorOptions(
                typingUsers: test, animationSpeed: const Duration(seconds: 1)),
            onSendPressed: _handleSendPressed,
            user: _user,
            showUserNames: true,
            showUserAvatars: true,
          ),
        ));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);

    try {
      var answer;
      answer = await sendPrompt(message.text);
      final response = types.TextMessage(
        author: ethelUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: answer,
      );
      _addMessage(response);
    } catch (e) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Atención"),
              content: const Text("Ha ocurrido un error. Intente nuevamente"),
              surfaceTintColor: Colors.white,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Aceptar",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            );
          });
    }
  }
}
