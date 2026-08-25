import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String userId;
  final List<Map<String, dynamic>> items;
  final double totalPrice;
  final String address;
  final String paymentMethod;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.address,
    required this.paymentMethod,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'items': items,
      'totalPrice': totalPrice,
      'address': address,
      'paymentMethod': paymentMethod,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory OrderModel.fromMap(
      String id,
      Map<String, dynamic> data,
      ) {
    return OrderModel(
      id: id,
      userId: data['userId'] ?? '',
      items: List<Map<String, dynamic>>.from(
        data['items'] ?? [],
      ),
      totalPrice: (data['totalPrice'] ?? 0).toDouble(),
      address: data['address'] ?? '',
      paymentMethod: data['paymentMethod'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}