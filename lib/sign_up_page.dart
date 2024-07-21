import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rtc_with_agora_sdk/custom_buttom.dart';
import 'package:rtc_with_agora_sdk/custom_text_field.dart';
import 'package:rtc_with_agora_sdk/extension.dart';
import 'package:rtc_with_agora_sdk/sign_in_page.dart';
import 'package:rtc_with_agora_sdk/super_scaffold.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(context, ref) {
    return const SafeArea(
      child: SuperScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final login = ref.read(loginProvider);
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
                return const CustomTextField(
                  labelText: "Gmail",
                  // controller: login.emailController,
                  // errorText: mailError,
                  // validator: (value) => login.validateEmail(value),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                // final pswError = ref.watch(loginProvider).pswError;
                return const CustomTextField(
                  labelText: "Passowrd",
                  obscureText: true,
                  // errorText: pswErro/r,
                  // controller: login.pswController,
                  // validator: (value) => login.validatePassword(value),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                // final mailError = ref.watch(loginProvider).mailError;
                return const CustomTextField(
                  labelText: "Name",
                  // controller: login.emailController,
                  // errorText: mailError,
                  // validator: (value) => login.validateEmail(value),
                );
              },
            ),
            const SizedBox(height: 30),
            CustomTextButton(
              text: "Sign up",
              ontap: () async {
                if (formKey.currentState!.validate()) {
                  // if (await login.signIn()) {
                  //   login.disposeTextControllers();
                  //   if (!context.mounted) return;
                  //   Navigator.of(context).pushAndRemoveUntil(
                  //       MaterialPageRoute(
                  //           builder: (context) => const HomePage()),
                  //       (Route<dynamic> route) => false);
                  // }
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alrady have an account? ",
                  style: context.bs!.copyWith(color: Colors.white),
                ),
                InkWell(
                  onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                      (Route<dynamic> route) => false),
                  child: Text(
                    "Sign in",
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
