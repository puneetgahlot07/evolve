class CartCategoryListModel {
  bool? success;
  Data? data;
  String? message;

  CartCategoryListModel({this.success, this.data, this.message});

  CartCategoryListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  List<CartCategoryItemsList>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CartCategoryItemsList>[];
      json['items'].forEach((v) {
        items!.add(CartCategoryItemsList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class CartCategoryItemsList {
  int? id;
  String? title;
  String? image;
  String? slug;

  CartCategoryItemsList({this.id, this.title, this.image, this.slug});

  CartCategoryItemsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['slug'] = slug;
    return data;
  }
}

class Pagination {
  int? total;
  int? limit;
  int? page;

  Pagination({this.total, this.limit, this.page});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['limit'] = limit;
    data['page'] = page;
    return data;
  }
}
