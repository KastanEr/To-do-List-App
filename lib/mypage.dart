import 'package:flutter/material.dart';
import 'package:todolist/account.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  mypageListView();
  }
}

class mypageListView extends StatefulWidget {
  @override
  State<mypageListView> createState() => _mypageListViewState();
}

class _mypageListViewState extends State<mypageListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     var pop = Navigator.pop(
        //         context, MaterialPageRoute(builder: (context) => MenuPage()),
        //     );
        //   },
        //   icon: const Icon(Icons.arrow_back_ios),
        // ),
        title: const Text('My Page'),
      ),
      body: SafeArea(
        child: ListView(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Upgrade'),
                  onTap: () {
                    var push = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyPage()),
                    );
                  }
              ),

              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('계정'),
                  onTap: () {
                    var push = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountPage()),
                    );
                  }
              ),

              const Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              const ListTile(
                leading: Icon(Icons.groups_sharp),
                title: Text('커뮤니티'),
              ),
            ]),
      ),
    );
  }
}
