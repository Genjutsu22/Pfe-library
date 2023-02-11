import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/Customnavbar.dart';
import 'package:myapp/Newwidget.dart';
import 'package:myapp/Popularwidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePagestate createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  List _books = [];
  dynamic valueitem;
  String? valuesearch;
  String? user;
  List listitem = ["Par titre", "Par auteur", "Par genre"];

  @override
  Widget malist() {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: DropdownButton(
          underline: SizedBox(),
          icon: const Icon(Icons.tune),
          dropdownColor: const Color(0xff292B37),
          focusColor: const Color(0xff292B37),
          iconEnabledColor: Color.fromARGB(255, 205, 208, 225),
          value: valueitem,
          onChanged: (newValue) {
            setState(() {
              valueitem = newValue;
            });
          },
          items: listitem.map((valueitem) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/icons/user.png",
                      width: 50,
                      height: 50,
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
                    if (value.isNotEmpty) {
                      final response = await http.get(Uri.parse(
                          'https://www.googleapis.com/books/v1/volumes?q=$value'));
                      if (response.statusCode == 200) {
                        final data = json.decode(response.body);
                        setState(() {
                          valuesearch = value;
                          _books = data  != null ? data['items']: [];
                        });
                      } else {
                        
                      }
                    }
                  },
                ),
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
                    final book = _books[index];
                    return ListTile(
                      leading: SizedBox(
                          height: 100.0,
                          width: 100.0,
                          child: Image.network(
                            "https://www.mercator-ocean.eu/wp-content/uploads/2019/11/Mock-Up_BlueBookCopernicus_2.jpg",
                          )),
                      title: book['volumeInfo']['title'] != null ? Text(book['volumeInfo']['title'],
                          style: TextStyle(
                            fontFamily: 'os',
                            color: Colors.white,
                          )):
                          Text("Not found !",
                          style: TextStyle(
                            fontFamily: 'os',
                            color: Colors.white,
                          )),
                      subtitle: book['volumeInfo']['authors'] != null
                          ? Text(
                              book['volumeInfo']['authors']
                                  .join(" , ")
                                  .toString(),
                              style: TextStyle(
                                color: const Color(0xff6369d9),
                              ))
                          : Text("not found ",
                              style: TextStyle(
                                color: const Color(0xff6369d9),
                                fontFamily: 'os',
                              )),
                      onTap: () {
                        Navigator.pushNamed(context, 'bookpage');
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
