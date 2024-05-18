import 'package:flutter/material.dart';
import 'package:app_libros/models/libro.dart';
import 'package:app_libros/widgets/textoprincipal.widget.dart';
import 'package:app_libros/widgets/textsecundario.widget.dart';
import 'package:app_libros/widgets/textparrafo.widget.dart';

class DetallesScreen extends StatelessWidget {
  final Datum libro;

  const DetallesScreen({Key? key, required this.libro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: tema.secondary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          libro.title,
          style: TextStyle(color: tema.secondary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextPrincipal(
              texto: libro.title,
              colorTexto: tema.primary,
            ),
            const SizedBox(height: 16),
            TextSecundario(
              texto: 'Autor: ${libro.handle}',
              colorTexto: tema.secondary,
            ),
            const SizedBox(height: 8),
            TextParrafo(
              texto: 'Publisher: ${libro.publisher}',
            ),
            const SizedBox(height: 8),
            TextParrafo(
              texto: 'Años: ${libro.year}',
            ),
            const SizedBox(height: 8),
            TextParrafo(
              texto: 'ISBN: ${libro.isbn}',
            ),
            const SizedBox(height: 8),
            TextParrafo(
              texto: 'Paginas: ${libro.pages}',
            ),
           
            const SizedBox(height: 16),
            TextSecundario(
              texto: 'Notas',
              colorTexto: tema.primary,
            ),
            const SizedBox(height: 8),
            for (var note in libro.notes)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextParrafo(texto: note),
              ),
            const SizedBox(height: 16),
            TextSecundario(
              texto: 'Villanos',
              colorTexto: tema.primary,
            ),
            const SizedBox(height: 8),
            for (var villain in libro.villains)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextParrafo(texto: villain.name),
              ),
          ],
        ),
      ),
    );
  }
}
