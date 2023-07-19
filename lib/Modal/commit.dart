import 'package:intl/intl.dart';

class CommitModal {
  String? commitMessage;
  String? committerName;
  String? committerEmail;
  String? date;

  CommitModal.fromjson(Map<String, dynamic> map) {
    String dateString = map['commit']['author']['date'].toString();

    // Parse the date string as UTC
    DateTime dateTime = DateTime.parse(dateString).toUtc();

    // Convert to the desired time zone
    dateTime = dateTime.toLocal();

    // Define the desired date format
    DateFormat formatter = DateFormat("d MMM yyyy");

    // Format the date
    String formattedDate = formatter.format(dateTime);

    commitMessage = map['commit']["message"];
    committerName = map['commit']['author']['name'];
    committerEmail = map['commit']['author']['email'];
    date = formattedDate;
  }
}
