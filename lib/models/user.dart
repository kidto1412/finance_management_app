part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? password;

  static String? token;

  User({
    this.id,
    this.username,
    this.name,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        username: data['username'],
        email: data['email'],
        name: data['name'],
        password: data['password'],
      );

  @override
  // TODO: implement props
  List<Object> get props => [
        id ?? 0,
        username ?? '',
        email ?? '',
        name ?? '',
        password ?? '',
      ];
}
