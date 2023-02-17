import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/AuthPage.dart';
import 'package:myapp/Customnavbar.dart';
import 'package:myapp/Newwidget.dart';
import 'package:myapp/Popularwidget.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/fun/book.dart';
import 'package:myapp/profile/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePagestate createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> error_book(String a) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          backgroundColor: const Color(0xff292B37),
          title: const Text(
            'Error !',
            style: TextStyle(
                fontFamily: "kanit",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
          icon: Icon(
            Icons.error_outlined,
            color: Colors.white,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 21,
                ),
                Text(
                  a,
                  style: TextStyle(
                      fontFamily: "kanit", color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        fontFamily: "Kanit",
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextEditingController _controller = TextEditingController();
  String sel = "nom_auteur";
  List _books = [];
  dynamic valueitem;
  String? valuesearch;
  String? user;
  List listitem = ["par Titre", "par Auteur", "par ISBN"];

  @override
  Widget malist() {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: DropdownButton(
          underline: SizedBox(),
          icon: const Icon(Icons.filter_list),
          dropdownColor: const Color(0xff292B37),
          focusColor: const Color(0xff292B37),
          iconEnabledColor: Color.fromARGB(255, 205, 208, 225),
          value: valueitem,
          onChanged: (newValue) {
            setState(() {
              valueitem = newValue;
              if (valueitem == "par nom") {
                sel = "nom_livre";
              } else if (valueitem == "par auteur") {
                sel = "nom_auteur";
              } else if (valueitem == "par ISBN") {
                sel = "ISBN";
              }
            });
          },
          items: listitem.map((valueitem) {
            /* setState(() {
             
            });*/
            return DropdownMenuItem(
                value: valueitem,
                child: Text(valueitem,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 242, 242, 247),
                        fontSize: 14,
                        fontFamily: 'kanit')));
          }).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xff0F111D),
          automaticallyImplyLeading: false,
          toolbarHeight: 160,
          title: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello ${user ?? "Ali"},",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "What to read?",
                        style: TextStyle(
                            color: Colors.white54,
                            fontFamily: "os",
                            fontSize: 15),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      signout();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SvgPicture.asset(
                        "assets/icons/logout.svg",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff292B37),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: cw,
                child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16.5,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: malist(),
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (value) async {
                      dynamic response;
                      try {
                        response = value.isEmpty
                            ? await http.get(Uri.parse(
                                "https://intertarsal-surface.000webhostapp.com/getBooks.php"))
                            : await http.get(Uri.parse(
                                "https://intertarsal-surface.000webhostapp.com/getBooks.php?$sel=\"$value\""));
                      } catch (e) {
                        error_book("Error de connection !");
                      }

                      try {
                        if (response.statusCode == 200) {
                          final data = json.decode(response.body);
                          setState(() {
                            valuesearch = value;
                            _books = data;
                          });
                        }
                      } catch (e) {
                        error_book("pas de livre !");
                      }
                    }),
              ),
            ),
          ])),
      body: _books.length == 0
          ? SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Popularwidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    Newwidget(),
                  ],
                ),
              ),
            )
          : SafeArea(
              child: Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(
                          height: 200.0,
                          width: 100.0,
                          child: Image.network(
                            "${_books[index]['image_livre']}",
                          )),
                      title: Text("${_books[index]['nom_livre']}",
                          style: TextStyle(
                            color: const Color(0xff6369d9),
                          )),
                      subtitle: Text(
                          "${_books[index]['nom_auteur']} ${_books[index]['prenom_auteur']}",
                          style: TextStyle(
                            fontFamily: 'os',
                            color: Colors.white,
                          )),
                      onTap: () {
                        Navigator.pushNamed(context, 'bookpage',
                            arguments: ScreenArguments(
                                "${_books[index]['nom_livre']}",
                                "${_books[index]['image_livre']}",
                                "${_books[index]['cat_nom']}",
                                "${_books[index]['nom_auteur']}  ${_books[index]['prenom_auteur']}",
                                "${_books[index]['num_page']}",
                                "${_books[index]['description']}"));
                      },
                    );
                  },
                ),
              ),
            ),
      bottomNavigationBar: Customnavbar(),
    );
  }
}

void signout() {
  FirebaseAuth.instance.signOut();
}
