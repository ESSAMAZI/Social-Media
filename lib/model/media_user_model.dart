class MediaUserModel {
  String? emali;
  String? name;
  String? phone;
  String? uId;
  bool? isEmailVerified;
  MediaUserModel({
    this.emali,
    this.name,
    this.phone,
    this.uId,
    this.isEmailVerified, //التحقق من الايمايل
  });

  MediaUserModel.fromJson(Map<String, dynamic> json) {
    emali = json['emali'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'emali': emali,
      'name': name,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
