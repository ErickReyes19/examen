import 'package:flutter/material.dart';

import '../models/libro.dart';

class LibroProvider with ChangeNotifier {
  List<Datum> _listLibro = [];
  bool _loading = false;


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Datum> get listLibro => _listLibro;

  set listLibro(List<Datum> value) {
    _listLibro = value;
    notifyListeners();
  }



  resetProvider() {
    _listLibro = [];
    _loading = false;
  }
}
