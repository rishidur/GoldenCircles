import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Request {
  String name, email, phone, travelDate, fromAirport, toAirport, flightNumberFirstLeg, layover, flightNumberSecondLeg, airline, assistanceReason, comments;

  Request({required this.name, required this.email, required this.phone, required this.travelDate, required this.fromAirport, required this.toAirport, required this.flightNumberFirstLeg, required this.layover, required this.flightNumberSecondLeg, required this.airline, required this.assistanceReason, required this.comments});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'travelDate': travelDate,
      'fromAirport': fromAirport,
      'toAirport': toAirport,
      'flightNumberFirstLeg': flightNumberFirstLeg,
      'layover': layover,
      'flightNumberSecondLeg': flightNumberSecondLeg,
      'airline': airline,
      'assistanceReason': assistanceReason,
      'comments': comments,
    };
  }
}

class DatabaseHelper {
  static Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'requests.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE requests(name TEXT, email TEXT, phone TEXT, travelDate TEXT, fromAirport TEXT, toAirport TEXT, flightNumberFirstLeg TEXT, layover TEXT, flightNumberSecondLeg TEXT, airline TEXT, assistanceReason TEXT, comments TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertRequest(Request request) async {
    final db = await DatabaseHelper.getDatabase();
    await db.insert(
      'requests',
      request.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Request>> getRequests() async {
    final db = await DatabaseHelper.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('requests');
    return List.generate(maps.length, (i) {
      return Request(
        name: maps[i]['name'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        travelDate: maps[i]['travelDate'],
        fromAirport: maps[i]['fromAirport'],
        toAirport: maps[i]['toAirport'],
        flightNumberFirstLeg: maps[i]['flightNumberFirstLeg'],
        layover: maps[i]['layover'],
        flightNumberSecondLeg: maps[i]['flightNumberSecondLeg'],
        airline: maps[i]['airline'],
        assistanceReason: maps[i]['assistanceReason'],
        comments: maps[i]['comments'],
      );
    });
  }
}
