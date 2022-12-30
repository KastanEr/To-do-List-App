import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> _notifications = [    'Notification 1',    'Notification 2',    'Notification 3',    'Notification 4',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Dismissible(
            key: Key(notification),
            onDismissed: (direction) {
              setState(() {
                _notifications.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1257704447105064960/m_ZRnYgO_400x400.jpg',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(notification),
              ],
            ),
          );
        },
      ),
    );
  }
}