class FavoritesItemsListModel {
  bool? success;
  Data? data;
  String? message;

  FavoritesItemsListModel({this.success, this.data, this.message});

  FavoritesItemsListModel.fromJson(Map<String, dynamic> json) {
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
  List<FavoritesItemsData>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <FavoritesItemsData>[];
      json['items'].forEach((v) {
        items!.add(FavoritesItemsData.fromJson(v));
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

class FavoritesItemsData {
  int? id;
  int? userId;
  int? documentId;
  String? createdAt;
  String? updatedAt;
  Document? document;

  FavoritesItemsData(
      {this.id,
        this.userId,
        this.documentId,
        this.createdAt,
        this.updatedAt,
        this.document});

  FavoritesItemsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    documentId = json['document_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    document = json['document'] != null
        ? Document.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['document_id'] = documentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (document != null) {
      data['document'] = document!.toJson();
    }
    return data;
  }
}

class Document {
  int? id;
  int? subCategoryId;
  String? name;
  String? description;
  int? price;
  String? image;
  String? pdfPath;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Document(
      {this.id,
        this.subCategoryId,
        this.name,
        this.description,
        this.price,
        this.image,
        this.pdfPath,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.category});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    pdfPath = json['pdf_path'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_category_id'] = subCategoryId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['pdf_path'] = pdfPath;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? image;
  String? slug;
  int? parentId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.title,
        this.image,
        this.slug,
        this.parentId,
        this.status,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    slug = json['slug'];
    parentId = json['parent_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
