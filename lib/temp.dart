import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rtc_with_agora_sdk/custom_buttom.dart';
import 'package:rtc_with_agora_sdk/custom_text_field.dart';
import 'package:rtc_with_agora_sdk/extension.dart';
import 'package:rtc_with_agora_sdk/super_scaffold.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(context, ref) {
    return SafeArea(
      child: const SuperScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SignInForm(),
      ),
    );
  }
}

class SignInForm extends ConsumerWidget {
  const SignInForm({
    super.key,
  });

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
                return CustomTextField(
                  labelText: "Gmail",
                  // controller: login.emailController,
                  // errorText: mailError,
                  // validator: (value) => login.validateEmail(value),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                // final pswError = ref.watch(loginProvider).pswError;
                return CustomTextField(
                  labelText: "Passowrd",
                  obscureText: true,
                  // errorText: pswErro/r,
                  // controller: login.pswController,
                  // validator: (value) => login.validatePassword(value),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                // final mailError = ref.watch(loginProvider).mailError;
                return CustomTextField(
                  labelText: "Name",
                  // controller: login.emailController,
                  // errorText: mailError,
                  // validator: (value) => login.validateEmail(value),
                );
              },
            ),
            CustomTextButton(
              text: "Sign in",
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: context.bs!.copyWith(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Container()));
                  },
                  child: Text(
                    "Sign Up",
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
