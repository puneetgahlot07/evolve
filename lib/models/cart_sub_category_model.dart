class CartSubCategoryModel {
  bool? success;
  Data? data;
  String? message;

  CartSubCategoryModel({this.success, this.data, this.message});

  CartSubCategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<CartSubCategoryItemsData>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CartSubCategoryItemsData>[];
      json['items'].forEach((v) {
        items!.add(CartSubCategoryItemsData.fromJson(v));
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

class CartSubCategoryItemsData {
  int? id;
  String? title;
  int? parentId;
  String? image;
  int? documentsCount;
  Parent? parent;

  CartSubCategoryItemsData({this.id, this.title, this.parentId,this.documentsCount, this.image, this.parent});

  CartSubCategoryItemsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parentId = json['parent_id'];    
    image = json['image'];
    documentsCount = json['documents_count'];
    parent =
    json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['parent_id'] = parentId;
    data['documents_count'] = documentsCount;
    data['image'] = image;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    return data;
  }
}

class Parent {
  int? id;
  String? title;
  String? image;

  Parent({this.id, this.title, this.image});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
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
