import 'package:flutter/material.dart';
import 'package:gitproject/Api/api.dart';
import 'package:gitproject/Modal/commit.dart';
import 'package:gitproject/Widgets/first_question.dart';

class SecondQuestion extends StatefulWidget {
  final String name;
  const SecondQuestion({Key? key, required this.name}) : super(key: key);

  @override
  State<SecondQuestion> createState() => _SecondQuestionState();
}

class _SecondQuestionState extends State<SecondQuestion> {
  bool isLoading = false;
  List<CommitModal>? commitDataResponse = [];
  @override
  void initState() {
    GitHubApi.getCommitData(widget.name).then((commitData) {
      commitDataResponse = commitData;
      isLoading = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RepositoryList()));
            },
            child: const Text("Back")),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: (isLoading)
                ? SizedBox(
                    child: ListView.builder(
                      itemCount: commitDataResponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final commit = commitDataResponse![index];
                        return Container(
                          decoration: const BoxDecoration(
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.grey,
                                width: 1.0, // Adjust the border width here
                              ),
                            ),
                          ),
                          child: ListTile(
                              title: Text(
                                commit.commitMessage ?? " ",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                              subtitle: Text(
                                  '${commit.date ?? " "}  by ${commit.committerName ?? " "} ')),
                        );
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    ));
  }
}
