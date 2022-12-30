import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todolist/selecphoto.dart';


class Profile extends StatefulWidget {
  Profile({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  static const id = 'set_photo_screen';

  @override
  _ProfileState createState() => _ProfileState();
}

class ProfileImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _ProfileState extends State<Profile> {
  final nameController = TextEditingController();
  final positionCotroller = TextEditingController();
  Image _image = Image.asset('3D_avatar/user.png');
  final ImagePicker _picker = ImagePicker();


  Future _getImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = Image.file(
        File(pickedImage.path),
        width: 200.0,
        height: 200.0,
        fit: BoxFit.fill,
      );
      setState(() {});
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
                 onTap: (source) async {
                   await _getImage();
                   Navigator.pop(context);
                   // setState(() {});
                 },
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

  late File _pickedImage = File('3D_avatar/user.png');

  void _pickImage() async {
    var imagePicker = ImagePicker();
    var pickedImageFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile as File;
    });
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
                // child: CircleAvatar(
                //   radius: 80.0,
                //   //backgroundImage: FileImage(_pickedImage),
                //   backgroundColor: Colors.grey,
                //   backgroundImage: _image,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 50, right: 50, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: _image,
                    ),
                ),
                TextButton.icon(
                    onPressed: () {
                      _showSelectPhotoOptions(context);
                    },
                    label: Text('이미지 변경'),
                    icon: Icon(Icons.edit, color: Colors.grey,size: 20,),

                ),
                Padding(padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    buildName(),
                    buildPosition(),
                  ],
                ),),
                TextButton(onPressed: () => print('프로필 업데이트'),
                    child: Text(
                      "프로필 수정",
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
                          fontSize: 16,
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
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<PickedFile>('_image', _image));
  // }
}

  InputDecoration decoration(String label) =>
      InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );

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







