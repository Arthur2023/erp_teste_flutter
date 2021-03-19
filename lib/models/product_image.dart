class ProductImage {
  int id;
  int productId;
  String image;

  ProductImage.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    productId = map['productId'];
    image = map['image'];
  }

  ProductImage(this.id, this.productId, this.image);

  Map<String, dynamic> toMap() => {
    'id': id,
    'productId': productId,
    'image': image,
  };
}
