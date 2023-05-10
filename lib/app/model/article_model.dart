class ArticleModel {
  ArticleModel(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.imageUrl,
      required this.publishedAt,
      required this.content});

  String author, description, imageUrl, content;
  String title, url;
  DateTime publishedAt;
  SourceModel source;

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'urlToImage': imageUrl,
      'content': content,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'source': source,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] ?? "",
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        url: json['url'] ?? "",
        imageUrl: json['urlToImage'] ?? "",
        publishedAt: json['publishedAt'] != null
            ? DateTime.parse(json['publishedAt'])
            : DateTime.now(),
        content: json['content'] ?? "",
      );

  static List<ArticleModel> articles = [
    ArticleModel(
      title:
          'Lorem ipsum dolor sit amet, consectetur elit. Cras molestie maximus',
      description:
          'Nullam sed augue a turpis bibendum cursus. Suspendisse potenti. Praesent mi ligula, mollis quis elit ac, eleifend vestibulum ex. Nullam quis sodales tellus. Integer feugiat dolor et nisi semper luctus. Nulla egestas nec augue facilisis pharetra. Sed ultricies nibh a odio aliquam, eu imperdiet purus aliquam. Donec id ante nec',
      author: 'Anna G. Wright',
      imageUrl:
          'https://images.unsplash.com/photo-1656106534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
      content: '',
      source: SourceModel(name: "Nediot"),
      url: '',
    ),
  ];
}

class SourceModel {
  SourceModel({this.id = '', required this.name});

  String? id, name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
