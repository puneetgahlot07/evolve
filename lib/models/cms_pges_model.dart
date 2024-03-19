class CMSPagesModel {
  bool? success;
  String? message;
  CMSPagesData? data;

  CMSPagesModel({this.success, this.message, this.data});

  CMSPagesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? CMSPagesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CMSPagesData {
  int? id;
  String? slug;
  String? title;
  String? description;

  CMSPagesData({this.id, this.slug, this.title, this.description});

  CMSPagesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
