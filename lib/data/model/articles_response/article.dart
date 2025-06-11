import 'package:news_app/features/news/sources/data/model/source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Nena Farrell"
/// title : "Best Black Friday Deals on LED Face Masks (2024)"
/// description : "Looking to upgrade your skincare routine with a little LED light? Score these fantastic masks (and other LED gadgets) while they're on sale."
/// url : "https://www.wired.com/story/led-masks-black-friday-2024/"
/// urlToImage : "https://media.wired.com/photos/6633bc86c80af9a1d4c89122/191:100/w_1280,c_limit/Dr-Dennis-Gross-Spectralite-LED-Light-Therapy-Mask-Abstract-Background-SOURCE-Dr-Dennis-Gross.jpg"
/// publishedAt : "2024-11-29T19:53:53Z"
/// content : "If you've been hoping to jump on the LED train, there's no better time than right now. These masks and tools have been gaining in popularity for their promise to erase fine lines and brighten your sk… [+3000 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
