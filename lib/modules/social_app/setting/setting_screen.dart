
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_social_app/layout/cubit/cubit.dart';
import 'package:simple_social_app/layout/cubit/states.dart';
import 'package:simple_social_app/shared/component/component/component.dart';

import '../edit_Setting/edit_setting.dart';

class SettingScreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var userModel = SocialLayoutCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
            [
              Container(
                height: 200,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 150.0,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(userModel.model.coverImage),
                            fit: BoxFit.cover,

                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                     CircleAvatar(
                      radius: 66.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 62.0,
                        backgroundImage: NetworkImage(userModel.model.image),
                      ),
                    ),
                  ],
                ),
              ),
              Text(userModel.model.name,
                style: GoogleFonts.aladin(
                  textStyle: Theme.of(context).textTheme.headline6,
                  fontStyle: FontStyle.italic,
                ),),
              Text(userModel.model.bio,
                style: GoogleFonts.aladin(
                  textStyle: Theme.of(context).textTheme.caption,
                  fontStyle: FontStyle.italic,
                ),),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children:
                [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children:
                        [
                          Text('100',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                          Text('Followers',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children:
                        [
                          Text('3.1K',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                          Text('Following',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children:
                        [
                          Text('321',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                          Text('Posts',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children:
                        [
                          Text('489',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                          Text('Comments',
                            style: GoogleFonts.aladin(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                children:
                [
                  Expanded(
                    child: Container(
                      height: 30.0,
                      child: defaultButton(
                          function: (){},
                          text: 'Add Photo',
                          radius: 10.0),
                    ),
                  ),
                  const SizedBox(width: 4.0,),
                  Container(
                    height: 30.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:  MaterialButton(
                      onPressed: ()
                      {
                        navigateTo(context, editSetting());
                      },
                      child:  const Icon(Icons.edit),),
                  ),
                  const SizedBox(width: 4.0,),
                ],
              ),

            ],
          ),
        );
      },
    );
  }

}

