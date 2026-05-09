import 'package:elmasa/features/auth/domain/repos/auth_repo.dart';
import 'package:elmasa/features/auth/presentation/cubits/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitState());

  final AuthRepo authRepo;
  Future<void> call({required String email, required String password}) async {
    emit(SignupLoadingState());

    var result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (f) => emit(SignupFailureState(errMessage: f.errMessage)),
      (s) => emit(SignupSuccessState()),
    );
  }
}
