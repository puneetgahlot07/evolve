class CardListModel {
  bool? success;
  List<CardListData>? data;
  String? message;

  CardListModel({this.success, this.data, this.message});

  CardListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CardListData>[];
      json['data'].forEach((v) {
        data!.add(CardListData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class CardListData {
  int? id;
  int? userId;
  String? stripeCardId;
  String? expMonth;
  String? expYear;
  String? last4;
  String? brand;
  String? name;
  int? isDefault;
  String? createdAt;
  String? updatedAt;

  CardListData(
      {this.id,
        this.userId,
        this.stripeCardId,
        this.expMonth,
        this.expYear,
        this.last4,
        this.brand,
        this.name,
        this.isDefault,
        this.createdAt,
        this.updatedAt});

  CardListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    stripeCardId = json['stripe_card_id'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    last4 = json['last4'];
    brand = json['brand'];
    name = json['name'];
    isDefault = json['is_default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['stripe_card_id'] = stripeCardId;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['last4'] = last4;
    data['brand'] = brand;
    data['name'] = name;
    data['is_default'] = isDefault;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
