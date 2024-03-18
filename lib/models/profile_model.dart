
class ProfileModelData {
/*
{
  "id": 1,
  "first_name": "Himanshu",
  "last_name": "jain",
  "name": "Himanshu jain",
  "email": "himanshu001@yopmail.com",
  "mobile": "9854854785",
  "email_verified_at": null,
  "company": "Jploft",
  "business_title": "Export Import",
  "created_at": "2024-03-11T00:52:45.000000Z",
  "updated_at": "2024-03-11T10:58:59.000000Z",
  "image": "https://v5.checkprojectstatus.com/evolve/public/users/MQIeOlCgHqnvjN6rxPqC_1710138165.png",
  "status": "1",
  "device_token": "xyz",
  "device_type": "ios",
  "stripe_cust_id": "cus_PiTCAMK154Ho62",
  "stripe_card_id": null
} 
*/

  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? mobile;
  String? emailVerifiedAt;
  String? company;
  String? businessTitle;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? status;
  String? deviceToken;
  String? deviceType;
  String? stripeCustId;
  String? stripeCardId;

  ProfileModelData({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.company,
    this.businessTitle,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.status,
    this.deviceToken,
    this.deviceType,
    this.stripeCustId,
    this.stripeCardId,
  });
  ProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    company = json['company']?.toString();
    businessTitle = json['business_title']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    image = json['image']?.toString();
    status = json['status']?.toString();
    deviceToken = json['device_token']?.toString();
    deviceType = json['device_type']?.toString();
    stripeCustId = json['stripe_cust_id']?.toString();
    stripeCardId = json['stripe_card_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['email_verified_at'] = emailVerifiedAt;
    data['company'] = company;
    data['business_title'] = businessTitle;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['status'] = status;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['stripe_cust_id'] = stripeCustId;
    data['stripe_card_id'] = stripeCardId;
    return data;
  }
}

class ProfileModel {
/*
{
  "success": true,
  "message": "user detail",
  "data": {
    "id": 1,
    "first_name": "Himanshu",
    "last_name": "jain",
    "name": "Himanshu jain",
    "email": "himanshu001@yopmail.com",
    "mobile": "9854854785",
    "email_verified_at": null,
    "company": "Jploft",
    "business_title": "Export Import",
    "created_at": "2024-03-11T00:52:45.000000Z",
    "updated_at": "2024-03-11T10:58:59.000000Z",
    "image": "https://v5.checkprojectstatus.com/evolve/public/users/MQIeOlCgHqnvjN6rxPqC_1710138165.png",
    "status": "1",
    "device_token": "xyz",
    "device_type": "ios",
    "stripe_cust_id": "cus_PiTCAMK154Ho62",
    "stripe_card_id": null
  },
  "responsecode": 200
} 
*/

  bool? success;
  String? message;
  ProfileModelData? data;
  int? responsecode;

  ProfileModel({
    this.success,
    this.message,
    this.data,
    this.responsecode,
  });
  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? ProfileModelData.fromJson(json['data']) : null;
    responsecode = json['responsecode']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['responsecode'] = responsecode;
    return data;
  }
}
