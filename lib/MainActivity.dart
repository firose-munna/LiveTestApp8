import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  List<Contact> contactList = [
    Contact('Firose Munna', 'munnafirose@gmail.com', '01956431180'),
    Contact('Arafat Hossan', 'aftarafat@gmail.com', '01756431180'),
    Contact('Mehedi Hasan', 'mehedihasan@gmail.com', '01856431170'),
    Contact('Sanjana Sami', 'sanjana@gmail.com', '01556431170'),
    Contact('Defen Shikdar', 'defen@gmail.com', '01554884698'),
    Contact('Mehedi Hasan', 'mehedihasan@gmail.com', '01856431170'),
  ];

  final GlobalKey<FormState> formInput = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffolState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key:scaffolState,
      appBar: AppBar(

        title: Text("Contact List"),
        centerTitle: true,
        elevation: 6,
      ),
      body: Center(
        child: ListView.separated(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                title: Text(contactList[index].name),

              ),

              onTap: (){
                showButtonSheet(contactList[index]);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
            );
          },
        ),
      ),
    );
  }


  void showButtonSheet(Contact contactList) {
    scaffolState.currentState!.showBottomSheet(
          (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text('Name: ${contactList.name}'),
              Text('Email: ${contactList.email}', softWrap: true),
              Text('Phone Number: ${contactList.phoneNumber}'),

            ],
          ),
        );
      },
    );
  }
}

class Contact{
  String name, email, phoneNumber;

  Contact(this.name, this.email, this.phoneNumber);
}
