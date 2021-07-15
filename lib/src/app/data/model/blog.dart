import 'dart:convert';

class Blog {
  final String id;
  final String title;
  final String subTitle;
  final String content;
  final String image;
  final String userId;
  final String tags;

  Blog({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.content,
    required this.image,
    required this.userId,
    required this.tags,
  });

  Blog copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? content,
    String? image,
    String? userId,
    String? tags,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      content: content ?? this.content,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, subTitle: $subTitle, content: $content, image: $image, userId: $userId, tags: $tags)';
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
        other.tags == tags;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subTitle.hashCode ^
        content.hashCode ^
        image.hashCode ^
        userId.hashCode ^
        tags.hashCode;
  }
}
