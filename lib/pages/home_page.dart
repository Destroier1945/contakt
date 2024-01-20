import 'package:contakt/model/contact_model.dart';
import 'package:contakt/pages/contact_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Contact> contacts;
  const HomePage({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Kontakte"), centerTitle: true),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            Contact contact = contacts[index];
            return Card(
              child: GestureDetector(
                child: ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.avatar),
                  ),
                  trailing: const Icon(Icons.navigate_next),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactDetail(
                              selectedContact: contact,
                              contact: contact,
                            ))),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          _showCreateContact(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showCreateContact(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'New Kontakt',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Phone', border: OutlineInputBorder()),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
