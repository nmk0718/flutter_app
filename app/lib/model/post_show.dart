import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart';
import 'post.dart';

class post_show extends StatelessWidget {
  final Post post;

  post_show({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Image.network(post.imageUrl),
              Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${post.title}',
                        style: Theme.of(context).textTheme.title),
                    Text('${post.author}',
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('${post.description}'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
