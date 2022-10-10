import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SpecialtiesService with ChangeNotifier {
  final String _baseUrl = 'https://dev-ave.online';

  final storage = const FlutterSecureStorage();

  Map<String, dynamic> specialties = {};
  bool isLoading = true;

  SpecialtiesService() {
    loadSpecialties();
  }

  Future loadSpecialties() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("$_baseUrl/api/v1/speciality");
    var headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${await storage.read(key: 'token') ?? ""}'
    };

    final resp = await http.get(url, headers: headers);

    final Map<String, dynamic> specialtiesMap = json.decode(resp.body);
    // print(specialtiesMap);
    print('Se recargo Specialties');

    // specialtiesMap['data']['items'].forEach((key, value) {
    //   print("key $key");
    //   print("value $value");
    //   //   final tempSpecialties = Specialties.fromMap(value);
    //   //   tempSpecialties.id = key;
    //   //   specialties.add(tempSpecialties);
    //   //   //   final tempProduct = Specialties.fromMap(value);
    //   //   //   specialties.add(tempProduct);
    // });

    specialties = specialtiesMap;

    isLoading = false;
    notifyListeners();

    return specialties;
  }

  Future createNewSpecialties(Map<String, dynamic> newItem) async {
    final url = Uri.parse("$_baseUrl/api/v1/speciality/create");
    var headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${await storage.read(key: 'token') ?? ""}'
    };

    final Map<String, String> body = {
      'name': newItem['name'],
      'description': newItem['description'],
    };

    final resp =
        await http.post(url, headers: headers, body: json.encode(body));

    final Map<String, dynamic> specialtiesMap = json.decode(resp.body);
    print(specialtiesMap);

    return specialtiesMap['msg'];
  }

  Future updateSpecialties(Map<String, dynamic> item) async {
    final url = Uri.parse("$_baseUrl/api/v1/speciality");
    var headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${await storage.read(key: 'token') ?? ""}'
    };

    final Map<String, String> body = {
      'id': item['id'].toString(),
      'name': item['name'],
      'description': item['description'],
    };

    final resp = await http.put(url, headers: headers, body: json.encode(body));

    final Map<String, dynamic> specialtiesMap = json.decode(resp.body);
    print(specialtiesMap);

    return specialtiesMap['msg'];
  }
}
