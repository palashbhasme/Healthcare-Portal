class Doctor {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final String email;
  final String phone;
  final String aadharNumber;
  final String qualification;
  final String license;
  final String address;

  Doctor({
    required this.id ,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.email,
    required this.phone,
    required this.aadharNumber,
    required this.qualification,
    required this.license,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      "_id": this.id,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "userName": this.userName,
      "password": this.password,
      "email": this.email,
      "phone": this.phone,
      "aadharNumber": this.aadharNumber,
      "qualification": this.qualification,
      "license": this.license,
      "address": this.address,
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json["_id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      userName: json["userName"],
      password: json["password"],
      email: json["email"],
      phone: json["phone"],
      aadharNumber: json["aadharNumber"],
      qualification: json["qualification"],
      license: json["license"],
      address: json["address"],
    );
  }


//
}
