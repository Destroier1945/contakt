import 'dart:async';

import 'package:contakt/model/contact_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactRepository {
  final String apiUrl = 'https://randomuser.me/api/?results=10';

  Future<Contact> fecthContact() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> contactData = data['results'][0];

      final String title = contactData['name']['title'];
      final String firstName = contactData['name']['first'];
      final String lastName = contactData['name']['last'];
      final String emailUrl = contactData['email'];
      final String phoneNumber = contactData['phone'];
      final String cellNumber = contactData['cell'];

      final Map<String, dynamic> pictureData = contactData['picture'];
      final String largePictureUrl = pictureData['large'];
      final String mediumPictureurl = pictureData['medium'];
      final String thumbanilPicureUrl = pictureData['thumbnail'];

      return Contact('$title $firstName $lastName', emailUrl, phoneNumber,
          thumbanilPicureUrl);
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}
