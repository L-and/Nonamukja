import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  Post._privateConstructor();

  static final Post _instance = Post._privateConstructor();

  factory Post() {
    return _instance;
  }

  Future<http.re > postListRequest() async {
    Uri url = Uri.parse('http://think2022.iptime.org:9900/nonamukja/post/');

    http.Response response = await http.get(url);

    print(response.body);
  }
}