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
  Future<List<String>> getAllProductImageUrls(); // New method
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
    try {
      DocumentReference doc = _firestore.collection('products').doc();
      await doc.set(product.toJson()..addAll({'id': doc.id}));
    } catch (e) {
      print('Error adding product: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateProduct(Product product) async {
    try {
      await _firestore.collection('products').doc(product.id).update(product.toJson());
    } catch (e) {
      print('Error updating product: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeProduct(String productId) async {
    try {
      await _firestore.collection('products').doc(productId).delete();
    } catch (e) {
      print('Error removing product: $e');
      rethrow;
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Convert price to String if it's a double
        if (data['price'] is double) {
          data['price'] = data['price'].toString();
        }
        // Ensure images are properly cast to List<String>
        if (data['images'] != null && data['images'] is List) {
          data['images'] = (data['images'] as List).cast<String>();
        } else {
          data['images'] = <String>[]; // Provide an empty list if images is null or not a list
        }
        return Product.fromJson(data);
      }).toList();
    } catch (e) {
      print('Error getting all products: $e');
      rethrow;
    }
  }

  @override
  Future<Product?> getProduct(String productId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('products').doc(productId).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data['price'] is double) {
          data['price'] = data['price'].toString();
        }
        if (data['images'] != null && data['images'] is List) {
          data['images'] = (data['images'] as List).cast<String>();
        } else {
          data['images'] = <String>[];
        }
        return Product.fromJson(data);
      }
      return null;
    } catch (e) {
      print('Error getting product: $e');
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('product_images/$fileName');
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }

  @override
  Future<List<String>> getAllProductImageUrls() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('products').get();
      List<String> imageUrls = [];
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (data['images'] != null && data['images'] is List) {
          List<String> images = (data['images'] as List).cast<String>();
          imageUrls.addAll(images);
        }
      }
      return imageUrls;
    } catch (e) {
      print('Error getting all product image URLs: $e');
      rethrow;
    }
  }
}