import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;
  final String author;
  final String tiltle;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const ArticleEntity({
    required this.id,
    required this.author,
    required this.tiltle,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  ArticleEntity copyWith({
    int? id,
    String? author,
    String? tiltle,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return ArticleEntity(
      id: id ?? this.id,
      author: author ?? this.author,
      tiltle: tiltle ?? this.tiltle,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'author': author});
    result.addAll({'tiltle': tiltle});
    result.addAll({'description': description});
    result.addAll({'url': url});
    result.addAll({'urlToImage': urlToImage});
    result.addAll({'publishedAt': publishedAt});
    result.addAll({'content': content});

    return result;
  }

  factory ArticleEntity.fromMap(Map<String, dynamic> map) {
    return ArticleEntity(
      id: map['id']?.toInt() ?? 0,
      author: map['author'] ?? '',
      tiltle: map['tiltle'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleEntity.fromJson(String source) =>
      ArticleEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleEntity(id: $id, author: $author, tiltle: $tiltle, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  List<Object> get props {
    return [
      id,
      author,
      tiltle,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
