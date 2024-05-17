import 'package:absensi_fic/core/assets/assets.dart';
import 'package:absensi_fic/core/components/buttons.dart';
import 'package:absensi_fic/core/components/custom_text_field.dart';
import 'package:absensi_fic/core/components/spaces.dart';
import 'package:absensi_fic/core/components/text.dart';
import 'package:absensi_fic/core/extensions/build_context_ext.dart';
import 'package:absensi_fic/presentation/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onTapDown,
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.logo.image(
                height: 100.0,
                width: context.deviceWidth,
              ),
              const SpaceHeight(20.0),
              CustomTextField(
                controller: TextEditingController(),
                label: "Email Address",
              ),
              const SpaceHeight(20),
              CustomTextField(
                controller: TextEditingController(),
                label: "Password",
              ),
              const SpaceHeight(20.0),
              Button.filled(
                onPressed: () {},
                label: "Log In",
              ),
              const SpaceHeight(20.0),
              InkWell(
                  onTap: () {
                    context.push(const RegisterPage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextLabel(text: "Register Here"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
