

class DataModel{

  String id;
  String name;

  DataModel({this.id, this.name});

  factory DataModel.fromJon(Map<String, dynamic> jsonData) {

    return ImageModel(
        id: jsonData["id"],
        name: jsonData["name"]
    );
  }
}