class GetProductResModel {
  num? id;
  var title;
  num? price;
  var description;
  var category;
  var image;
  String? userId;
  num? qnt;
  Rating? rating;

  GetProductResModel(
      {this.id,
        this.userId,
        this.qnt,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  GetProductResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    qnt = json['qnt'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['qnt'] = qnt;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
