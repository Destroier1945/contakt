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
      leading: Image.network("https://randomuser.me/api/portraits/men/42.jpg"),
      trailing: Icon(Icons.call_missed_outgoing),
      title: Text("Nome"),
      subtitle: Text("telefone"),
    );
  }
}
