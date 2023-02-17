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
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                signout();
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: Stack(fit: StackFit.expand, children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/user.png",
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    width: 46,
                    child: GestureDetector(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Color(0xff0F111D),
                      ),
                      onTap: () {},
                    ),
                  )
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 5,
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
            height: 4,
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
            height: 4,
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
        ],
      ),
      //   bottomNavigationBar: Customnavbar(),
    );
  }
}

void signout() {
  FirebaseAuth.instance.signOut();
}
