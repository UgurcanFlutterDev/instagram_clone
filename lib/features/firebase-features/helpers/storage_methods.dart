import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String childName, XFile file, bool isPost, String uid) async {
    Reference ref = _storage.ref().child(childName).child(uid);

    TaskSnapshot snap = await ref.putFile(File(file.path));
    return snap.ref.getDownloadURL();
  }
}
