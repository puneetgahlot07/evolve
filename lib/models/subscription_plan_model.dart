class SubscriptionPlanModel {
  bool? success;
  String? message;
  List<SubscriptionPlanData>? data;

  SubscriptionPlanModel({this.success, this.message, this.data});

  SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubscriptionPlanData>[];
      json['data'].forEach((v) {
        data!.add(SubscriptionPlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriptionPlanData {
  int? id;
  String? name;
  String? stripePlan;
  String? stripePriceId;
  int? price;
  String? duration;
  String? description;
  String? createdAt;
  String? updatedAt;
  dynamic currentPlan;

  SubscriptionPlanData(
      {this.id,
        this.name,
        this.stripePlan,
        this.stripePriceId,
        this.price,
        this.duration,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.currentPlan});

  SubscriptionPlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stripePlan = json['stripe_plan'];
    stripePriceId = json['stripe_price_id'];
    price = json['price'];
    duration = json['duration'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currentPlan = json['current_plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['stripe_plan'] = stripePlan;
    data['stripe_price_id'] = stripePriceId;
    data['price'] = price;
    data['duration'] = duration;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['current_plan'] = currentPlan;
    return data;
  }
}
