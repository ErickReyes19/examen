import 'package:app_libros/models/libro.dart';
import 'package:app_libros/models/villanos.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

traerLibrosService() async {
  print("ENtróoo");
  final String response = await rootBundle.loadString('lib/core/data.json');
  if (response.isEmpty) {
    return 404;
  }
  if (response.isNotEmpty) {
    return librosFromJson(response);
  }
}

traerRellenosService(String url) async {
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return villanoFromJson(response.body);
    } else if (response.statusCode == 400) {
      return 400;
    } else if (response.statusCode == 401) {
      return 401;
    } else if (response.statusCode == 404) {
      return 404;
    } else if (response.statusCode == 500) {
      return 500;
    }
  } catch (e) {
    if (e is TimeoutException) {
      http.Client().close();
      return 4500;
    }
    if (e is SocketException) {
      http.Client().close();
      return 4501;
    }
    return 1200;
  } finally {
    http.Client().close();
  }
}

