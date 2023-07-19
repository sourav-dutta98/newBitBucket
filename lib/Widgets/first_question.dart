import 'package:flutter/material.dart';
import 'package:gitproject/Api/api.dart';
import 'package:gitproject/Modal/foot.dart';
import 'package:gitproject/Widgets/FootUi.dart';
import 'package:gitproject/Widgets/head.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepositoryList extends StatefulWidget {
  @override
  _RepositoryListState createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
  List<dynamic> repositories = [];

  @override
  void initState() {
    super.initState();
    fetchRepositories();
  }

  fetchRepositories() {
    GitHubApi.getCall().then((repoData) => {
          setState(() {
            repositories = jsonDecode(repoData);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (BuildContext context, int index) {
          final repo = repositories[index];
          return Container(
            height: 100,
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.grey,
                  width: 1.0, // Adjust the border width here
                ),
              ),
            ),
            child: ListTile(
              title: HeadUi(name: repo['name'], visibility: repo['visibility']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(repo['description'] ?? ''),
                  const SizedBox(
                    height: 20,
                  ),
                  FootUi(footElement: [
                    FootModal(repo["language"] ?? " ", "language"),
                    FootModal(repo["forks_count"] ?? " ", "forks"),
                    FootModal(repo["stargazers_count"] ?? " ", "stargazers"),
                  ])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
