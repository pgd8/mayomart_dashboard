class User {
  String id;
  String userName;
  String email;
  String phoneNumber;
  String address;
  String password;

  User({
    this.id = "",
    this.address = "",
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "password": password
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            userName: json["userName"],
            email: json["email"],
            phoneNumber: json["phoneNumber"],
            address: json["address"],
            password: json["password"]);
}
