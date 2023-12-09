import 'package:contakt/pages/contact_detail.dart';
import 'package:contakt/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Contakt"),
        ),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactDetail()));
          },
          child: ContactWidget(),
        );
      }),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
