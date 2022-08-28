import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_social_app/layout/cubit/cubit.dart';
import 'package:simple_social_app/layout/cubit/states.dart';
import 'package:simple_social_app/shared/component/component/component.dart';

class NewPostScreen extends StatelessWidget
{
  var postComment= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialLayoutCubit, SocialLayoutStates>(
      listener: (context,state) {},
      builder: (context, state){
      //  var model= SocialLayoutCubit.get(context);
        return Scaffold(
          appBar:appBarBuilder(
            context: context,
            icon: Icons.arrow_back_ios,
            title:  'Create Post',
            actions: [
              TextButton(onPressed: (){},
                child: const Text('POST'),),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [
                Row(
                    children:
                    [
                      const SizedBox(width: 10,),
                      const  CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                        NetworkImage('https://img.freepik.com/free-photo/coworkers-working-together-office-with-laptop_23-2148908787.jpg?size=626&ext=jpg',
                        ),

                      ),
                      const SizedBox(width: 10.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Maria Jonson',
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                              fontStyle: FontStyle.italic,
                            ),),
                          Text('Public', style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0, height: 1.5),),

                        ],
                      ),
                    ]

                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'What\'s in your mind, Mohammed',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(onPressed: ()
                      {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            const [
                              Icon(Icons.photo),
                              Text('Add Photo',),
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(onPressed: ()
                      {},
                          child: Row(
                            children:
                            const [
                              Icon(Icons.tag),
                              Text('Tags',),
                            ],
                          )),
                    ),
                  ],
                ),

              ],
            ),

          ),
        );
      },
    );

  }

}