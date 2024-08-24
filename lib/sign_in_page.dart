import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rtc_with_agora_sdk/appInfo/app_key.dart';
import 'package:rtc_with_agora_sdk/all_user_page.dart';
import 'package:rtc_with_agora_sdk/auth_provider.dart';
import 'package:rtc_with_agora_sdk/custom_buttom.dart';
import 'package:rtc_with_agora_sdk/custom_text_field.dart';
import 'package:rtc_with_agora_sdk/extension.dart';
import 'package:rtc_with_agora_sdk/sign_up_page.dart';
import 'package:rtc_with_agora_sdk/super_scaffold.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    initAgora();
    super.initState();
  }

  void initAgora() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SuperScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SignInForm(),
    ));
  }
}

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.read(loginProvider);
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                // final mailError = ref.watch(loginProvider).mailError;
                return CustomTextField(
                  labelText: "Phone",
                  controller: login.phController,
                  // errorText: mailError,
                  // validator: (value) => login.validateEmail(value),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                // final pswError = ref.watch(loginProvider).pswError;
                return CustomTextField(
                  labelText: "Passowrd",
                  obscureText: true,
                  // errorText: pswErro/r,
                  controller: login.pswController,
                  // validator: (value) => login.validatePassword(value),
                );
              },
            ),
            const SizedBox(height: 30),
            CustomTextButton(
              text: "Sign in",
              ontap: () async {
                bool isLogin = await login.signIn();
                if (isLogin) {
                  if (!context.mounted) return;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const AllUserPage()),
                      (Route<dynamic> route) => false);
                }
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: context.bs!.copyWith(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    login.pswController.clear();
                    login.nameController.clear();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Sign up",
                    style: context.bs!.copyWith(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
