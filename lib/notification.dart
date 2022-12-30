// import 'package:flutter/material.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   final List<String> _notifications = [  '12:00 - 발표 자료 만들기',    '리마인드 - 소감문 작성하기',    '리마인드 - 알림 기능 데이터베이스 연동하기',    '리마인드 - 다음 버전 로드맵 만들기',  ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: ListView.builder(
//         itemCount: _notifications.length,
//         itemBuilder: (context, index) {
//           final notification = _notifications[index];
//           return Dismissible(
//             key: Key(notification),
//             onDismissed: (direction) {
//               setState(() {
//                 _notifications.removeAt(index);
//               });
//             },
//             background: Container(
//               color: Colors.red,
//               child: Icon(
//                 Icons.delete,
//                 color: Colors.white,
//               ),
//               alignment: Alignment.centerRight,
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 10, top: 10, right:10),
//                   child: Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('lib/asset/catcat_for_image.png'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     child: Text(notification),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }