// ignore: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:newproject/Module/user_details.dart';

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

  showNotification() async {
    var androidNotificationDetails = const AndroidNotificationDetails(
        "channelId", "channelName",
        priority: Priority.high, importance: Importance.high);
    var platform = NotificationDetails(android: androidNotificationDetails);
    await localNotificationsPlugin.show(
        0, "Hello", "Have a nice day.", platform);
  }

  final students = StudentDetails.studentDetails;
  bool searchItem() {
    var studentsLen = students.length;
    for (int i = 0; i <= studentsLen; i++) {
      (searchedItem.text.toUpperCase().codeUnits.length ==
              students[i].name_students!.codeUnits.length) ||
          (searchedItem.text.codeUnits[0] ==
              students[i].roll_no!.toString().codeUnits[0]);
      return true;
    }
    return false;
  }

  // ignore: non_constant_identifier_names
  student_index() {
    for (int i = 0; i < students.length; i++) {
      return i;
    }
  }

  final searchedItem = TextEditingController();
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
                searchedView(),
              ],
            ),
          ),
        )));
  }

  SizedBox searchedView() {
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
            return (students[index].name_students!.contains(searchedItem.text))
                    // ignore: unrelated_type_equality_checks
                    ||
                    (searchedItem.text.codeUnits[0] ==
                        student[index].roll_no!.toString().codeUnits[0])
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
                      student[index].name_students!.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text("Roll No:${student[index].roll_no}"),
                  )
                : Container();
          }),
    );
  }

  Row customSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          controller: searchedItem,
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
        InkWell(
          onTap: () {
            print(searchItem());

            setState(() {
              print(student_index());
            });
          },
          child: Container(
            width: 50,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.search,
              size: 29,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }
}
