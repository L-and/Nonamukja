import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nonamukja/model/post_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Post {
  Post._privateConstructor();

  static final Post _instance = Post._privateConstructor();

  factory Post() {
    return _instance;
  }

  var photo;

  List<PostModel> postModelList =  new List.filled(1, PostModel.Initial()); // 게시글 Json정보를 저장할 변수

  int postCount = 0; // 개시글의 수를 저장하는 변수

  Future<List<PostModel>> postListGetRequest() async { // 게시글목록을 불러와 Map으로 저장 후 statusCode 를 리턴
    Uri url = Uri.parse('http://think2022.iptime.org:9900/nonamukja/post/');

    http.Response response = await http.get(url);
    print("[Post]Response StatusCode: "+response.statusCode.toString());
    print("[Post]Post Get요청 성공!");

    List<dynamic> body = json.decode(response.body);

    postModelList =
    body.map((dynamic item) => PostModel.fromJson(item)).toList();

    print("[Post]postData 저장 성공!");

    postCount = postModelList.length;

    return postModelList;
  }

  Future<http.Response> postPostRequest(title, content, talkLink) async { // 헤더에 토큰을 담아 게스글을 작성하는 함수
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Uri url = Uri.parse('http://think2022.iptime.org:9900/nonamukja/post/');

    Map <String, String> tokenJson = {
      'token': prefs.getStringList('TokenList')?[1] ?? ""
    };

    var request = new http.MultipartRequest("POST", url);

    String? token = prefs.getStringList('TokenList')?[1].toString() ?? "";

    request.headers.addAll({
      HttpHeaders.authorizationHeader: "Bearer $token"
    });

    request.fields.addAll({
      'title': title,
      'content': content,
      'talk_link': talkLink,
    });

    var stream = http.ByteStream(photo.openRead());
    var length = await photo.length();

    var multipartFile = await http.MultipartFile.fromPath('Image', photo.path);
    request.files.add(multipartFile);

    var streamResponse = await request.send();

    var response = http.Response.fromStream(streamResponse);

    return response;
  }

  GetPostDataLength() {

    print(postCount);
    return postCount;
  }

  GetPostData() {
    return postModelList;
  }
}