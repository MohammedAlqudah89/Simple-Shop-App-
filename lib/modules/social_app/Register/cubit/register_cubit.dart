
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/modules/social_app/Register/cubit/states.dart';

import '../../../../models/social_model/usre_social_model.dart';

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
    emit(RegisterGetUserDAtaLoadState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      setUserData(name: name, email: email, uid: value.user!.uid, phone: phone);

    }
    ).catchError((error){
      print(error.toString());
      emit(RegisterGetUserDAtaErrorState());
    });
  }


  void setUserData (
  {
    required name,
    required email,
    required uid,
    required phone,

})
  {
    emit(RegisterSetUserDataLoadState());
    UserDataModel model =UserDataModel(
        name: name,
        email: email,
        phone: phone,
        uid: uid,
        coverImage:'https://img.freepik.com/free-photo/coworkers-working-together-office-with-laptop_23-2148908787.jpg?size=626&ext=jpg',
        bio: 'write your bio ...',
        image: 'https://img.freepik.com/free-photo/person-taking-break-from-working-office_23-2149229016.jpg?size=626&ext=jpg',
        isVerified: false);

    FirebaseFirestore.instance.collection('users')
        .doc(uid)
        .set(model.toMap()
    ).then((value)
    {
      emit(RegisterSetUserDataSuccessState());
    }).catchError((error)
    {
      emit(RegisterSetUserDataErrorState());
    }
    );

  }
}