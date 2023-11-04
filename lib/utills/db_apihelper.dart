import 'dart:convert';

import 'package:insertapi/screen/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:insertapi/screen/model/read_model.dart';
class ApiHelper
{

  Future<InsertModel>Insert(String id,String name,String dic) async {
    var data = {
      "department_id":"$id",
      "department_name":"$name",
      "des":"$dic"
    };
    http.Response response = await http.post(
        Uri.parse(
            'https://home.blissivf.com/api/department/insert'),
        body: json.encode(data)
    );

    if (response.statusCode == 200) {
       var jsonResponse = json.decode(response.body);
       return InsertModel.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<ReadModel>> fetchEmployee() async {
    var client = http.Client();
    var response = await client.get(Uri.parse("https://home.blissivf.com/api/department/fetch"),);
    print(response);
    if (response.statusCode == 200) {
      List jsonResponse  =json.decode( response.body);
      return jsonResponse.map((e) => ReadModel.fromJson(e)).toList();
      // return jsonResponse.map((data) => GetEmployee.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<InsertModel>updataData(String id,String name,String dic) async {
    var data = {
      "department_id":"$id",
      "department_name":"$name",
      "des":"$dic"
    };
    http.Response response = await http.post(
        Uri.parse(
            'https://home.blissivf.com/api/department/update'),
        body: json.encode(data)
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return InsertModel.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<InsertModel>Delet(String id) async {
    var data = {
      "department_delete":"$id",
    };
    http.Response response = await http.post(
        Uri.parse(
            'https://home.blissivf.com/api/department/delete'),
        body: json.encode(data)
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return InsertModel.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}