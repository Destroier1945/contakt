import 'package:contakt/model/contact_model.dart';
import 'package:contakt/model/contact_repository.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  late Future<Contact> _contactFuture;

  @override
  void initState() {
    super.initState();
    _contactFuture = ContactRepository().fecthContact();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _contactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar o contato ${snapshot.error}');
          } else {
            final contact = snapshot.data;

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(contact!.avatar),
              ),
              trailing: const Icon(Icons.call_missed_outgoing),
              title: Text(contact.name),
              subtitle: Text(contact.phoneNumber),
            );
          }
        });
  }
}
