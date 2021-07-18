import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String id;
  final String title;
  final String subTitle;
  final String content;
  final String image;
  final String userId;
  final String tags;
  final String categoriesName;
  final Timestamp createAt;

  Blog({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.content,
    required this.image,
    required this.userId,
    required this.tags,
    required this.categoriesName,
    required this.createAt,
  });

  Blog copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? content,
    String? image,
    String? userId,
    String? tags,
    String? categoriesName,
    Timestamp? createAt,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      content: content ?? this.content,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      categoriesName: categoriesName ?? this.categoriesName,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'content': content,
      'image': image,
      'userId': userId,
      'tags': tags,
      'categoriesName': categoriesName,
      'createAt': createAt,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'],
      title: map['title'],
      subTitle: map['subTitle'],
      content: map['content'],
      image: map['image'],
      userId: map['userId'],
      tags: map['tags'],
      categoriesName: map['categoriesName'],
      createAt: map['createAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, subTitle: $subTitle, content: $content, image: $image, userId: $userId, tags: $tags, categoriesName: $categoriesName, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Blog &&
        other.id == id &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.content == content &&
        other.image == image &&
        other.userId == userId &&
        other.tags == tags &&
        other.categoriesName == categoriesName &&
        other.createAt == createAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subTitle.hashCode ^
        content.hashCode ^
        image.hashCode ^
        userId.hashCode ^
        tags.hashCode ^
        categoriesName.hashCode ^
        createAt.hashCode;
  }
}
