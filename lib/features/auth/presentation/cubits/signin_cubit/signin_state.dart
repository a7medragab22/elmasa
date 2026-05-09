class SigninState {}

class SigninInitState extends SigninState {}

class SigninLoadingState extends SigninState {}

class SigninSuccessState extends SigninState {}

class SigninFailureState extends SigninState {
  final String errMessage;

  SigninFailureState({required this.errMessage});
}
