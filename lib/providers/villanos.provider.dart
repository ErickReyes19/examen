import 'package:flutter/material.dart';

import '../models/villanos.dart';

class VillanoProvider with ChangeNotifier {
  List<Villano> _listVillanos = [];
  bool _loading = false;


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Villano> get listVillano => _listVillanos;

  set listVillano(List<Villano> value) {
    _listVillanos = value;
    notifyListeners();
  }

  resetProvider() {
    _listVillanos = [];
    _loading = false;
  }
}
