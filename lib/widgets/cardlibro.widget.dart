import 'package:app_libros/models/libro.dart';
import 'package:app_libros/widgets/textoprincipal.widget.dart';
import 'package:app_libros/widgets/textparrafo.widget.dart';
import 'package:app_libros/widgets/textsecundario.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardLibro extends StatefulWidget {
  const CardLibro({Key? key, required this.libro}) : super(key: key);

  final Datum libro;

  @override
  State<CardLibro> createState() => _CardLibroState();
}

class _CardLibroState extends State<CardLibro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        context.go('/detalles', extra: widget.libro);
      },
      child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 10),
          margin:
              EdgeInsets.symmetric(vertical: 5, horizontal: size.width * 0.03),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(3),
              ),
              color: tema.surface),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextPrincipal(
                        texto: widget.libro.title,
                        colorTexto: tema.secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            
            
            const SizedBox(
              height: 10,
            ),
          ])),
    );
  }
}
