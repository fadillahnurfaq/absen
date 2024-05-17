import 'package:absensi_fic/data/datasources/auth_remote_datasource.dart';
import 'package:absensi_fic/data/models/auth_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  RegisterCubit(this._authRemoteDatasource) : super(RegisterState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  void toggleObscurePassword(int type) {
    if (type == 1) {
      emit(state.copyWith(obscurePassword: !state.obscurePassword));
    } else {
      emit(state.copyWith(obscureConfPassword: !state.obscureConfPassword));
    }
  }

  Future<void> register() async {
    emit(state.copyWith(errorMessage: ""));
    final result = await _authRemoteDatasource.register(
        emailController.text.trim(),
        nameController.text.trim(),
        passwordController.text.trim(),
        confPasswordController.text.trim());
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l));
      },
      (r) {
        emit(state.copyWith(response: r));
      },
    );
  }
}
