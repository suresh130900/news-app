class NewsModel {
  var title;
  var author;
  var description;
  var url;
  var urlToImage;
  var publishedAt;
  var content;
  var name;
  var source;

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        //urlToImage = json['urlToImage'] == null ? null : json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        name = json['name'],
        source = json['source'];
}
