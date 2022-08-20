import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/layout/cubit/states.dart';
import 'package:simple_social_app/modules/social_app/Profile/Profile.dart';
import 'package:simple_social_app/modules/social_app/chat/chat_screen.dart';
import 'package:simple_social_app/modules/social_app/home/social_home_app.dart';
import 'package:simple_social_app/modules/social_app/setting/setting_screen.dart';

import '../../models/social_model/usre_social_model.dart';
import '../../shared/component/constant/constant.dart';

class SocialLayoutCubit extends Cubit<SocialLayoutStates> {
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  List<String> titles = [
    'Feeds',
    'Chat',
    'your Profile',
    'General Settings',
  ];
  List<Widget> screens= [
    SocialHomeScreen(),
    ChatScreen(),
    ProfileScreen(),
    SettingScreen(),

  ];

  void changeNavBar (index)
  {
    currentIndex=index;
    emit(SocialChangeNavBar());
  }


  late UserDataModel model;
  void getUserData() {
    emit(SocialLayoutLoadState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value)
    {
      model = UserDataModel.fromJson(value.data()!);
      print(value.data());
      emit(SocialLayoutSuccessState());
    })
        .catchError((error)
    {
      emit(SocialLayoutErrorState());
    });
  }
}
