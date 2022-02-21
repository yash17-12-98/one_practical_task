import 'package:one_practical_task/models/result.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {

	static DatabaseHelper? _databaseHelper;
	static Database? _database;

	String resTable = 'result_table';
	String colId = 'id';
	String colName = 'name';
	String colIcon = 'icon';
	String colLat = 'lat';
	String colLng = 'lng';
	String colVicinity = 'vicinity';


	DatabaseHelper._createInstance();

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance();
		}
		return _databaseHelper!;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database!;
	}

	Future<Database> initializeDatabase() async {

		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'results.db';

		var resultsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return resultsDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $resTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
				'$colIcon TEXT, $colLat TEXT, $colLng TEXT, $colVicinity TEXT)');
	}


	Future<List<Map<String, dynamic>>> getResMapList() async {
		Database db = await this.database;
		var result = await db.query(resTable);
		return result;
	}


	Future<int> insertResult(Results res) async {
		print("resbdfv "+res.lat.toString());
		Database db = await this.database;
		var result = await db.insert(resTable, res.toMap());
		return result;
	}

	Future<int> updateResult(Results res) async {
		var db = await this.database;
		var result = await db.update(resTable, res.toMap(), where: '$colId = ?', whereArgs: [res.id]);
		return result;
	}


	Future<int> deleteResult(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $resTable WHERE $colId = $id');
		return result;
	}


	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $resTable');
		int result = Sqflite.firstIntValue(x)!;
		return result;
	}


	Future<List<Results>> getResList() async {

		var resMapList = await getResMapList();
		int count = resMapList.length;

		List<Results> resList = <Results>[];

		for (int i = 0; i < count; i++) {
			print(resMapList[i].toString());
			resList.add(Results.fromMapObject(resMapList[i]));
		}

		return resList;
	}

}







