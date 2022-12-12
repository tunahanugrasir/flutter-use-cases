class User {
  const User({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.website,
    this.code,
  });

  static List<User> get users => List.generate(10, (index) => User(name: '$index. user'));
  final int? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? phone;
  final String? website;
  final String? code;
}
