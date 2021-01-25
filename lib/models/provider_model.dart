import 'package:json_annotation/json_annotation.dart';
import 'package:pro_zone/models/ImageModel.dart';

@JsonSerializable(explicitToJson: true)
class ProviderModel {

  String name;
  String description;
  String rating;
  DataModel active_status;
  DataModel provider_type;
  String state;
  List<ImageModel> images;
  String address;

  ProviderModel({this.name, this.description, this.rating, this.active_status,
      this.provider_type, this.state, this.images, this.address});

  factory ProviderModel.fromJson(Map<String, dynamic> jsonData) {
    return ProviderModel(
        name: jsonData["name"],
        description: jsonData["description"],
        rating: jsonData["rating"],
        active_status: DataModel.fromJson(jsonData["active_status"]),
        provider_type: DataModel.fromJson(jsonData["provider_type"]),
        state: jsonData["state"],
        images: jsonData["images"],
        address: jsonData["address"]
    );
  }

  Map<String, dynamic> ProviderModel.toJson() {
    return {
        "name": name,
        "description": description,
        "rating": rating,
        "active_status": active_status,
        "provider_type": provider_type,
        "state": state,
        "images": images,
        "address": address
    };
  }
}