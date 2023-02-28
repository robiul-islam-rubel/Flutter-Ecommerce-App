

import 'dart:convert';
import 'dart:io';

import 'package:fairshop/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();
    return _database;
  }

  // Create the database and the Employee table
  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'cart.db');

    return await openDatabase(path, version: 1, onOpen: (db) {


    },
        onCreate: (Database db, int version) async {

          await db.execute('CREATE TABLE Cart('
              'id INTEGER PRIMARY KEY,'
              'name TEXT,'
              'quantity TEXT,'
              'price TEXT,'
              'image TEXT'

              ')');


          Future<Cart>insert(Cart cart) async
          {
            var dbClient=await db;
            await dbClient.insert('cart',cart.toMap());
            return cart;
          }






        }
    );


  }












}
   