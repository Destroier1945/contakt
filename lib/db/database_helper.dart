import 'package:contakt/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper();
  factory DataBaseHelper() => _instance;

  final CollectionReference contactCollection =
      FirebaseFirestore.instance.collection('contact');

  Future<void> saveContactFromFirebase() async {
    try {
      QuerySnapshot<Object?> querySnapshot = await contactCollection.get();

      List<Contact> contactsFromFirebase = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Contact(
            data['name'], data['email'], data['phoneNumber'], data['avatar']);
      }).toList();
      for (Contact contact in contactsFromFirebase) {
        await saveContact(contact);
      }
    } catch (e) {
      print(e);
    }
  }

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db!;
  }

  DataBaseHelper.internal();

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = '${databasePath}contact.db';

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE contact (
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            phoneNumber TEXT,
            avatar TEXT
          )
          ''');
    });
  }

  Future<int> saveContact(Contact contact) async {
    var dbClient = await db;
    return await dbClient!.insert('contact', contact.toMap());
  }

  Future<int> deleteContact(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('contact', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> upDateContact(int id, Contact contact) async {
    var dbClient = await db;
    return await dbClient!.update(
        'contact',
        {
          'name': contact.name,
          'email': contact.email,
          'phoneNumber': contact.phoneNumber,
          'avatar': contact.avatar,
          'id': id
        },
        where: 'id = ?',
        whereArgs: [id]);
  }

  Future<Contact?> getContact(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result =
        await dbClient!.query('contact', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Contact.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<List<Future<Contact?>>> getAllContacts() async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient!.query('contact');
    return result.map((e) => Contact.fromMap(e)).toList();
  }
}
