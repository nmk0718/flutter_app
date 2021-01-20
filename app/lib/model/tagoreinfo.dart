import 'package:app/model/post.dart';

class TagoreInfo {
  List<Post> tagores;

  TagoreInfo({this.tagores});

  TagoreInfo.fromJson(Map<String, dynamic> json) {
    if (json['Tagores'] != null) {
      tagores = new List<Post>();
      json['Tagores'].forEach((v) {
        tagores.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tagores != null) {
      data['Tagores'] = this.tagores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tagores {
  String title;
  String author;
  String description;
  String imageUrl;

  Tagores({this.title, this.author, this.description, this.imageUrl});

  Tagores.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    author = json['Author'];
    description = json['Description'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Author'] = this.author;
    data['Description'] = this.description;
    data['ImageUrl'] = this.imageUrl;
    return data;
  }
}