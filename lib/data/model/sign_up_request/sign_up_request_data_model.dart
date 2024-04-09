class SignUpRequestDataModel {
  SignUpRequestDataModel({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phoneNumber,});

  SignUpRequestDataModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phoneNumber = json['phoneNumber'];
  }
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}