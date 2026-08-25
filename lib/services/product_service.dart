import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts() async {
    final snapshot = await _firestore
        .collection('products')      //roh ll fire store hat products ely gwa collection
        .get();

    return snapshot.docs.map((doc) {
      return ProductModel.fromMap(
        doc.id,
        doc.data(),
      );
    }).toList();
  }

  Future<void> addProduct(ProductModel product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .set(product.toMap());
  }

  Future<void> updateProduct(ProductModel product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }

  Future<void> deleteProduct(String productId) async {
    await _firestore
        .collection('products')
        .doc(productId)
        .delete();
  }
}