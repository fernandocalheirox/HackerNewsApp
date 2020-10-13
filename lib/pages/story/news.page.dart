import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hacker_news/models/comment.model.dart';
import 'package:hacker_news/models/story.model.dart';
import 'package:hacker_news/pages/comment.page.dart';
import 'package:hacker_news/webServices/url_service.dart';
import 'package:hacker_news/webServices/webservice.dart';
import 'package:hacker_news/widgets/loading.widget.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}


class _NewsPageState extends State<NewsPage> {
  bool completed = false;
  List<Story> _stories = List<Story>();
  @override
  void initState() {
    super.initState();    
    newsSories();
  }

  Future newsSories() async {
    final responses = await WebService().getStories(UrlService.urlForNewStories());
   
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJSON(json);
    }).toList();

    if(mounted) setState(() { _stories = stories; completed = true;});
    
  }

  void _navigateToShowCommentsPage(BuildContext context, int index) async {
    final story = this._stories[index]; 
    final responses = await WebService().getCommentsByStory(story);
    final comments = responses.map((response) {
      final json = jsonDecode(response.body);
      return Comment.fromJSON(json);
    }).toList();

    debugPrint("$comments");

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CommentListPage(story: story, comments: comments)
    )); 
  }
  
  @override
  Widget build(BuildContext context) {
    if (completed)
    return ListView.builder(
      itemCount: _stories.length,
      
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
        _navigateToShowCommentsPage(context, index);
          },
          title: Text(_stories[index].title, style: TextStyle(fontSize: 18)),
          trailing: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),

                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("${_stories[index].commentIds.length}",style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
    else
      return loading(context);
  }
}


