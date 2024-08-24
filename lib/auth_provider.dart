import 'dart:convert';

import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rtc_with_agora_sdk/appInfo/app_key.dart';

final loginProvider =
    ChangeNotifierProvider<LoginProvider>((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  bool isLogin = false;
  // final String _name = "-";
  // final String _pswd = "";
  // final String _id = "";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  void initAgora() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
  }

  Future<bool> createChatUser() async {
    // final token = await fetchChatAppTokenFromGithub();
    const token =
        "007eJxTYAhdJtqwOHzxE7b4B7bLS6us8iX//pbaUSqXlL1dTm+v+hIFBjMDMwNTw9Rki2QDMxMTg6SkFCA3JSkNKGaemJaaNi/hZFpDICMD91x7RkYGVgZGBiYGEJ+BAQBHZhy0";
    const String apiUrl = 'https://a61.chat.agora.io/611016275/1186647/users';
    // if (token != null) {
    String trueToken = token;
    final Map<String, String> headers = {
      'Authorization': 'Bearer $trueToken',
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> requestBody = {
      "username": phController.text,
      "password": pswController.text,
      "nickname": nameController.text,
    };
    final response = await http
        .post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(requestBody),
    )
        .catchError((onError) {
      throw Exception('Failed to load agora create user');
    });
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result["entities"].toString().isNotEmpty) {
        final bool msg = result["entities"][0]["activated"];
        return msg;
      }
    }
    // }
    return false;
  }

  Future<bool> signIn() async {
    try {
      await ChatClient.getInstance
          .login(phController.text, pswController.text, true);

      // _addLogToConsole("login succeed, userId: ${_phNo}");
    } on ChatError catch (e) {
      // _addLogToConsole("login failed, code: ${e.code}, desc: ${e.description}");

      return false;
    }
    return true;
  }

  void _signOut() async {
    //   try {
    //     await ChatClient.getInstance.logout(true);
    //     _addLogToConsole("sign out succeed");
    //   } on ChatError catch (e) {
    //     _addLogToConsole(
    //         "sign out failed, code: ${e.code}, desc: ${e.description}");
    //   }
  }
}
