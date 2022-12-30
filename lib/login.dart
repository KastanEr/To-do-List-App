import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/firebasecontroller.dart';
import 'package:todolist/home.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/model/todoproject.dart';
import 'package:todolist/model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot> (
        stream: FirebaseController.userSnapshots,
        builder: (context, AsyncSnapshot snapshot) => SafeArea(
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  FirebaseController.addUser(User(name: '김윤섭', email: 'test123@naver.com', password: '1234'));
                },
                child: const Text('Regist'),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseController.userCollection.doc('6mBEJtk9XrDJ1xF5ETcr').snapshots().listen(
                    (event) => LoginedUser.loginedUser = User.fromJson(event.data()),
                    onError: (error) => print("$error"),
                  );
                  await FirebaseController.projectCollection.snapshots().listen((event) {
                    for (var doc in event.docs) {
                      LoginedUser.projects[doc.data()['pid']] = TodoProject.fromJson(doc.data());
                    }
                  });
                  await FirebaseController.todoCollection.snapshots().listen((event) {
                    for (var doc in event.docs) {
                      LoginedUser.todos[doc.data()['tid']] = Todo.fromJson(doc.data());
                    }
                  });
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:todolist/menu.dart';

// import 'home.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log in'),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         leading: IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: (){}
//         ),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.search),
//               onPressed: (){}
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(padding: (EdgeInsets.only(top: 50)),
//             ),
//             Center(

//             ),
//             Form(child: Theme(
//               data: ThemeData(
//                 primaryColor: Colors.teal,
//                 inputDecorationTheme: InputDecorationTheme(
//                     labelStyle: TextStyle(
//                         color: Colors.teal,
//                         fontSize: 15.0
//                     )
//                 ),
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(40.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Enter "ID"'
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Enter "Password"'
//                       ),
//                       keyboardType: TextInputType.text,
//                       obscureText: true,
//                     ),
//                     SizedBox(
//                       height: 40.0,
//                     ),
//                     ButtonTheme(
//                         minWidth: 100.0 ,
//                         height: 50.0,
//                         child: ElevatedButton(
//                             child: Icon(
//                               Icons.arrow_forward,
//                               color: Colors.white,
//                               size: 35.0,
//                             ),
//                             onPressed: (){
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const HomePage()),
//                               );
//                             })
//                     )
//                   ],
//                 ),
//               ),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



