//API Search
// https://newsapi.org/v2/everything?q=Apple&apiKey=184440a6b5ad42b593959dc5ae981113

import 'package:simple_social_app/modules/social_app/login/login_screen.dart';
import '../../network/local_network/cached_helper.dart';
import '../component/component.dart';

void signOut(context)
{
  CachedHelper.removeDate(key: 'uid').then((value)
  {
    if (value)
    {
      navigateAndFinish(context, SocialLoginScreen());
    }

  });
}


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? uid;