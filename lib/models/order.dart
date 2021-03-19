import 'package:erp_tela_flutter/models/address.dart';
import 'package:erp_tela_flutter/models/cart_product.dart';

enum Status {
  canceled,
  preparing,
  transporting,
  delivered,
}

class Order {
  int id;
  num price;
  String userId;
  Address address;
  Status status;
  String date;
  bool retireInStore;
  num paymentValue;
  String paymentCard;
  int paymentCardId;
  String deliveryDate;
  int userOrder;

  List<CartProduct> items;

  String get formattedId => '#${userOrder.toString().padLeft(6, '0')}';

  String get statusText => getStatusText(status);

  num get troco => paymentValue - price;

  static String getStatusText(Status status) {
    switch (status) {
      case Status.canceled:
        return 'Cancelado';
      case Status.preparing:
        return 'Em preparação';
      case Status.transporting:
        return 'Em transporte';
      case Status.delivered:
        return 'Entregue';
      default:
        return '';
    }
  }

  String get dateFormat {
    return date;
  }

  Order.fromMap(Map<String, dynamic> map) {
    print(map);
    id = map['id'];

    items = (map['itens'] as List<dynamic>).map((e) => CartProduct.fromMap(e as Map<String, dynamic>)).toList();

    price = map['price'] as num;
    userId = map['userUid'] as String;
    retireInStore = map.containsKey('retireInStore') ? map['retireInStore'] as bool : false;
    if (!retireInStore) address = Address.fromMapWithNumberKey('homeNumber', map);
    date = map['orderDate'] as String;
    paymentValue = map['paymentValue'] as num;
    paymentCard = map['paymentCard'] as String;
    deliveryDate = map['deliveryDate'] as String;
    paymentCardId = map['paymentCardId'] as int;
    userOrder = map['userOrder'] as int;

    status = Status.values[map['status'] as int];
  }

  Map<String, dynamic> toMap() => {
    'id': id ?? 0,
    'userUid': userId,
    'status': status.index,
    'price': price,
    'paymentValue': paymentValue,
    'paymentCardId': paymentCardId,
    'paymentCard': paymentCard,
    'retireInStore': retireInStore,
    'orderDate': '',
    'city': address.city,
    'complement': address.complement,
    'district': address.district,
    'latitude': address.lat,
    'longitude': address.long,
    'homeNumber': address.number,
    'state': address.state,
    'street': address.street,
    'zipCode': address.zipCode,
    'deliveryDate': deliveryDate,
    'userOrder': userOrder,
    'itens' : items.map((e) => e.toMap()).toList(),
  };
}