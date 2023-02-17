import 'package:flutter/material.dart';

class Profile_pic extends StatelessWidget {
  const Profile_pic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Stack(fit: StackFit.expand, children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/user.png",
              ),
            ),
            Positioned(
              right: -10,
              bottom: 0,
              child: GestureDetector(
                //excludeFromSemantics: false,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(172, 220, 220, 220),
                  ),
                  margin: EdgeInsets.all(10),
                  height: 44,
                  width: 44,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: Color(0xff0F111D),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            )
          ]),
        ),
      ],
    );
  }
}
