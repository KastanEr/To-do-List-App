import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home.dart';


class Today extends StatelessWidget {
  const Today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const todayListView();
  }
}

class todayListView extends StatefulWidget {
  const todayListView({super.key});

  @override
  State<todayListView> createState() => _todayListViewState();

}

class addTodo extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
}


class _todayListViewState extends State<todayListView> {
  List<bool> ischecked = [];
  List<bool> isStarCheck = [];

  List<String> tasks = ['개인과제','프로젝트','플러터','개인과제','프로젝트','플러터'];

  ListGroupController controller = ListGroupController();

  @override
  Widget build(BuildContext context) {

    String getToday() {
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('yyyy / MM / dd');
      var strToday = formatter.format(now);
      return strToday;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),)
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),


      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(getToday(),
                      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 120,),
                  IconButton(
                    onPressed: () => const Text('addtodo()'),
                    icon: const Icon(Icons.add, size: 30,),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(15.0)
                        ),
                      ),
                      child: Column(//////or  Row?
                          children:[
                            const SizedBox(
                              height: 10,),
                            const Text("Today",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                            Container(
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.all(16.0),
                              height: 200,
                              //child: MyStatefulWidget(),
                            )
                          ]
                      ),),
                  ]
              ),


            ]
        ),
      ),
    );
  }
}


