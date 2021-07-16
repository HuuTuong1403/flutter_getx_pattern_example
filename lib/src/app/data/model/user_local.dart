import 'dart:convert';

class UserLocal {
  final String id;
  final String email;
  final String phone;
  final String username;

  UserLocal({
    required this.id,
    required this.email,
    required this.phone,
    required this.username,
  });

  UserLocal copyWith({
    String? id,
    String? email,
    String? phone,
    String? username,
  }) {
    return UserLocal(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'username': username,
    };
  }

  factory UserLocal.fromMap(Map<String, dynamic> map) {
    return UserLocal(
      id: map['id'],
      email: map['email'],
      phone: map['phone'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocal.fromJson(String source) =>
      UserLocal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, phone: $phone, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserLocal &&
        other.id == id &&
        other.email == email &&
        other.phone == phone &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ phone.hashCode ^ username.hashCode;
  }
}
