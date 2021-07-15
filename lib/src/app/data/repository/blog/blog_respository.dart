import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_getx_pattern/src/app/data/model/blog.dart';
import 'package:uuid/uuid.dart';

class BlogRespository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future uploadBlog(String blogTitle, String blogSubTitle, String blogTags,
      String blogContent, File imageBlog) async {
    final refImage = FirebaseStorage.instance
        .ref()
        .child('blogImage')
        .child(blogTitle + '.jpg');
    await refImage.putFile(imageBlog);
    String blogImage = await refImage.getDownloadURL();
    String _uid = _auth.currentUser!.uid;
    var blogId = Uuid().v4();

    try {
      await FirebaseFirestore.instance.collection('blogs').doc(blogId).set({
        'blogId': blogId,
        'blogTitle': blogTitle,
        'blogSubTitle': blogSubTitle,
        'blogTags': blogTags,
        'blogContent': blogContent,
        'blogImage': blogImage,
        'userId': _uid,
      });
      return 'success';
    } catch (e) {
      return e;
    }
  }

  Future<List<Blog>> fetchBlog() async {
    List<Blog> _listBlog = [];
    await FirebaseFirestore.instance.collection('blogs').get().then((snapshot) {
      snapshot.docs.forEach((item) {
        _listBlog.insert(
          0,
          Blog(
            id: item.get('blogId'),
            title: item.get('blogTitle'),
            subTitle: item.get('blogSubTitle'),
            content: item.get('blogContent'),
            image: item.get('blogImage'),
            userId: item.get('userId'),
            tags: item.get('blogTags'),
          ),
        );
      });
    });
    return _listBlog;
  }
}
