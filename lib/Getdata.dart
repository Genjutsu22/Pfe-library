import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class BookArguments {
  final String title;
  final String image;
  final String categorie;
  final String actor;
  final int nump;
  final String description;

  BookArguments(
    this.title,
    this.image,
    this.categorie,
    this.actor,
    this.nump,
    this.description,
  );
}

class CategotieArguments {
  final String Name;
  final String image;

  CategotieArguments(
    this.Name,
    this.image,

  );
}
class CategotieBookArguments {
  final List ll;  
  CategotieBookArguments(
    this.ll,
  );
}