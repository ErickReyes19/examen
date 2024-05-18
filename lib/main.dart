import 'package:app_libros/providers/libros.provider.dart';
import 'package:app_libros/screens/detalles.screen.dart';
import 'package:app_libros/screens/libros.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/libro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LibroProvider()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Color(0xffF2F2F2)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(primary: const Color(0xff312E5C))),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 5, 26, 160),
              onPrimary: Color.fromARGB(255, 255, 255, 255),
              secondary: Color.fromARGB(255, 0, 0, 0),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              background: Color.fromARGB(255, 243, 243, 243),
              onBackground: Color.fromARGB(255, 0, 0, 0),
              surface: Color.fromARGB(255, 255, 255, 255),
              onSurface: Color.fromRGBO(255, 13, 0, 44),
              onSurfaceVariant: Color.fromARGB(255, 102, 102, 102)),
        ),
        routerConfig: _router,
      ),
    );
  }
}

Color parseColor(String colorString) {
  final colorComponents = colorString.split(',');
  final red = int.parse(colorComponents[0]);
  final green = int.parse(colorComponents[1]);
  final blue = int.parse(colorComponents[2]);
  final opacity = double.parse(colorComponents[3]);
  return Color.fromRGBO(red, green, blue, opacity);
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LibrosVisorScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          
          path: 'detalles',
          builder: (BuildContext context, GoRouterState state) {
             final libro = state.extra as Datum;
            return  DetallesScreen(libro: libro);
          },
        ),
      ],
    ),
  ],
);
