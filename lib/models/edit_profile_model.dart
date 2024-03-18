
class EditProfileModelData {
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
  String? aboutMe;
  String? status;
  String? deviceToken;
  String? deviceType;
  String? stripeCustId;
  String? stripeCardId;
  int? subscription;
  String? planId;

  EditProfileModelData({
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
    this.aboutMe,
    this.status,
    this.deviceToken,
    this.deviceType,
    this.stripeCustId,
    this.stripeCardId,
    this.subscription,
    this.planId,
  });
  EditProfileModelData.fromJson(Map<String, dynamic> json) {
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
    aboutMe = json['about_me']?.toString();
    status = json['status']?.toString();
    deviceToken = json['device_token']?.toString();
    deviceType = json['device_type']?.toString();
    stripeCustId = json['stripe_cust_id']?.toString();
    stripeCardId = json['stripe_card_id']?.toString();
    subscription = json['subscription']?.toInt();
    planId = json['plan_id']?.toString();
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
    data['about_me'] = aboutMe;
    data['status'] = status;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['stripe_cust_id'] = stripeCustId;
    data['stripe_card_id'] = stripeCardId;
    data['subscription'] = subscription;
    data['plan_id'] = planId;
    return data;
  }
}

class EditProfileModel {
/*
{
  "success": true,
  "message": "Profile updated successfully",
  "data": {
    "id": 10,
    "first_name": "Puneet",
    "last_name": "Gahlot",
    "name": "Puneet Gahlot",
    "email": "puneet@yopmail.com",
    "mobile": "9854854785",
    "email_verified_at": null,
    "company": "Jploft",
    "business_title": "Export Import",
    "created_at": "2024-03-15T13:17:12.000000Z",
    "updated_at": "2024-03-15T13:25:09.000000Z",
    "image": "https://v5.checkprojectstatus.com/evolve/public/img/dummy_user.png",
    "about_me": "hello my name is user name",
    "status": "1",
    "device_token": "xyz",
    "device_type": "ios",
    "stripe_cust_id": "cus_Pk4mGQLnA3WohZ",
    "stripe_card_id": null,
    "subscription": 0,
    "plan_id": null
  }
} 
*/

  bool? success;
  String? message;
  EditProfileModelData? data;

  EditProfileModel({
    this.success,
    this.message,
    this.data,
  });
  EditProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
    data = (json['data'] != null) ? EditProfileModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
