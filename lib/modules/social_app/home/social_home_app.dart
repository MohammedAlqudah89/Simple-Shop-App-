import 'dart:ffi';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // header Card Picture
            const Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Image(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/front-view-coworkers-posing-together-work_23-2148908832.jpg?size=626&ext=jpg'),
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index)=> postBuilder(context),
                separatorBuilder: (context, index)=> const SizedBox(height: 4.0,),
                itemCount: 10),
          ],
        ),
      );
  }

  Widget postBuilder(context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3.0,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/person-taking-break-from-working-office_23-2149229016.jpg?size=626&ext=jpg'),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Maria Jonson',
                        style: GoogleFonts.aclonica(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      const Icon(
                        Icons.verified_user,
                        color: Colors.blueGrey,
                        size: 14.0,
                      ),
                    ],
                  ),
                  Text(
                    'August 21, 2022, 02:10 Pm',
                    style: GoogleFonts.aclonica(
                      textStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 10.0),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Container(
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          Text(
            'Septembers Met Gala was a throwback to old school Hollywood glamour,'
                ' with Billie Eilish giving us real Marilyn vibes.'
                'Her Instagram post showing her look and thanking the designer Oscar de la',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontStyle: FontStyle.italic,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            width: double.infinity,
            child: Wrap(children: [
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 0.0,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    '#Fashion',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/happy-fabulous-ginger-woman-stylish-red-beret-street-using-smartphone_273443-254.jpg?size=626&ext=jpg'),
              fit: BoxFit.cover,
              height: 140.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          '12.5K',
                          style: GoogleFonts.lato(
                            textStyle:
                            Theme.of(context).textTheme.caption,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            Icons.chat,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          '10.25K, Comments',
                          style: GoogleFonts.lato(
                            textStyle:
                            Theme.of(context).textTheme.caption,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Container(
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16.0,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/two-teenage-friends-playing-video-games-together-home_23-2149332884.jpg?size=626&ext=jpg'),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        'Write a comment ...',
                        style: GoogleFonts.lato(
                          textStyle:
                          Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.heart,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      Text(
                        'LIKE',
                        style: GoogleFonts.lato(
                          textStyle:
                          Theme.of(context).textTheme.caption,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

