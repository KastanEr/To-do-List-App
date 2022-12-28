import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
              title:Text('ListView Study')
          ),
          body:ListView(
            padding:const EdgeInsets.all(8),
            children: [
              Container(
                  height: 50,
                  color: Colors.amber[600],
                  child:const Center(
                      child:Text('11111')
                  )
              ),
              Container(
                  height: 50,
                  color: Colors.amber[500],
                  child:const Center(
                      child:Text('22222')
                  )
              ),
              Container(
                  height: 50,
                  color: Colors.amber[400],
                  child:const Center(
                      child:Text('33333')
                  )
              )

            ],
          ),
          bottomNavigationBar: BottomAppBar(
              child:Container(
                height: 50,
                color:Colors.black,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,

                  children: [
                    Icon(Icons.chevron_left,color:Colors.white),
                    Icon(Icons.circle_rounded,color:Colors.white),
                    Icon(Icons.account_circle,color:Colors.white),

                  ],
                ),
              )
          ),
        )
    );
  }
}