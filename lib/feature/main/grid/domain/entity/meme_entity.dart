class MemeEntity {
  final bool? success;
  final DataMeme? data;

  MemeEntity({this.success, this.data});
}

class DataMeme {
  List<ContentMeme>? meme;

  DataMeme({this.meme});
}

class ContentMeme {
  final String? id;
  final String? name;
  final String? url;
  final int? width;
  final int? height;
  final int? boxCount;
  final int? captions;

  ContentMeme(
      {this.id,
      this.name,
      this.url,
      this.width,
      this.height,
      this.boxCount,
      this.captions});
}