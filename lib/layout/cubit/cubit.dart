import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_social_app/layout/cubit/states.dart';
import 'package:simple_social_app/modules/social_app/Profile/Profile.dart';
import 'package:simple_social_app/modules/social_app/chat/chat_screen.dart';
import 'package:simple_social_app/modules/social_app/home/social_home_app.dart';
import 'package:simple_social_app/modules/social_app/setting/setting_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/social_model/usre_social_model.dart';
import '../../modules/social_app/new_posts/new_posts_screen.dart';
import '../../shared/component/constant/constant.dart';

class SocialLayoutCubit extends Cubit<SocialLayoutStates> {
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  List<String> titles = [
    'Feeds',
    'Chat',
    'Post',
    'your Profile',
    'General Settings',
  ];
  List<Widget> screens= [
    SocialHomeScreen(),
    ChatScreen(),
    NewPostScreen(),
    ProfileScreen(),
    SettingScreen(),

  ];

  void changeNavBar (index)
  {
    if(index == 2) {
      emit(SocialNewPostState());
    } else
      {
        currentIndex=index;
        emit(SocialChangeNavBar());
      }

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

  File? profileImage;
  var picker = ImagePicker();

  Future<void> pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      debugPrint(pickedFile.path);
      emit(ProfileImagePickerSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(ProfileImagePickerErrorState());
    }
  }


  File? coverImage;
  var coverPicker = ImagePicker();

  Future<void> pickCoverImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      debugPrint(pickedFile.path);
      emit(CoverImagePickerSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(CoverImagePickerErrorState());
    }
  }
  

  
  void uploadProfileImage ({
    required String name,
    required String bio,
    required String phone,

  })
  {
    firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
    .putFile(profileImage!)
        .then((value)
    {
     value.ref.getDownloadURL().then((value)
     {
       updateUserData(name: name, bio: bio, phone: phone, image: value);

       emit(ProfileUploadImageSuccessState());
     }
     ).catchError((error) {
       emit(ProfileUploadImageErrorState());
    });
    }
    ).catchError((error){
      emit(ProfileUploadImageErrorState());

    });
  }



  void uploadCoverImage ({
    required String name,
    required String bio,
    required String phone,

  })
  {
    firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value)
    {
      value.ref.getDownloadURL().then((value)
      {
        updateUserData(name: name, bio: bio, phone: phone, cover: value);
        print(value);
        emit(CoverUploadImageSuccessState());
      }
      ).catchError((error) {
        emit(CoverUploadImageErrorState());
      });
    }
    ).catchError((error){
      emit(CoverUploadImageErrorState());

    });
  }

  // UserDataModel? userProfileModel;

  // void updateUserProfileImage ({
  //   required String profileImgUrl,
  // })
  // {
  //   emit(UpdateUserProfileLoadImage());
  //   userProfileModel= UserDataModel(
  //       name: model.name,
  //       email: model.email,
  //       phone: model.phone,
  //       uid: model.uid,
  //       image:profileImgUrl,
  //       bio: model.bio,
  //       coverImage: model.coverImage,
  //       isVerified: model.isVerified,
  //   );
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userProfileModel!.uid)
  //       .update(userProfileModel!.toMap())
  //       .then((value) {
  //         getUserData();
  //   })
  //       .catchError((error){
  //     emit(UpdateUserProfileErrorImage());
  //   });
  // }



  UserDataModel? userDataModel;

  void updateUserData ({
  required String name,
    required String bio,
    required String phone,
    String? cover,
    String? image,
})
  {
    emit(UpdateUserDataLoadState());

     userDataModel= UserDataModel(
        name: name,
        email: model.email,
        phone: phone,
        uid: model.uid,
        image: image?? model.image,
        bio: bio,
        coverImage: cover?? model.coverImage,
        isVerified: model.isVerified);

    FirebaseFirestore.instance
        .collection('users')
        .doc(userDataModel!.uid)
        .update(userDataModel!.toMap())
        .then((value)
        {
          getUserData();
          emit(UpdateUserGetUserState());
        }
    ).catchError((error)
    {
      emit(UpdateUserDataErrorState());
    });
  }

}
