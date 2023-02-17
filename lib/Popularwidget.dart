import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/Getdata.dart';
import 'package:http/http.dart' as http;


class Popularwidget extends StatefulWidget {
  @override
  State<Popularwidget> createState() => _PopularwidgetState();
}

class _PopularwidgetState extends State<Popularwidget> {
  @override
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
              for (int i = 0; i < bkslist.length; i++)
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "${bkslist[i]["image_livre"]}",
                        height: 180,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: (() {
                    Navigator.pushNamed(context, 'bookpage',
                        arguments: BookArguments(
                            "${bkslist[i]["nom_livre"]}",
                            "${bkslist[i]["image_livre"]}",
                            "${bkslist[i]["cat_nom"]}",
                            "${bkslist[i]["nom_auteur"]} ${bkslist[i]["prenom_auteur"]}",
                            int.parse("${bkslist[i]["num_page"]}"),
                            "${bkslist[i]["description"]}"));
                  }),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
