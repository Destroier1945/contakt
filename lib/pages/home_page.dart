import 'package:contakt/model/contact_model.dart';
import 'package:contakt/pages/contact_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List<Contact>? contacts;
  HomePage({super.key, this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Kontakte"), centerTitle: true),
      body: ListView.builder(
          itemCount: contacts?.length,
          itemBuilder: (context, index) {
            Contact contact = contacts![index];
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
                            ))),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ContactDetail(selectedContact: Contact("", "", "", ""))));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
