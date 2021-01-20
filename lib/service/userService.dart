import 'dart:convert';
//import 'dart:html';

import 'package:JobFinderApp/model/userModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const ADD_URL = "http://192.168.254.108/JobFinderApp/add.php";
  static const VIEW_URL = "http://192.168.254.108/JobFinderApp/view.php";
  static const UPDATE_URL = "http://192.168.254.108/JobFinderApp/update.php";
  static const DELETE_URL = "http://192.168.254.108/JobFinderApp/delete.php";

  Future<String> addUser(UserModel userModel) async {
    final response = await http.post(ADD_URL, body: userModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  List<UserModel> userFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  }

  Future<List<UserModel>> getUserData() async {
    final response = await http.get(VIEW_URL);
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      return List<UserModel>();
    }
  }

  Future<String> updateUser(UserModel userModel) async {
    final response =
        await http.post(UPDATE_URL, body: userModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteUser(UserModel userModel) async {
    final response =
        await http.post(DELETE_URL, body: userModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
