import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Detail"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.contact_page,
                  size: 128,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Phone'),
              ),
            ],
          ),
        ));
  }
}
