import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/login_resp.dart';

class ApiClient {
  final _dio = Dio();

  dynamic loginUser({required String email, required String password}) async {
    var response = await _dio.post('https://reqres.in/api/login',
        data:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.statusCode == 200) {
      SharedPref().storeUserData(response.data);
      print(response.data);
      return LoginResp.fromJson(response.data);
    } else {
      log('api err -> ${response.statusCode} -> ${response.statusMessage}');
      return null;
    }
  }
}

class SharedPref {
  final _sharedPref = SharedPreferences.getInstance();

  Future storeUserData(Map data) async {
    final pref = await _sharedPref;
    var encodedData = jsonEncode(data);
    print(encodedData);
    await pref.setString('token', encodedData);
  }

  dynamic getUserData() async {
    final pref = await _sharedPref;
    var data = pref.getString('token');
    log('data -> $data');
    print("----- $data");
    if (data != null) {
      return LoginResp.fromJson(jsonDecode(data));
    }
  }
}
