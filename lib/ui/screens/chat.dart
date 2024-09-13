// ignore_for_file: use_build_context_synchronously

import 'package:ethel_ai_chat/classes/app_preferences.dart';
import 'package:ethel_ai_chat/global.dart';
import 'package:ethel_ai_chat/ui/widgets/empty_state.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  late String selectedModel;

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  Future<String> sendPrompt(dynamic query) async {
    dynamic url;
    setState(() {
      test.add(ethelUser);
    });
    if (selectedModel == 'full') {
      url = Uri.parse(ethelFull);
    }
    if (selectedModel == 'basic') {
      url = Uri.parse(ethelBasic);
    }

    dynamic queryJson = await http.post(Uri.parse("$url"),
        body: json.encode({"pregunta": query.toString()}),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Accept": "application/json",
          'Authorization': dotenv.env['CLIENT_SECRET'].toString(),
          'Client': dotenv.env['CLIENT_ID'].toString(),
        }).timeout(const Duration(minutes: 5));

    dynamic status = queryJson.statusCode.toString();

    if (status != "200") {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Atención"),
              content: const Text("Hubo un problema al procesar la solicitud"),
              surfaceTintColor: Colors.white,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Aceptar",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            );
          });

      setState(() {
        test.clear();
      });
      return "No se pudo procesar la solicitud, contacte al proveedor del servicio.";
    } else {
      final queryParsed = json.decode(queryJson.body);

      setState(() {
        test.clear();
      });

      return queryParsed['respuesta'].toString();
    }
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
            body: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Chat(
                theme: const DefaultChatTheme(
                  inputBackgroundColor: EthelColors.brand,
                  backgroundColor: Color(0xffFAFAFA),
                ),
                messages: _messages,
                emptyState: SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Image.asset("images/ethel-ai-logo.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Ethel AI",
                          style: TextStyle(fontSize: 28),
                        ),
                        const SizedBox(
                          height: 30,
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
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      backgroundColor: const Color(0xffF7F6F9)),
                                  child: Text(
                                    question1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    _handleSendPressed(
                                        types.PartialText(text: question1));
                                  },
                                )),
                            SizedBox(
                                width: 190,
                                height: 88,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      backgroundColor: const Color(0xffF7F6F9)),
                                  child: Text(
                                    question2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    _handleSendPressed(types.PartialText(
                                      text: question2,
                                    ));
                                  },
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      backgroundColor: const Color(0xffF7F6F9)),
                                  child: Text(
                                    question3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    _handleSendPressed(
                                        types.PartialText(text: question3));
                                  },
                                )),
                            SizedBox(
                                width: 190,
                                height: 88,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      backgroundColor: const Color(0xffF7F6F9)),
                                  child: Text(
                                    question4,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    _handleSendPressed(types.PartialText(
                                      text: question4,
                                    ));
                                  },
                                )),
                          ],
                        ),
                      ],
                    ))
                  ],
                )),
                l10n: const ChatL10nEn(
                    inputPlaceholder: "Preguntale algo a la AI",
                    isTyping: "está escribiendo..."),
                typingIndicatorOptions: TypingIndicatorOptions(
                    typingUsers: test,
                    animationSpeed: const Duration(seconds: 1)),
                onSendPressed: _handleSendPressed,
                user: _user,
                showUserNames: true,
                showUserAvatars: true,
              ),
            )));
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
      dynamic answer;
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
