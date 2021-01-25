import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_zone/models/api_response.dart';
import 'package:pro_zone/models/provider_model.dart';

class AppService{

    static const BASE_URL = "https://pro-zone.herokuapp.com";
    var headers = {
      'Content-Type' : 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjExNTYzNjEzLCJleHAiOjE2MTQxNTU2MTN9.e5Df8V75KU44Hz4IG1ilKby0ptkJzX7hFcbX5XZ-EEI'
    };

    Future<APIResponse<List<ProviderModel>>> getProviders() {
      return http.get(BASE_URL + "/providers",  headers: headers).then((data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          var providers = <ProviderModel>[];
          for (var item in jsonData) {
            providers.add(ProviderModel.fromJson(item));
          }
          return APIResponse<List<ProviderModel>>(data: providers);
        }
        return APIResponse<List<ProviderModel>>(error: true, errorMessage: "A problem occurred");
      }).catchError((_) => APIResponse<List<ProviderModel>>(error: true, errorMessage: "Network Error"));
    }

    Future addProvider(ProiderModel: provider) {
      return http.post(BASE_URL + "/providers", headers: headers, body: json.encode(provider.toJson()))
        .then((data) {
          if (data.statusCode == 200) {
              return APIResponse<bool>(data: true);
          }
          return APIResponse<bool>(error: true, errorMessage: "An error occurred");
        }).catchError((_) => APIResponse<bool>(error: true, errorMessage: "An error occurred"));
    }
}