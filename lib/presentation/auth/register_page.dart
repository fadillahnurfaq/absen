import 'package:absensi_fic/core/assets/assets.dart';
import 'package:absensi_fic/core/components/buttons.dart';
import 'package:absensi_fic/core/components/custom_form_field.dart';
import 'package:absensi_fic/core/components/custom_text_field.dart';
import 'package:absensi_fic/core/components/spaces.dart';
import 'package:absensi_fic/core/components/text.dart';
import 'package:absensi_fic/core/constants/app_colors.dart';
import 'package:absensi_fic/core/extensions/build_context_ext.dart';
import 'package:absensi_fic/data/datasources/auth_remote_datasource.dart';
import 'package:absensi_fic/presentation/auth/bloc/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onTapDown,
      ],
      child: BlocProvider(
        create: (context) => RegisterCubit(AuthRemoteDatasource()),
        child: BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: AppColors.red,
                ),
              );
            }
          },
          child: Scaffold(
            body: SizedBox(
              height: context.deviceHeight,
              width: context.deviceWidth,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Assets.images.logo.image(
                            height: 100.0,
                            width: context.deviceWidth,
                          ),
                          const SpaceHeight(20.0),
                          CustomFormField(
                            controller:
                                context.read<RegisterCubit>().emailController,
                            label: "Email Address",
                          ),
                          const SpaceHeight(20),
                          CustomFormField(
                            controller:
                                context.read<RegisterCubit>().nameController,
                            label: "Name",
                          ),
                          const SpaceHeight(20),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                                previous.obscurePassword !=
                                current.obscurePassword,
                            builder: (context, state) {
                              return CustomFormField(
                                controller: context
                                    .read<RegisterCubit>()
                                    .passwordController,
                                label: "Password",
                                obscureText: state.obscurePassword,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    Assets.icons.password.path,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                suffix: IconButton(
                                  icon: Icon(
                                    state.obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.grey,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<RegisterCubit>()
                                        .toggleObscurePassword(1);
                                  },
                                ),
                              );
                            },
                          ),
                          const SpaceHeight(20),
                          BlocBuilder<RegisterCubit, RegisterState>(
                            buildWhen: (previous, current) =>
                                previous.obscureConfPassword !=
                                current.obscureConfPassword,
                            builder: (context, state) {
                              return CustomFormField(
                                controller: context
                                    .read<RegisterCubit>()
                                    .confPasswordController,
                                label: "Confirmation Password",
                                obscureText: state.obscureConfPassword,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    Assets.icons.password.path,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                suffix: IconButton(
                                  icon: Icon(
                                    state.obscureConfPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.grey,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<RegisterCubit>()
                                        .toggleObscurePassword(2);
                                  },
                                ),
                              );
                            },
                          ),
                          const SpaceHeight(20.0),
                          Button.filled(
                            onPressed: () async {
                              await context.read<RegisterCubit>().register();
                            },
                            label: "Sign Up",
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
