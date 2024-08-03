import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

abstract class TherapistRepository {
  Future<void> addTherapist(Therapist therapist);
  Future<void> updateTherapist(Therapist therapist);
  Future<void> removeTherapist(String therapistId);
  Future<List<Therapist>> getAllTherapist();
  Future<Therapist?> getTherapist(String therapistId);
  Future<String> uploadImage(File image);
}

class TherapistRepositoryImpl implements TherapistRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  TherapistRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instanceFor(bucket: 'gs://physio-digital-8d7b6.appspot.com');

  @override
  Future<void> addTherapist(Therapist therapist) async {
    DocumentReference doc = _firestore.collection('therapists').doc();
    try {
      await doc.set(therapist.toJson()..addAll({'id': doc.id}));
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        // Handle network issues
        throw Exception('Network issue: Failed to add therapist. Please check your internet connection and try again.');
      } else {
        // Handle other Firebase errors
        throw Exception('Failed to add therapist: ${e.message}');
      }
    } catch (e) {
      // Handle any other errors
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> updateTherapist(Therapist therapist) async {
    try {
      await _firestore.collection('therapists').doc(therapist.id).update(therapist.toJson());
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to update therapist. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to update therapist: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> removeTheapist(String therapistId) async {
    try {
      await _firestore.collection('therapists').doc(therapistId).delete();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to remove therapist. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to remove therapist: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<List<Therapist>> getAllTherapist() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('therapists').get();
      return snapshot.docs.map((doc) => Therapist.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to fetch therapists. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to fetch therapists: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Therapist?> getTherapist(String therapistId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('therapists').doc(therapistId).get();
      if (doc.exists) {
        return Therapist.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to fetch therapist. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to fetch therapist: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<String> uploadImage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('therapist_images/$fileName');
    UploadTask uploadTask = ref.putFile(image);
    try {
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to upload image. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to upload image: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> removeTherapist(String therapistId) async{
    try {
      await _firestore.collection('therapists').doc(therapistId).delete();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to remove therapists. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to remove therapist: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }
}
