import 'dart:io';

import 'package:erp_tela_flutter/models/product_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'item_size.dart';

class Product extends ChangeNotifier {
  Product({
    this.id,
    this.name,
    this.description,
    this.imagesWS,
    this.sizes,
    this.deleted = false,
  }) {
    sizes = sizes ?? [];
  }

  int id;
  String name;
  String description;
  List<ProductImage> imagesWS;

  List<String> get imagesStrings => imagesWS.map((e) => e.image).toList();
  List<ItemSize> sizes;

  List<dynamic> newImages;

  bool deleted;
  bool hasRestaured = false;

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    deleted = map['deleted'];
    imagesWS = (map["images"] as List).map((e) => ProductImage.fromMap(e)).toList();
    sizes = (map["sizes"] as List).map((e) => ItemSize.fromMap(e)).toList();
    _selectedSize = sizes == null || sizes.isEmpty ? null : sizes.firstWhere((element) => element.hasStock, orElse: () => null);
  }

  ItemSize _selectedSize;

  ItemSize get selectedSize => _selectedSize;

  String get basePrice {
    num lowest = double.infinity;
    for (final size in sizes) {
      if (size.price < lowest) lowest = size.price;
    }
    return lowest.isInfinite ? "..." : lowest.toStringAsFixed(2);
  }

  set selectedSize(ItemSize value) {
    _selectedSize = value;
    notifyListeners();
  }

  num get totalStock {
    num stock = 0;
    for (final size in sizes) {
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock => totalStock > 0 && !deleted;

  ItemSize findSize(int idSearch) {
    try {
      return sizes.firstWhere((s) => s.id == idSearch);
    } catch (e) {
      return null;
    }
  }

  List<Map<String, dynamic>> exportSizeList() {
    return sizes.map((e) => e.toMap()).toList();
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, imagesWS: $imagesWS, sizes: $sizes, newImages: $newImages}';
  }

  void clone(Product p) {
    this.id = p.id;
    this.name = p.name;
    this.description = p.description;
    this.imagesWS = p.imagesWS;
    this.sizes = p.sizes;
    this.deleted = p.deleted;
  }

  Product cloneClass() => Product(
    id: this.id,
    name: this.name,
    description: this.description,
    imagesWS: this.imagesWS,
    sizes: this.sizes,
    deleted: this.deleted,
  );
}
