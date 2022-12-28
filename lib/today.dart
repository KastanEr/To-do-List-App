import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return todayListView();
  }
}

class todayListView extends StatefulWidget {
  @override
  State<todayListView> createState() => _todayListViewState();
}

class _todayListViewState extends State<todayListView> {
  bool _ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: SafeArea(
        child: CheckboxListTile(
          value: _ischecked,
          title: Text(''),
          subtitle: Text(''),
          onChanged: (bool? value) {
            setState(() {
              _ischecked = value!;
            });
          },
          activeColor: Colors.black,
          checkColor: Colors.white,
          isThreeLine: false,
          selected: _ischecked,
        ),
        // child: ListView(
        // children: <Widget>[
        //   ListTile(
        //     title: Text(''),
        //     subtitle: Text(''),
        //     trailing: IconButton(onPressed: Icon(Icons.star), icon: Icon(Icons.star_border)),
        //   ),
        //   Divider(
        //     height: 10,
        //     thickness: 1,
        //     indent: 10,
        //     endIndent: 10,
        //   ),
        //   ListTile(
        //     leading: Icon(Icons.groups_sharp),
        //     title: Text('커뮤니티'),
        //   ),
        // ]),
      ),
    );
  }
}
