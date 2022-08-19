import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/layout/cubit/states.dart';
import 'package:simple_social_app/shared/component/component/component.dart';

import 'cubit/cubit.dart';

class SocialLayoutScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialLayoutCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title:  const Text('Feeds'),
          ),
          body: model.screens[model.currentIndex],


          // Column(
          //   children:
          //   [
          //
          //   //  if(!FirebaseAuth.instance.currentUser!.emailVerified)
          //     if(!model.model.isVerified)
          //     Container(
          //        color: Colors.amber.withOpacity(0.5),
          //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
          //       child: Row(
          //         children:
          //          [
          //            const Icon(Icons.info_outline, color: Colors.redAccent,),
          //            const SizedBox(width: 10,),
          //            const Expanded(child:   Text('Please Verify your email')),
          //            const SizedBox(width: 50.0,),
          //           TextButton(onPressed: ()
          //           {
          //             FirebaseAuth.instance.currentUser!.sendEmailVerification().
          //             then((value) => {
          //               toastBuilder(message: 'Check your Mail Box!',state: ToastState.SUCCESS),
          //               model.model.isVerified=true,
          //             }).
          //             catchError((error){
          //               toastBuilder(message: 'not verified', state: ToastState.ERROR);
          //             });
          //           }
          //             , child: const Text('send'), ),
          //         ]
          //       ),
          //     ),
          //     const SizedBox(height: 20.0,),
          //
          //
          //   ],
          // ),
          bottomNavigationBar: CurvedNavigationBar(
            index: model.currentIndex,
            items: 
            const [
              Icon(Icons.home, size: 30,),
              Icon(Icons.home, size: 30,),
              Icon(Icons.home, size: 30,),
              Icon(Icons.home, size: 30,),
            ],
            onTap: (index)
            {
              model.changeNavBar(index);
            },

          ),
        );
      },

    );
  }

}

