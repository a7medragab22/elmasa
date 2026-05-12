class SignupState {}

class SignupInitState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupFailureState extends SignupState {
  final String errMessage;

  SignupFailureState({required this.errMessage});
}

class SignupSuccessState extends SignupState {}
