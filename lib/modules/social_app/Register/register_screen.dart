
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_social_app/modules/social_app/Register/cubit/register_cubit.dart';
import 'package:simple_social_app/modules/social_app/login/login_screen.dart';
import 'package:simple_social_app/shared/component/component/component.dart';

import 'cubit/states.dart';

class RegisterLoginScreen extends StatelessWidget
{
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer <RegisterCubit, RegisterStates>(
        listener: (context, state)
        {
          if(state is RegisterSetUserDataSuccessState)
            {
              navigateTo(context, SocialLoginScreen(),);
            }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              titleSpacing: 80.0,
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
                        const Text('Register Page',
                          style: TextStyle(
                              fontSize: 25.0
                          ),),
                        const SizedBox(height: 20.0,),
                        const Text('Please fill your information',
                          style: TextStyle(
                            color: Colors.grey,
                          ),),
                        const SizedBox(height: 20.0,),
                        defaultTextFormField(
                            type: TextInputType.name,
                            controller: nameController,
                            prefix: Icons.person,
                            validate: (value)
                            {
                              if (value!.isEmpty)
                              {
                                return 'Please Enter your User Name, Required filled';
                              }
                              return null;
                            },
                            label: 'User Name'),

                        const SizedBox(height: 20.0,),
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
                              return 'Please Enter you Password, Required filled';
                            }
                            return null;
                          },
                          label: 'Password',
                        ),
                        const SizedBox(height: 20.0,),

                        defaultTextFormField(
                          type: TextInputType.phone,
                          controller: phoneController,
                          isPassword: true,
                          prefix: Icons.phone,
                          validate: (value)
                          {
                            if (value!.isEmpty)
                            {
                              return 'Please Enter you Phone Number, Required filled';
                            }
                            return null;
                          },
                          label: 'Phone Number',
                        ),

                        const SizedBox(height: 20.0,),

                        ConditionalBuilder(
                          condition: state is !RegisterGetUserDAtaLoadState,
                          builder: (context) {
                            return defaultButton(
                              function: ()
                              {
                                if (formKey.currentState!.validate())
                                {
                                  RegisterCubit.get(context).getRegisterData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );

                                }
                              },
                              text: 'Register',
                              radius: 20.0,
                            );
                          } ,
                          fallback:  (context) => const Center(child: CircularProgressIndicator()),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }

}