import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  static const String id = "StatusPage";

  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Status",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("Add status", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.drive_file_rename_outline_sharp, color: Colors.grey,),
                  ),
                  ListTile(
                    leading: Container(height: 32, width: 32,decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                      ),
                    title: Text("Inbox", style: TextStyle(color: Colors.black),),
                    trailing: Icon(Icons.check, color: Colors.blue,),
                  ),
                  Divider(
                    indent: 16,
                    color: Colors.grey,
                    thickness: 0.5,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Container(height: 32, width: 32,decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                      ),
                    title: Text("Pending", style: TextStyle(color: Colors.black),),
                    trailing: Icon(Icons.check, color: Colors.blue,),
                  ),
                  Divider(
                    indent: 16,
                    color: Colors.grey,
                    thickness: 0.5,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Container(height: 32, width: 32,decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                      ),
                    title: Text("In Progress", style: TextStyle(color: Colors.black),),
                    trailing: Icon(Icons.check, color: Colors.blue,),
                  ),
                  Divider(
                    indent: 16,
                    color: Colors.grey,
                    thickness: 0.5,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Container(height: 32, width: 32,decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                      ),
                    title: Text("Completed", style: TextStyle(color: Colors.black),),
                    trailing: Icon(Icons.check, color: Colors.blue,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
