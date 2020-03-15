import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int stars;
  String repoUrl;

  void fetchRepoDetails() async {
    http.Response response = await http
        .get('https://api.github.com/repos/muj-programmer/onboarding');
    Map<String, dynamic> repo = jsonDecode(response.body);
    setState(() {
      stars = repo['watchers_count'];
      repoUrl = repo['html_url'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRepoDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Thank You",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'stars : ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                stars == null
                    ? Container(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      )
                    : Text(stars.toString())
              ],
            ),
            SizedBox(height: 150.0),
            Text(
              'I hope you enjoyed the app\nas much as I enjoyed making it.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            FlatButton(
              onPressed: repoUrl == null
                  ? null
                  : () {
                      launch(repoUrl);
                    },
              child: Text("Goto Repo"),
            )
          ],
        ),
      ),
    );
  }
}
