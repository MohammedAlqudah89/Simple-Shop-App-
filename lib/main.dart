import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/shared/bloc_observer/bloc_observer.dart';
import 'package:simple_social_app/shared/component/constant/constant.dart';
import 'package:simple_social_app/shared/network/local_network/cached_helper.dart';
import 'package:simple_social_app/shared/network/remote_network/dio_helper.dart';
import 'package:simple_social_app/shared/styles/theme_data_mode.dart';

import 'layout/cubit/cubit.dart';
import 'layout/social_layout_screen.dart';
import 'modules/social_app/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachedHelper.init();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );

  BlocOverrides.runZoned(
        () {
          Widget widget;
           uid = CachedHelper.getData(key: 'uid');
          if (uid != null)
            {
              widget = SocialLayoutScreen();
            }else
              { widget= SocialLoginScreen();}


      return runApp( MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

  class MyApp extends StatelessWidget
  {
     Widget? starWidget;
    MyApp(this.starWidget);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>SocialLayoutCubit()..getUserData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home:  starWidget,
      ),
    );
  }

  }
