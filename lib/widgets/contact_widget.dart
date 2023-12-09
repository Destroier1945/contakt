import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      trailing: Icon(Icons.contact_page),
      title: Text("Nome"),
      subtitle: Text("telefone"),
    );
  }
}
