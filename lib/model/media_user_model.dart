class MediaUserModel {
  String? emali;
  String? name;
  String? phone;
  String? uId;
  MediaUserModel({
    this.emali,
    this.name,
    this.phone,
    this.uId,
  });

  MediaUserModel.fromJson(Map<String, dynamic> json) {
    emali = json['emali'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'emali': emali,
      'name': name,
      'phone': phone,
      'uId': uId,
    };
  }
}
