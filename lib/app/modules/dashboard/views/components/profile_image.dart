import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CircleAvatar(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 1,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
          ),
          radius: size.width / 7.5,
          backgroundImage: const AssetImage(
            "assets/Images/profile.jpg",
          ),
        ),
        Positioned(
          bottom: 3,
          right: 5,
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: size.width / 28,
              //  backgroundColor: kHighlightColor,
              child: Icon(
                Icons.camera_enhance_outlined,
                color: Colors.white,
                size: size.width / 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
