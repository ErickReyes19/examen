// To parse this JSON data, do
//
//     final libros = librosFromJson(jsonString);

import 'dart:convert';

import 'package:app_libros/models/villanos.dart';

Libros librosFromJson(String str) => Libros.fromJson(json.decode(str));

String librosToJson(Libros data) => json.encode(data.toJson());

class Libros {
    List<Datum> data;

    Libros({
        required this.data,
    });

    factory Libros.fromJson(Map<String, dynamic> json) => Libros(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int year;
    String title;
    String handle;
    String publisher;
    String isbn;
    int pages;
    List<String> notes;
    DateTime createdAt;
    List<Villain> villains;

    Datum({
        required this.id,
        required this.year,
        required this.title,
        required this.handle,
        required this.publisher,
        required this.isbn,
        required this.pages,
        required this.notes,
        required this.createdAt,
        required this.villains,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        year: json["Year"],
        title: json["Title"],
        handle: json["handle"],
        publisher: json["Publisher"],
        isbn: json["ISBN"],
        pages: json["Pages"],
        notes: List<String>.from(json["Notes"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        villains: List<Villain>.from(json["villains"].map((x) => Villain.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Year": year,
        "Title": title,
        "handle": handle,
        "Publisher": publisher,
        "ISBN": isbn,
        "Pages": pages,
        "Notes": List<dynamic>.from(notes.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "villains": List<dynamic>.from(villains.map((x) => x.toJson())),
    };
}

class Villain {
    String name;
    String url;

    Villain({
        required this.name,
        required this.url,
    });

    factory Villain.fromJson(Map<String, dynamic> json) => Villain(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}


