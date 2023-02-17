import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Customnavbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff0F111D),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.rowing,
                  color: Colors.transparent,
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/user22.png",
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
                              color: Color.fromARGB(119, 255, 255, 255),
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
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "${user.uid}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "${user.email}",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Filiere",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "Changer mot de passe",
              icon: Icons.password_rounded,
              press: (() {}),
            ),
            SizedBox(
              height: 9,
            ),
            ProfileMenu(
              text: "Favoris",
              icon: Icons.favorite,
              press: (() {}),
            ),
          ],
        ),
      ),
      //   bottomNavigationBar: Customnavbar(),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Material(
          color: Color(0xff292B37),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: 25,
                    color: Colors.white54,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white54,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Colors.white54,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
