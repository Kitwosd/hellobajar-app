class MyProfileModel {
  bool? success;
  Profile? profile;

  MyProfileModel({this.success, this.profile});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? gender;
  Null? avatar;
  String? address;
  String? city;

  Profile({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
    this.avatar,
    this.address,
    this.city,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    avatar = json['avatar'];
    address = json['address'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['city'] = this.city;
    return data;
  }
}
