import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_page_bloc_state.dart';

class LoginPageBlocCubit extends Cubit<LoginPageBlocState> {
  LoginPageBlocCubit() : super(LoginPageBlocInitial());
}
