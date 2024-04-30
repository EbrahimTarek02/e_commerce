class AuthenticationResponse {
  AuthenticationResponse({
      this.message, 
      this.user, 
      this.token,
      this.errors
  });

  AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    errors = json['errors'];
  }
  String? message;
  User? user;
  String? token;
  Map? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['errors'] = errors;
    return map;
  }

}

class User {
  User({
      this.name, 
      this.email, 
      this.role,
      this.password
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    password = json['password'];
  }
  String? name;
  String? email;
  String? role;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    map['password'] = password;
    return map;
  }

}