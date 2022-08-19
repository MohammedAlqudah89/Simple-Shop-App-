
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/modules/social_app/login/cubit/states.dart';


class LoginCubit extends Cubit <LoginStates>
{
  LoginCubit(): super(LoginSocialInitializeState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void getLoginData (
      {
        required email,
        required password,
      })
  {
    emit(LoginSocialLoadState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password)
    .then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      emit(LoginSocialSuccessState(value.user!.uid));
    }
    ).catchError((error){
      print(error.toString());
      emit(LoginSocialErrorState());
    });
  }
}