import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/BookPage.dart';
import 'package:myapp/Getdata.dart';
import 'package:http/http.dart' as http;


class Newwidget extends StatefulWidget {
  @override
  State<Newwidget> createState() => _NewwidgetState();
}

class _NewwidgetState extends State<Newwidget> {
  List bkslist = [];

  Future getBooks() async {
    var url = "https://intertarsal-surface.000webhostapp.com/getBooks.php";
    var res;
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
    }

    if (res.statusCode == 200) {
      setState(() {
        var red = json.decode((res.body));
        bkslist.addAll(red);
      });
    }
  }

  @override
  void initState() {
    getBooks();
    super.initState();
  }

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
              for (int i = 0; i < bkslist.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'bookpage',
                        arguments: BookArguments(
                            "${bkslist[i]["nom_livre"]}",
                            "${bkslist[i]["image_livre"]}",
                            "${bkslist[i]["cat_nom"]}",
                            "${bkslist[i]["nom_auteur"]} ${bkslist[i]["prenom_auteur"]}",
                            int.parse("${bkslist[i]["num_page"]}"),
                            "${bkslist[i]["description"]}"));
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
                            "${bkslist[i]["image_livre"]}",
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
                                "${bkslist[i]["nom_livre"]}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${bkslist[i]["cat_nom"]}",
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
