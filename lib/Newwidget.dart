import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/BookPage.dart';
import 'package:myapp/fun/book.dart';

List<String> booktitle = [
  "Eloquent JavaScript",
  "Java for beginners guide",
  "C++ for beginners",
  "Computing programming",
  "Beginning SQL Queries",
  "Modeling with UML",
  "Cyber security",
  "Better Algebra for all"
];

class Newwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Books",
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
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              for (int j = 8; j >= 1; j--)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'bookpage',
                        arguments: ScreenArguments(
                          booktitle[j - 1],
                          "assets/images/bk$j.jpg",
                          "Categorie",
                          "Auteur",
                          "12",
                          "Description Description Description Description Description Description Description Description Description Description Description Description Description Description",
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 190,
                    height: 295,
                    decoration: BoxDecoration(
                        color: Color(0xff292B37),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff292B37).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 6,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/images/bk$j.jpg",
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booktitle[j - 1],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "9.5",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
