import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampleproject/services/apiurl.dart';
import 'package:sampleproject/services/model.dart';
import 'package:sampleproject/services/state_services.dart';
import 'package:sampleproject/worldstate.dart';
import 'package:http/http.dart' as http;

class stateservices {
  Future<Covid> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.Worldstate));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Covid.fromJson(data);
    } else {
      throw Exception('Error loding filr');
    }
  }

  Future<List<dynamic>> CountriesRecord() async {
    var data;

    final response = await http.get(Uri.parse(AppUrl.countaries));

    if (response.statusCode == 200) {
       data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Error loding filr');
    }
  }
}
