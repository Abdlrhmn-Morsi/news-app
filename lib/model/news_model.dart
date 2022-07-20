class News {
  String? title;
  String? description;
  String? imageUrl;
  News({
    this.title,
    this.description,
    this.imageUrl,
  });

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['urlToImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'urlToImage': imageUrl,
    };
  }
}
