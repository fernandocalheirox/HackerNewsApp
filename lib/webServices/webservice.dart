import 'dart:convert';
import 'package:hacker_news/models/story.model.dart';
import 'package:hacker_news/webServices/url_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';





class WebService {

  Future<Response> _getStory(int storyId) {
    return http.get(UrlService.urlForStory(storyId));
  }

  Future<List<Response>> getCommentsByStory(Story story) async {
    return Future.wait(story.commentIds.map((commentId)  { 
        return http.get(UrlService.urlForCommentById(commentId));
    }));
  } 

  Future<List<Response>> getStories(String typeStory) async {
    
    final response = await http.get(typeStory);

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      
      // return Future.wait(storyIds.map((storyId) {
      //    return _getStory(storyId);
      // }));
      return Future.wait(storyIds.take(15).map((storyId) {
        return _getStory(storyId);
      }));
      
      
    } else {
      throw Exception("Erro de Conexão");
    }
    

  }




}