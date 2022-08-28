
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../shared/component/component/component.dart';

class editSetting extends StatelessWidget
{

  var nameController= TextEditingController();
  var bioController= TextEditingController();
  var phoneController= TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(

      listener: (context, state) {},
      builder: (context, state)
      {
        var userModel = SocialLayoutCubit.get(context).model;
        nameController.text= userModel.name;
        bioController.text=userModel.bio;
        phoneController.text= userModel.phone ;

        var profileImage=SocialLayoutCubit.get(context).profileImage;
        var coverImage=SocialLayoutCubit.get(context).coverImage;


        return Scaffold(
          appBar: appBarBuilder(
              context: context,
              title: 'Edit Profile',
              icon: Icons.arrow_back_ios,
            actions: [
              TextButton(onPressed: ()
              {
                SocialLayoutCubit.get(context).updateUserData(
                    name: nameController.text,
                    bio: bioController.text,
                    phone: phoneController.text);
              },
                  child:const Text('UPDATE')),
            ]
          ),
          body: SingleChildScrollView(
            //physics: const NeverScrollableScrollPhysics(),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                [
                  if (state is UpdateUserDataLoadState)
                    const LinearProgressIndicator(color: Colors.blue),
                  if (state is UpdateUserDataLoadState)
                  const SizedBox(height: 10,),
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150.0,

                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: coverImage ==null ? NetworkImage(userModel.coverImage): FileImage(coverImage) as ImageProvider,
                                    fit: BoxFit.cover,

                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                ),
                              ),
                               CircleAvatar(
                                backgroundColor:Colors.blue,
                                radius: 18.0,
                                child: IconButton(
                                    onPressed:(){
                                      SocialLayoutCubit.get(context).pickCoverImage();
                                    },
                                    icon: const Icon(Icons.camera_alt)),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 66.0,
                          backgroundColor: Colors.white,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 62.0,
                                backgroundImage: profileImage == null ? NetworkImage(userModel.image): FileImage(profileImage) as ImageProvider,
                              ),
                              CircleAvatar(
                                backgroundColor:Colors.blue,
                                radius: 18.0,
                                child: IconButton(
                                    onPressed:(){
                                      SocialLayoutCubit.get(context).pickProfileImage();
                                      },
                                    icon: const Icon(Icons.camera_alt)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40.0,),
                  Row(
                    children:
                    [
                      if(profileImage != null)
                        Expanded(child: defaultButton(function: ()
                        {
                          SocialLayoutCubit.get(context).uploadProfileImage(
                            name: nameController.text,
                              bio: bioController.text,
                              phone: phoneController.text,
                          );
                        }, text: 'Save Changes', radius: 10, )),
                      const SizedBox(width: 7,),
                      if(coverImage != null)
                        Expanded(child: defaultButton(function: ()
                        {
                          SocialLayoutCubit.get(context).uploadCoverImage(
                            name: nameController.text,
                            bio: bioController.text,
                            phone: phoneController.text,
                          );
                        }, text: 'Save Changes', radius: 10)),

                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  defaultTextFormField(
                      type: TextInputType.name,
                      controller: nameController,
                      prefix: Icons.person,
                      validate: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return ' Name must not be empty!.';
                          }
                        return null;
                      },
                      label: 'name'),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                      type: TextInputType.text,
                      controller: bioController,
                      prefix: Icons.info,
                      validate: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return ' bio must not be empty!.';
                        }
                        return null;
                      },
                      label: 'Bio'),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                      type: TextInputType.phone,
                      controller: phoneController,
                      prefix: Icons.call,
                      validate: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return ' Phone Number must not be empty!.';
                        }
                        return null;
                      },
                      label: 'Phone Number'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}