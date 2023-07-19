import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Modal/commit.dart';

class GitHubApi {
  static getCall() async {
    final getResponse = await http
        .get(Uri.parse("https://api.github.com/users/freeCodeCamp/repos"));

    return getResponse.body;
  }

  static getCommitData(String name) async {
    List<CommitModal> commitList = [];
    final getCommitResponse = await http.get(
        Uri.parse("https://api.github.com/repos/freeCodeCamp/$name/commits"));

    final responseResult = jsonDecode(getCommitResponse.body);
    for (int i = responseResult.length - 1; i >= 0; i--) {
      commitList.add(CommitModal.fromjson(responseResult[i]));
    }
    return commitList;
  }
}
