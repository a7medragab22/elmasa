import 'package:bloc/bloc.dart';
import 'package:elmasa/features/auth/domain/repos/auth_repo.dart';
import 'package:elmasa/features/auth/presentation/cubits/signin_cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitState());
  final AuthRepo authRepo;
  Future<void> call({required String email, required String password}) async {
    emit(SigninLoadingState());
    var result = await authRepo.signinUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (f) => emit(SigninFailureState(errMessage: f.errMessage)),
      (r) => emit(SigninSuccessState()),
    );
  }
}
