// models/login_response_model.dart
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? gender;
  final String? avatar;
  final String address;
  final String city;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.gender,
    this.avatar,
    required this.address,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      gender: json['gender'],
      avatar: json['avatar'],
      address: json['address'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'avatar': avatar,
      'address': address,
      'city': city,
    };
  }
}

class LoginResponse {
  final bool success;
  final String access;
  final String refresh;
  final User user;

  LoginResponse({
    required this.success,
    required this.access,
    required this.refresh,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      access: json['access'] ?? '',
      refresh: json['refresh'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'access': access,
      'refresh': refresh,
      'user': user.toJson(),
    };
  }
}
