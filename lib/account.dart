import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'flutter/src/material/text_field.dart';
import 'model/user.dart';



// class AccountPage extends StatelessWidget {
//   static final String title = '';
//
//   const AccountPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AccountPage();
//   }
// }

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerPosition = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(

          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const MenuPage()),
              //   );
            },
          ),

          title: const Text('계정'),

          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                semanticLabel: 'Home',
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),

          children: <Widget>[
            const ListTile(
              title: Text('Name'),
              trailing: TextField(
                controller: controllerName,
              ),
            ),

            const ListTile(
              title: Text('Email'),
              trailing: TextField(
                enabled: true,
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: controllerAge,
              decoration: decoration('Age'),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),
            TextField(
              controller: controllerPosition,
              decoration: decoration('Position'),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: controllerPosition,
              decoration: decoration('Position'),
            ),

            // const SizedBox(
            // DateTimeField(
            //   decoration: decoration('Date'),
            //   format: DateFormat('yyyy-MM-dd'),
            //   onShowPicker: (context, currentValue) =>
            //     context: context,
            //     firstDate: DateTime(),
            //     lastDate: DateTime(),
            //     initialDate: currentValue ?? DateTime.null,
            // ),

            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('변경하기'),
              onPressed: () {
                final user = User(
                  name: controllerName.text,
                  age: int.parse(controllerAge.text),
                  position: controllerPosition.text,
                );
                createUser(user);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );

  InputDecoration decoration(String label) =>
      InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

  Future createUser(User user) async {
    // Reference to document
    final docUser = FirebaseFirestore.instance.collection('accounts').doc();
    user._uid = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

  // User ({
  //   this.id = '',
  //   required this.name,
  //   required this.age,
  //   required this.position,
  // });
  //
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  //   'age': age,
  //   'position': position,
  // };
}







