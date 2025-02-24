class User {
  final String jwt;

  User({required this.jwt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(jwt: json['jwt']);
  }

  Map<String, dynamic> toJson() {
    return {'jwt': jwt};
  }
}
