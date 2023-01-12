class MediaUserModel {
  String? emali;
  String? name;
  String? phone;
  String? uId;
  String? image;
  String? bio;
  bool? isEmailVerified;
  MediaUserModel({
    this.emali,
    this.name,
    this.phone,
    this.uId,
    this.image,
    this.bio,
    this.isEmailVerified, //التحقق من الايمايل
  });

  MediaUserModel.fromJson(Map<String, dynamic> json) {
    emali = json['emali'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];

    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'emali': emali,
      'name': name,
      'phone': phone,
      'uId': uId,
      'image': image,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
