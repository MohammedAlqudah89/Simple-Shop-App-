import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // header Card Picture
            Container(
              height: 170.0,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(40.0),
              // ),
              child: const Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 20.0,
                  child: Image(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/front-view-coworkers-posing-together-work_23-2148908832.jpg?size=626&ext=jpg'),
                    fit: BoxFit.cover,
              ),

              ),
            ),
            const SizedBox(
              height: 10.0,
            ),


            ListView.separated(
                itemBuilder: (context, index) => postBuilder(context),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5, ),

          ],
        ),
      ),
    );
  }

  Widget postBuilder (context)
  {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3), ),

          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Container(
                height: 50.0,
                width: 50.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child:  Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: const Image(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/two-teenage-friends-playing-video-games-together-home_23-2149332884.jpg?size=626&ext=jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Maria Andros',
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 7.0,
                        backgroundColor: Colors.green,
                      ),
                      const SizedBox(width: 4.0,),
                      Text('Active Now',
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                            fontStyle: FontStyle.italic,
                            fontSize: 9.0
                        ),),
                    ],
                  ),
                ],
              ),
              const SizedBox( width: 3.0,),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.verified_user, color: Colors.blueGrey, size: 15.0,),
              ),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.menu, color: Colors.blueGrey,),),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all( 8.0,),
          height: 250.0,
          width: double.infinity,
          //color: Colors.blueGrey,
          child: Column(
            children: [
              Text('Septembers Met Gala was a throwback to old school Hollywood glamour,'
                  ' with Billie Eilish giving us real Marilyn vibes.'
                  'Her Instagram post showing her look and thanking the designer Oscar de la'
                  ' Renta has shot into the top 20, with almost 20 million likes and counting',
                style: GoogleFonts.abel(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const Expanded(
                child: Image(image:
                NetworkImage('https://img.freepik.com/free-photo/close-up-beautiful-young-woman-driving_23-2149085802.jpg?size=626&ext=jpg'),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
