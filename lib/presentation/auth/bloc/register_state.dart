part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool obscurePassword;
  final bool obscureConfPassword;
  final String errorMessage;
  final AuthResponseModel? response;
  const RegisterState({
    required this.obscurePassword,
    required this.obscureConfPassword,
    required this.errorMessage,
    required this.response,
  });

  @override
  List<Object?> get props =>
      [obscurePassword, obscureConfPassword, errorMessage, response];

  factory RegisterState.initial() {
    return const RegisterState(
      obscurePassword: true,
      obscureConfPassword: true,
      errorMessage: "",
      response: null,
    );
  }
  RegisterState copyWith({
    bool? obscurePassword,
    bool? obscureConfPassword,
    String? errorMessage,
    AuthResponseModel? response,
  }) {
    return RegisterState(
        obscurePassword: obscurePassword ?? this.obscurePassword,
        obscureConfPassword: obscureConfPassword ?? this.obscureConfPassword,
        errorMessage: errorMessage ?? this.errorMessage,
        response: response ?? this.response);
  }
}
