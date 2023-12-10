
enum Role { professor,student }

class Userc {


  final String fullName;
  final String email;
  final String password;
  final Role role;

  Userc({
    required this.fullName,
    required this.email,
    required this.password,
    required this.role,
  }
    );

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'Role': role,
    };
  }

  factory Userc.fromMap(Map<String, dynamic> map) {
    return Userc(
      fullName: map['fullName'],
      email: map['email'],
      password: map['password'],
      role: map['Role'],
    );
  }
}
