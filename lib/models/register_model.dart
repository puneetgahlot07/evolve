///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class RegisterModelData {
/*
{
  "first_name": "Shyam",
  "last_name": "Singh",
  "email": "shyam121@yopmail.com",
  "mobile": "9854854785",
  "company": "Jploft",
  "business_title": "Export Import",
  "device_token": "asd564dfa6s54df5as6d4f6as65f45s",
  "device_type": "IOS",
  "name": "Shyam Singh",
  "updated_at": "2024-03-11T11:04:35.000000Z",
  "created_at": "2024-03-11T11:04:35.000000Z",
  "id": 11,
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Y1LmNoZWNrcHJvamVjdHN0YXR1cy5jb20vZXZvbHZlL3B1YmxpYy9hcGkvdjEvcmVnaXN0ZXIiLCJpYXQiOjE3MTAxNTUwNzUsImV4cCI6MTcxMDUxNTA3NSwibmJmIjoxNzEwMTU1MDc1LCJqdGkiOiJ6NW4yNGFWMWU1MHNqTVlpIiwic3ViIjoiMTEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2dRBqKrPejEBQ7hhYrP0bBxBwO6p_7wv2wHxWEuBqK4"
} 
*/

  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? company;
  String? businessTitle;
  String? deviceToken;
  String? deviceType;
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;

  RegisterModelData({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.company,
    this.businessTitle,
    this.deviceToken,
    this.deviceType,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.token,
  });
  RegisterModelData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    company = json['company']?.toString();
    businessTitle = json['business_title']?.toString();
    deviceToken = json['device_token']?.toString();
    deviceType = json['device_type']?.toString();
    name = json['name']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
    token = json['token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['company'] = company;
    data['business_title'] = businessTitle;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['name'] = name;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}

class RegisterModel {
/*
{
  "success": true,
  "data": {
    "first_name": "Shyam",
    "last_name": "Singh",
    "email": "shyam121@yopmail.com",
    "mobile": "9854854785",
    "company": "Jploft",
    "business_title": "Export Import",
    "device_token": "asd564dfa6s54df5as6d4f6as65f45s",
    "device_type": "IOS",
    "name": "Shyam Singh",
    "updated_at": "2024-03-11T11:04:35.000000Z",
    "created_at": "2024-03-11T11:04:35.000000Z",
    "id": 11,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Y1LmNoZWNrcHJvamVjdHN0YXR1cy5jb20vZXZvbHZlL3B1YmxpYy9hcGkvdjEvcmVnaXN0ZXIiLCJpYXQiOjE3MTAxNTUwNzUsImV4cCI6MTcxMDUxNTA3NSwibmJmIjoxNzEwMTU1MDc1LCJqdGkiOiJ6NW4yNGFWMWU1MHNqTVlpIiwic3ViIjoiMTEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2dRBqKrPejEBQ7hhYrP0bBxBwO6p_7wv2wHxWEuBqK4"
  },
  "message": "User registered."
} 
*/

  bool? success;
  RegisterModelData? data;
  String? message;

  RegisterModel({
    this.success,
    this.data,
    this.message,
  });
  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = (json['data'] != null) ? RegisterModelData.fromJson(json['data']) : null;
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}
