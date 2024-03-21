class DocumentationListModel {
  bool? success;
  Data? data;
  String? message;

  DocumentationListModel({this.success, this.data, this.message});

  DocumentationListModel.fromJson(Map<String, dynamic> json) {
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
  List<DocumentationListItems>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <DocumentationListItems>[];
      json['items'].forEach((v) {
        items!.add(DocumentationListItems.fromJson(v));
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

class DocumentationListItems {
  int? id;
  int? subCategoryId;
  String? name;
  String? description;
  int? price;
  String? image;
  dynamic pdfPath;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;
  Category? category;
  dynamic purchase;
  Favorite? favorite;

  DocumentationListItems(
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
        this.category,
        this.purchase,
        this.favorite});

  DocumentationListItems.fromJson(Map<String, dynamic> json) {
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
    purchase = json['purchase'];
    favorite = json['favorite'] != null
        ? Favorite.fromJson(json['favorite'])
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
    data['purchase'] = purchase;
    if (favorite != null) {
      data['favorite'] = favorite!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class Favorite {
  int? id;
  int? userId;
  int? documentId;

  Favorite({this.id, this.userId, this.documentId});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    documentId = json['document_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['document_id'] = documentId;
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





/*class DocumentationListModel {
  bool? success;
  Data? data;
  String? message;

  DocumentationListModel({this.success, this.data, this.message});

  DocumentationListModel.fromJson(Map<String, dynamic> json) {
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
  List<DocumentationListItems>? items;
  Pagination? pagination;

  Data({this.items, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <DocumentationListItems>[];
      json['items'].forEach((v) {
        items!.add(DocumentationListItems.fromJson(v));
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

class DocumentationListItems {
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
  dynamic purchase;

  DocumentationListItems(
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
        this.category,
        this.purchase});

  DocumentationListItems.fromJson(Map<String, dynamic> json) {
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
    purchase = json['purchase'];
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
    data['purchase'] = purchase;
    return data;
  }
}

class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
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
}*/
