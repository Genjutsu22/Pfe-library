import 'package:flutter/material.dart';
import 'package:myapp/Customnavbar.dart';
import 'package:myapp/Newwidget.dart';
import 'package:myapp/Popularwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePagestate createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final cw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Ali,",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "What to read?",
                          style: TextStyle(color: Colors.white54),
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xff292B37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  Icon(
                    Icons.search_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: cw - 70,
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Popularwidget(),
              SizedBox(
                height: 15,
              ),
              Newwidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Customnavbar(),
    );
  }
}
