
abstract class LoginStates {}

class LoginSocialInitializeState extends LoginStates{}


class LoginSocialLoadState extends LoginStates{}

class LoginSocialSuccessState extends LoginStates
{
  late String uid;
  LoginSocialSuccessState(this.uid);
}

class LoginSocialErrorState extends LoginStates{}

