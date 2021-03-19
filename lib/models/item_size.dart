class ItemSize {
  ItemSize({
    this.name,
    this.price,
    this.stock,
  });

  ItemSize.fromMap(Map<String, dynamic> map) {
    name = map['name'] as String;
    price = map['price'] as num;
    stock = map['stock'] as num;
    id = map['id'] as int;
    ordination = map['ordination'] as int;
  }

  int id;
  int ordination;
  String name;
  num price;
  num stock;

  bool get hasStock => stock > 0;


  @override
  String toString() {
    return 'ItemSize{id: $id, ordination: $ordination, name: $name, price: $price, stock: $stock}';
  }

  ItemSize clone() => ItemSize(
    name: name,
    price: price,
    stock: stock,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'stock': stock,
    };
  }
}
