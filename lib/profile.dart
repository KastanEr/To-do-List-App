import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todolist/selecphoto.dart';
import 'model/user.dart';


class Profile extends StatefulWidget {
  Profile({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  static const id = 'set_photo_screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final nameController = TextEditingController();
  final positionCotroller = TextEditingController();
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    }
    on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    //getUser();
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  /*getUser() async {
    User user = FirebaseAuth.instance.currentUser;
    final userid = user.uid;
    DocumentSnapshot doc = await userid.get();
    nameController.text = userid.name;
    positionCotroller.text = userid.position;
  }*/
  /*getUser() async {

    DocumentSnapshot doc = await user.document(widget.currentUserId).get();
    User user = User.fromDocument(doc);
    nameController.text = user.name;
    positionCotroller.text = user.position;
  }*/

  Column buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top:12),
          child: Text("Name",
          style: TextStyle(color: Colors.grey),
          ),
        ),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
              hintText: "Update Name"),
        ),
      ],
    );
  }

  Column buildPosition() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top:12),
          child: Text("Position",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextField(
          controller: positionCotroller,
          decoration: const InputDecoration(
              hintText: "Update Position"),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: const Text(
          "계정",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: CircleAvatar(
                    radius: 80.0,
                    //backgroundImage: FileImage(_image!),
                    //backgroundImage: _image!= null ? FileImage(_image!) : null,
                  ),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      _showSelectPhotoOptions(context);
                    },
                    child: const Icon(Icons.edit)
                ),
                Padding(padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    buildName(),
                    buildPosition(),
                  ],
                ),),
                TextButton(onPressed: () => print('프로필 업데이트'),
                    child: Text(
                      "변경하기",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton.icon(
                      onPressed: () => print('로그아웃'),
                      icon: const Icon(Icons.login_outlined),
                      label: const Text(
                        "로그아웃",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  // on PlatformExeption catch (e) {
  //   print(e);
  //   Navigator.of(context).pop();}


  InputDecoration decoration(String label) =>
      InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );



    // final json = user.toJson();
    // await docUser.set(json);


// User (
//   this.id,
//   this.name,
//   this.age,
//   this.position,
// );
//
// Map<String, dynamic> toJson() => {
//   'id': id,
//   'name': name,
//   'age': age,
//   'position': position,
// };







