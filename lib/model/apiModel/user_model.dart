class UserModel {
  String? phoneNumber;
  String? password;

  UserModel({
    this.password,
    this.phoneNumber,
  });

  UserModel.fromJson(Map<String, dynamic> json) {

    phoneNumber = json['phoneNumber'];

    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
      };

  Map<String, dynamic> updateToJson() => {
        "phoneNumber": phoneNumber,
      };
}
