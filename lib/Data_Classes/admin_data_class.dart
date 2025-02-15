class AdminDataClass {
  String id;
  String userName;
  String email;
  String phoneNumber;
  String password;

  AdminDataClass(
      {this.id = "",
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  AdminDataClass.formJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          userName: json["userName"],
          email: json["email"],
          phoneNumber: json["phoneNumber"],
          password: json["password"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password
    };
  }
}
