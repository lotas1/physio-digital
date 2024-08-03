import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:physio_digital/model/clinic/clinic.dart';

abstract class ClinicRepository {
  Future<void> addClinic(Clinic clinic);
  Future<void> updateClinic(Clinic clinic);
  Future<void> removeClinic(String clinicId);
  Future<List<Clinic>> getAllClinic();
  Future<Clinic?> getClinic(String clinicId);
  Future<String> uploadImage(File image);
}

class ClinicRepositoryImpl implements ClinicRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ClinicRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instanceFor(bucket: 'gs://physio-digital-8d7b6.appspot.com');

  @override
  Future<void> addClinic(Clinic clinic) async {
    DocumentReference doc = _firestore.collection('clinics').doc();
    try {
      await doc.set(clinic.toJson()..addAll({'id': doc.id}));
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        // Handle network issues
        throw Exception('Network issue: Failed to add clinic. Please check your internet connection and try again.');
      } else {
        // Handle other Firebase errors
        throw Exception('Failed to add clinic: ${e.message}');
      }
    } catch (e) {
      // Handle any other errors
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> updateClinic(Clinic clinic) async {
    try {
      await _firestore.collection('clinics').doc(clinic.id).update(clinic.toJson());
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to update clinic. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to update clinic: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<void> removeClinic(String clinicId) async {
    try {
      await _firestore.collection('clinics').doc(clinicId).delete();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to remove clinic. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to remove clinic: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<List<Clinic>> getAllClinic() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('clinics').get();
      return snapshot.docs.map((doc) => Clinic.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to fetch clinics. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to fetch clinics: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Clinic?> getClinic(String clinicId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('clinics').doc(clinicId).get();
      if (doc.exists) {
        return Clinic.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        throw Exception('Network issue: Failed to fetch clinic. Please check your internet connection and try again.');
      } else {
        throw Exception('Failed to fetch clinic: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<String> uploadImage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = _storage.ref().child('clinic_images/$fileName');
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
}
