import 'package:contakt/model/contact_model.dart';
import 'package:contakt/pages/home_page.dart';
import 'package:contakt/respository/contact_repository.dart';
import 'package:flutter/material.dart';

class SplasshScreen extends StatefulWidget {
  const SplasshScreen({super.key});
  @override
  State<SplasshScreen> createState() => _SplasshScreenState();
}

class _SplasshScreenState extends State<SplasshScreen> {
  final ContactRepository contactRepository = ContactRepository();

  @override
  void initState() {
    super.initState();
    _loadAndNavigate();
  }

  _loadAndNavigate() async {
    List<Contact> contacts = await contactRepository.fecthContact();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (localContext) => HomePage(
                  contacts: contacts,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Carregando dados...")
        ],
      )),
    );
  }
}
