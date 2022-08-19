
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/modules/social_app/login/cubit/cubit.dart';
import 'package:simple_social_app/shared/component/component/component.dart';
import 'package:simple_social_app/shared/network/local_network/cached_helper.dart';

import '../../../layout/social_layout_screen.dart';
import '../Register/register_screen.dart';
import '../home/social_home_app.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget
{
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is LoginSocialErrorState)
            {
              toastBuilder(message: 'wrong credential ', state: ToastState.ERROR);
            }
          if (state is LoginSocialSuccessState)
            {
              CachedHelper.saveData(key: 'uid', value: state.uid).then((value)
              {
                navigateAndFinish(context, SocialLayoutScreen());
              });
            }
        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Me'),
              titleSpacing: 150.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text('Login Page',
                          style: TextStyle(
                              fontSize: 25.0
                          ),),
                        const SizedBox(height: 20.0,),
                        const Text('Meets your friend with beautiful platform, and enjoying with our services',
                          style: TextStyle(color: Colors.grey,),),
                        const SizedBox(height: 40.0,),
                        defaultTextFormField(
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            prefix: Icons.email,
                            validate: (value)
                            {
                              if (value!.isEmpty)
                              {
                                return 'Please Enter you Email Address, Required filled';
                              }
                              return null;
                            },
                            label: 'Email Address'),

                        const SizedBox(height: 20.0,),

                        defaultTextFormField(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          isPassword: true,
                          suffix: Icons.visibility,
                          prefix: Icons.lock,
                          validate: (value)
                          {
                            if (value!.isEmpty)
                            {
                              return 'Please Enter you Email Address, Required filled';
                            }
                            return null;
                          },
                          label: 'Email Address',
                        ),

                        const SizedBox(height: 30.0,),

                        ConditionalBuilder(
                          condition: state is !LoginSocialLoadState,
                          builder: (context)
                          {
                            return defaultButton(
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  LoginCubit.get(context).getLoginData(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                  navigateTo(context, SocialLayoutScreen());
                                }
                              },
                              text: 'login',
                              radius: 20.0,
                            );
                          },
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            const Text(' If you don\'t have an account,',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),),
                            TextButton(onPressed: ()
                            {
                              navigateTo(context,  RegisterLoginScreen());
                            }
                              , child: const Text('Sing-up here!'),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } ,

      ),
    );
  }

}