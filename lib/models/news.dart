


class News{

  String author ;
  String title ;
  String description ;
  String urlToImage ;
  String publishedAt ;

  News({this.author , this.title , this.description ,this.urlToImage ,this.publishedAt});

  News.fromJson(Map <String , dynamic> jsonObj){
    this.author = jsonObj['author'] ;
    this.title = jsonObj['title'] ;
    this.description = jsonObj['description'] ;
    this.urlToImage = jsonObj['urlToImage'] ;
    this.publishedAt = jsonObj['publishedAt'];
  }

}