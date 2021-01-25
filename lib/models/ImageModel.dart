
class ImageModel {

  String url;
  String previewUrl;

  ImageModel({this.url, this.previewUrl});

  factory ImageModel.fromJson(Map<String, dynamic> jsonData) {

    return ImageModel(
      url: jsonData["url"],
      previewUrl: jsonData["previewUrl"]
    );
  }
}