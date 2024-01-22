class Contact {
  String name;
  String email;
  String phoneNumber;
  String avatar;

  Contact(this.name, this.email, this.phoneNumber, this.avatar);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
    };
  }

  static Future<Contact?> fromMap(Map<String, dynamic> first) {
    return Future.value(Contact(
        first['name'], first['email'], first['phoneNumber'], first['avatar']));
  }
}
