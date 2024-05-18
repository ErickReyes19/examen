// To parse this JSON data, do
//
//     final villano = villanoFromJson(jsonString);

import 'dart:convert';

Villano villanoFromJson(String str) => Villano.fromJson(json.decode(str));

String villanoToJson(Villano data) => json.encode(data.toJson());

class Villano {
    Data data;

    Villano({
        required this.data,
    });

    factory Villano.fromJson(Map<String, dynamic> json) => Villano(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String name;
    String gender;
    String status;
    int typesId;
    List<String> notes;
    DateTime createdAt;
    List<Book> books;
    List<dynamic> shorts;

    Data({
        required this.id,
        required this.name,
        required this.gender,
        required this.status,
        required this.typesId,
        required this.notes,
        required this.createdAt,
        required this.books,
        required this.shorts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        status: json["status"],
        typesId: json["types_id"],
        notes: List<String>.from(json["notes"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
        shorts: List<dynamic>.from(json["shorts"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "status": status,
        "types_id": typesId,
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
        "shorts": List<dynamic>.from(shorts.map((x) => x)),
    };
}

class Book {
    String title;
    String url;

    Book({
        required this.title,
        required this.url,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
    };
}
