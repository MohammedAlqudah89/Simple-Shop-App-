
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/modules/social_app/Register/cubit/states.dart';

class RegisterCubit extends Cubit <RegisterStates>
{
  RegisterCubit(): super(RegisterSocialInitializeState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void getRegisterData (
  {
  required name,
    required email,
    required password,
    required phone,
})
  {
    emit(RegisterSocialLoadState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);

      emit(RegisterSocialSuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(RegisterSocialErrorState());
    });
  }
}