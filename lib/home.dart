import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
        ),

        title: const Text('To-Do'),
        
        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              semanticLabel: 'notifications',
            ),
            onPressed: () {
              print('Notification Button');
            },
          ),
        ],
      ),


    );
  }
}