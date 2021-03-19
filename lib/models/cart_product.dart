import 'package:erp_tela_flutter/models/item_size.dart';
import 'package:erp_tela_flutter/models/product.dart';
import 'package:flutter/material.dart';

class CartProduct extends ChangeNotifier {
  CartProduct.fromProduct(this._product) {
    product = _product;
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
    productSizeId = product.selectedSize.id;
    fixedPrice = product.selectedSize.price;
  }

  CartProduct.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    userUid = map['userUid'] as String;
    productId = map['productId'] as int;
    productSizeId = map['productSizeId'] as int;
    quantity = map['quantity'] as num;
    size = map['size'] as String;
    fixedPrice = map['fixedPrice'] as num;
  }

  int id;
  String userUid;
  int productId;
  int productSizeId;
  num quantity;
  String size;

  num fixedPrice;

  Product _product;

  Product get product => _product;

  set product(Product value) {
    _product = value;
    notifyListeners();
  }

  ItemSize get itemSize {
    if (product == null) {
      return null;
    }
    return product.findSize(productSizeId);
  }

  num get unitPrice {
    if (product == null) return 0;

    return itemSize?.price ?? 0;
  }

  num get totalPrice => unitPrice * quantity;

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
    };
  }

  Map<String, dynamic> toOrderItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
      'size': size,
      'fixedPrice': fixedPrice ?? unitPrice,
    };
  }

  bool stackable(Product product) {
    return product.id == productId && product.selectedSize.id == productSizeId;
  }

  void increment() {
    quantity++;

    notifyListeners();
  }

  void decrement() {
    quantity--;
    notifyListeners();
  }

  bool get hasStock {
    if (product != null && product.deleted) return false;
    final size = itemSize;
    if (size == null) return false;
    return size.stock >= quantity;
  }

  Map<String, dynamic> toMap() => {
    'id': id ?? 0,
    'userUid': userUid,
    'productId': productId,
    'productSizeId': productSizeId,
    'quantity': quantity,
    'size': size,
    'fixedPrice': fixedPrice,
  };
}
