// class UserModel {
//   String name;
//   String email;
//   String phone;
//   String uId;
//   String image;
//   bool isEmailVerified;

//   UserModel({
//     this.email,
//     this.name,
//     this.phone,
//     this.uId,
//     this.image,
    
//     this.isEmailVerified,
//   });

//   UserModel.formJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     uId = json['uId'];
//     image = json['image'];
   
//     isEmailVerified = json['isEmailVerified'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'uId': uId,
//       'image': image,
//       'isEmailVerified': isEmailVerified,
//     };
//   }
// }