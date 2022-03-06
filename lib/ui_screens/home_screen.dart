// ignore: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:newproject/model/user_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var androidInitializeSetting =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    var initializeSetting =
        InitializationSettings(android: androidInitializeSetting);

    localNotificationsPlugin.initialize(initializeSetting);
  }

//for user search text
  String _searched = "";
  showNotification() async {
    var androidNotificationDetails = const AndroidNotificationDetails(
        "channelId", "channelName",
        priority: Priority.high, importance: Importance.high);
    var platform = NotificationDetails(android: androidNotificationDetails);
    await localNotificationsPlugin.show(
        0, "Hello", "Have a nice day.", platform);
  }

  final students = StudentDetails.studentDetails;

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Students",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showNotification();
                },
                icon: const Icon(
                  Icons.notification_important_sharp,
                  color: Colors.black54,
                ))
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                customSearchBar(),
                const SizedBox(
                  height: 30,
                ),
                _searchedView(),
              ],
            ),
          ),
        )));
  }

  SizedBox _searchedView() {
    return SizedBox(
      height: 500,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount:
              (StudentDetails.studentDetails.isEmpty) ? 1 : students.length,
          itemBuilder: (context, int index) {
            var student = StudentDetails.studentDetails;
            return (students[index]
                        .name!
                        .toUpperCase()
                        .contains(_searched.toUpperCase()))
                    // ignore: unrelated_type_equality_checks
                    ||
                    (_searched == student[index].rollNo.toString())
                ? ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black12,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person,
                          size: 45,
                        ),
                      ),
                    ),
                    title: Text(
                      student[index].name!.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text("Roll No:${student[index].rollNo}"),
                  )
                : Container();
          }),
    );
  }

  Widget customSearchBar() {
    return Center(
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searched = value;
          });
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            hintText: "Search by Name and Roll No",
            fillColor: Colors.black12,
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 55)),
      ),
    );
  }
}
