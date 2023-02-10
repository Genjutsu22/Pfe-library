import 'package:flutter/material.dart';

class Popularwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Popular Books",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
              ),
            ),
          ]),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i < 9; i++)
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/bk$i.jpg",
                        height: 180,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: (() {
                    Navigator.pushNamed(context, 'bookpage');
                  }),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
