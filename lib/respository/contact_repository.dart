import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactRepository extends ChangeNotifier {
  //final String apiUrl = 'https://randomuser.me/api/?results=20';

  late FirebaseFirestore db;

  //Future<List<Contact>> fecthContact() async {
  //  final response = await http.get(Uri.parse(apiUrl));
//
  //  if (response.statusCode == 200) {
  //    final Map<String, dynamic> data = json.decode(response.body);
  //    final List<dynamic> results = data['results'];
//
  //    List<Contact> contacts = results.map((contactData) {
  //      final String title = contactData['name']['title'];
  //      final String firstName = contactData['name']['first'];
  //      final String lastName = contactData['name']['last'];
  //      final String emailUrl = contactData['email'];
  //      final String phoneNumber = contactData['phone'];
//
  //      final Map<String, dynamic> pictureData = contactData['picture'];
  //      final String thumbnailUrl = pictureData['thumbnail'];
//
  //      return Contact(
  //          '$title $firstName $lastName', emailUrl, phoneNumber, thumbnailUrl);
  //    }).toList();
//
  //    return contacts;
  //  } else {
  //    throw Exception('Failed to load contacts');
  //  }
  //}

  ContactRepository({required this.db});
}
