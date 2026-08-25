import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/order_model.dart';

class OrderService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> createOrder(OrderModel order) async {
    await _firestore
        .collection('orders')
        .doc(order.id)
        .set(order.toMap());
  }
}