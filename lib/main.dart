import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';
import 'package:simple_social_app/shared/bloc_observer/bloc_observer.dart';
import 'package:simple_social_app/shared/network/local_network/cached_helper.dart';
import 'package:simple_social_app/shared/network/remote_network/dio_helper.dart';
import 'package:simple_social_app/shared/styles/theme_data_mode.dart';

import 'modules/social_app/home/social_home_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachedHelper.init();

  BlocOverrides.runZoned(
        () {
      return runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

  class MyApp extends StatelessWidget
  {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: lightTheme,

        home:  const SocialHomeScreen(),
    );
  }

  }
