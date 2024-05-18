import 'package:app_libros/models/villanos.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/villanos.provider.dart';
import '../services/libros.services.dart';
import '../widgets/alerterror.widget.dart';

class VillanoController {
  final VillanoProvider villanoProvider;
  VillanoController({required this.villanoProvider});

  Future<bool> traerVillanoController(BuildContext context, String url) async {
    final villanoProvider = Provider.of<VillanoProvider>(context, listen: false);
    villanoProvider.loading = true;
    final respuesta = await traerRellenosService(url);

    if (respuesta is List<Villano>) {
      villanoProvider.listVillano = respuesta;
      villanoProvider.loading = false;
      return true;
    } else {
      villanoProvider.loading = false;
      alertError(context, mensaje: 'No hay villanos para mostrar');
    }
    return false;
  }
}
