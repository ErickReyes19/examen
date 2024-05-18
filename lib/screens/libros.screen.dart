import 'package:app_libros/controllers/libros.controller.dart';
import 'package:app_libros/providers/libros.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cargando.widget.dart';
import '../widgets/nodata.widget.dart';
import '../widgets/textoprincipal.widget.dart';
import '../widgets/textparrafo.widget.dart';
import '../widgets/textsecundario.widget.dart';
import '../widgets/cardlibro.widget.dart';

class LibrosVisorScreen extends StatefulWidget {
  const LibrosVisorScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<LibrosVisorScreen> createState() => _LibrosVisorScreenState();
}

class _LibrosVisorScreenState extends State<LibrosVisorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final librosProvider = Provider.of<LibroProvider>(context);
    Size size = MediaQuery.of(context).size;
    final tema = Theme.of(context).colorScheme;
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              LibroController(libroProvider: librosProvider)
                  .traerLibroController(context);
            },
          ),
          backgroundColor: tema.background,
          body: Column(
            children: [
              AppBar(
                backgroundColor: tema.background,
                elevation: 0,
                centerTitle: true,
                titleSpacing: 0,
                title: TextSecundario(
                    texto: 'Libros',
                    textAlign: TextAlign.center,
                    colorTexto: tema.primary),
              ),
              librosProvider.listLibro.isNotEmpty
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextPrincipal(
                                  texto: librosProvider.listLibro[0].title),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: librosProvider.listLibro.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardLibro(
                                      libro: librosProvider.listLibro[index]);
                                }),
                          ],
                        ),
                      ),
                    )
                  : NoDataWidget(
                      tema: tema,
                      size: size,
                    )
            ],
          ),
        ),
        if (librosProvider.loading) CargandoWidget(size: size, conColor: true),
      ],
    ));
  }
}
