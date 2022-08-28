class UserDataModel
{
   late final String uid;
  late final String name;
   late final String email;
   late final String phone;
   late final String image;
   late final String coverImage;
   late final String bio;
   late final bool isVerified;


   UserDataModel( {
     required this.name,
     required this.email,
     required this.phone,
     required this.uid,
     required this.image,
     required this.bio,
     required this.coverImage,
     required this.isVerified,

});
   UserDataModel.fromJson(Map<String, dynamic> json)
   {
     uid=json['uid']??'';
     email=json['email']??'';
     phone=json['phone']??'';
     image=json['image']??'';
     bio=json['bio']??'';
     coverImage=json['coverImage']??'';
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
       'coverImage':coverImage,
       'bio': bio,
       'image': image,
       'isVerified': isVerified,

     };

   }
}