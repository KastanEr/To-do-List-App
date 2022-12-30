import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhoto extends StatelessWidget {
  final String textLabel;
  final IconData icon;

  final void Function()? onTap;


  SelectPhoto({
    Key? key,
    required this.textLabel,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.grey.shade200,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              textLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectPhotoOptionsScreen extends StatelessWidget {
  final Function(ImageSource source) onTap;
  //final ImagePicker _picker = ImagePicker();
  //late PickedFile _image;

  SelectPhotoOptionsScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -25,
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            Column(
                children: [
                  SelectPhoto(
                    onTap: () {},
                    icon: Icons.account_circle,
                    textLabel: '기본 이미지',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectPhoto(
                    onTap: () => onTap(ImageSource.gallery),
                    icon: Icons.image_search,
                    textLabel: '갤러리',
                  ),

          ]
      ),
      ]
    ),
    );
  }
}


              /*const SizedBox(
                height: 10,
              ),
              SelectPhoto(
                onTap: () => onTap(ImageSource.gallery),
                icon: Icons.image_search,
                textLabel: '갤러리',
              ),
              const SizedBox(
                height: 10,
              ),
              SelectPhoto(
                onTap: () => onTap(ImageSource.camera),
                icon: Icons.camera_alt_outlined,
                textLabel: '카메라',
              ),*/

