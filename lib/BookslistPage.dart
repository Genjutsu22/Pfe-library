import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/Customnavbar.dart';
import 'package:myapp/Getdata.dart';
import 'package:http/http.dart' as http;

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

class BookslistPage extends StatefulWidget {
  const BookslistPage({super.key});

  @override
  State<BookslistPage> createState() => _BookslistPageState();
}

class _BookslistPageState extends State<BookslistPage> {
  @override
  Widget build(BuildContext context) {
    dynamic cat = ModalRoute.of(context)!.settings.arguments;
    List aa = cat.ll;
    print(
        "============================================================================");
    print(aa);
    print(
        "============================================================================");

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xff0F111D),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                SizedBox(height: 30),
                Text(
                  "Category name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: Customnavbar(),
      body: SafeArea(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 290,
            mainAxisSpacing: 20,
            crossAxisSpacing: 6,
          ),
          itemCount: aa.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'bookpage',
                    arguments: BookArguments(
                        "${aa[index]["nom_livre"]}",
                        "${aa[index]["image_livre"]}",
                        "${aa[index]["cat_nom"]}",
                        "${aa[index]["nom_auteur"]} ${aa[index]["prenom_auteur"]}",
                        int.parse("${aa[index]["num_page"]}"),
                        "${aa[index]["description"]}"));
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
                      child: Image.network(
                        "${aa[index]["image_livre"]}",
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
                            "${aa[index]["nom_livre"]}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${aa[index]["nom_auteur"]} ${aa[index]["prenom_auteur"]}",
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
            );
          },
        ),
      ),
    );
    /* body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 30),
                  Text(
                    "Category Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GridView.count(
              crossAxisCount: 2,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
       bottomNavigationBar: Customnavbar(), */
  }
}
