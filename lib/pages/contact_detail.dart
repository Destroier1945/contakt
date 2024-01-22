import 'package:contakt/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  final Contact? selectedContact;

  const ContactDetail({super.key, this.selectedContact});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.selectedContact?.name ?? "";
    _emailController.text = widget.selectedContact?.email ?? "";
    _phoneController.text = widget.selectedContact?.phoneNumber ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Detail"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (widget.selectedContact == null ||
                  widget.selectedContact!.avatar.isEmpty)
                const Icon(
                  Icons.person,
                  size: 68,
                )
              else
                Center(
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage(widget.selectedContact!.avatar)),
                ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Phone'),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              ),
            ],
          ),
        ));
  }
}
