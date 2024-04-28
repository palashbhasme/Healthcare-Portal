
class Patient{
   final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String email;
  final String phone;
  final String age;
  final String aadharNumber;
  final String gender;
  final String address;
  final String dob;

  Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.age,
    required this.aadharNumber,
    required this.gender,
    required this.address,
    required this.dob,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      firstName: json['patient']['firstName'] ?? '',
      lastName: json['patient']['lastName'] ?? '',
      username: json['patient']['username'] ?? '',
      password: json['patient']['password'] ?? '',
      email: json['patient']['email'] ?? '',
      phone: json['patient']['phone'] ?? '',
      age: json['patient']['age'] ?? '',
      aadharNumber: json['patient']['aadharNumber'] ?? '',
      gender: json['patient']['gender'] ?? '',
      address: json['patient']['address'] ?? '',
      dob: json['patient']['dob'] ?? '',
      id: json['patient']['_id']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'age': age,
      'aadharNumber': aadharNumber,
      'gender': gender,
      'address': address,
      'dob': dob,
      'id': id
    };
  }
}
