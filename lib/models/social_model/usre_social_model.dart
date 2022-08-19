class UserDataModel
{
   late final String uid;
  late final String name;
   late final String email;
   late final String phone;
   late final bool isVerified;


   UserDataModel( {
     required this.name,
     required this.email,
     required this.phone,
     required this.uid,
     required this.isVerified,

});
   UserDataModel.fromJson(Map<String, dynamic> json)
   {
     uid=json['uid']??'';
     email=json['email']??'';
     phone=json['phone']??'';
     name=json['name']??'';
     isVerified=json['isVerified']??'';

   }
   Map<String, dynamic> toMap()
   {
     return {
       'uid':uid,
       'name': name,
       'email': email,
       'phone': phone,
       'isVerified': isVerified,

     };

   }
}