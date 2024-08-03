import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/product/product.dart';

abstract class ProductRepository {
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> removeProduct(String productId);
  Future<List<Product>> getAllProducts();
  Future<Product?> getProduct(String productId);
  Future<String> uploadImage(File image);
}
class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ProductRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instanceFor(bucket: 'gs://physio-digital-8d7b6.appspot.com');

  @override
  Future<void> addProduct(Product product) async {
    DocumentReference doc = _firestore.collection('products').doc();
    await doc.set(product.toJson()..addAll({'id': doc.id}));
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _firestore.collection('products').doc(product.id).update(product.toJson());
  }

  @override
  Future<void> removeProduct(String productId) async {
    await _firestore.collection('products').doc(productId).delete();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    QuerySnapshot snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  @override
  Future<Product?> getProduct(String productId) async {
    DocumentSnapshot doc = await _firestore.collection('products').doc(productId).get();
    if (doc.exists) {
      return Product.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<String> uploadImage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('product_images/$fileName');
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}