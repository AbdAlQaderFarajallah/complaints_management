class AllCategories {
  late List<Categories> categories;

  AllCategories({required this.categories});

  AllCategories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  late int id;
  late String name;
  late String createdAt;
  late String updatedAt;
  late String sendersCount;
  late List<Senders> senders;

  Categories(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.sendersCount,
      required this.senders});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sendersCount = json['senders_count'];
    if (json['senders'] != null) {
      senders = <Senders>[];
      json['senders'].forEach((v) {
        senders.add(Senders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['senders_count'] = this.sendersCount;
    if (this.senders != null) {
      data['senders'] = this.senders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Senders {
  int? id;
  String? name;
  String? mobile;
  String? address;
  String? categoryId;
  String? createdAt;
  String? updatedAt;

  Senders(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  Senders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
