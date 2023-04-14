class MemeResponse {
  bool? success;
  MemeData? data;

  MemeResponse.fromJsonMap(Map<String, dynamic> map) {
    success = map['success'];
    data = map['data'] == null? null: MemeData.fromJsonMap(map['data']);
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
  };
}

class MemeData {
  List<MemeContent>? meme;

  MemeData.fromJsonMap(Map<String, dynamic> map) {
    meme = map['memes'] == null? []: List.from(map['memes']
        .map((it) => MemeContent.fromJsonMap(it)));
  }

  Map<String, dynamic> toJson() => {
    'memes': meme?.map((e) => e.toJson()).toList(),
  };
}

class MemeContent {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  MemeContent.fromJsonMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    width = map['width'];
    height = map['height'];
    boxCount = map['box_count'];
    captions = map['captions'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'url': url,
    'width': width,
    'height': height,
    'box_count': boxCount,
    'captions': captions,
  };
}