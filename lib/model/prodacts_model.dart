class ProdactsModel {
  String? name, price, img, description;
  ProdactsModel({this.img, this.name, this.description, this.price});
  ProdactsModel.fromjson(map) {
    name = map['name'];
    price = map['price'];
    img = map['img'];
    description = map['description'];
  }
}
