import 'package:complaints_management/screens/category_screen.dart';
import 'package:complaints_management/screens/status_screen.dart';
import 'package:complaints_management/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'tags_screen.dart';

class NewInboxPage extends StatefulWidget {
  static const String id = "NewInboxPage";

  const NewInboxPage({Key? key}) : super(key: key);

  @override
  State<NewInboxPage> createState() => _NewInboxPageState();
}

class _NewInboxPageState extends State<NewInboxPage> {
  bool isClickTile = false;
  bool isClickActivity = false;
  late TextEditingController senderTextEditingController;
  late TextEditingController archiveNumberTextEditingController;
  late TextEditingController titleOfMailTextEditingController;
  late TextEditingController descriptionTextEditingController;
  late TextEditingController decisionTextEditingController;
  late TextEditingController newActivityTextEditingController;
  var popResultCat = 'others';
  var popStatusName = 'inbox';
  var popStatusColor = '0xffFA3A57';
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    senderTextEditingController = TextEditingController();
    archiveNumberTextEditingController = TextEditingController();
    titleOfMailTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
    decisionTextEditingController = TextEditingController();
    newActivityTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    senderTextEditingController.dispose();
    archiveNumberTextEditingController.dispose();
    titleOfMailTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    decisionTextEditingController.dispose();
    newActivityTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xffF7F6FF),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "New Inbox",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 378,
                  height: 150,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InputTextField(
                                icon: Icons.person,
                                hintText: 'Sender',
                                textController: senderTextEditingController),
                          ),
                          const Icon(Icons.error_outline, color: Colors.blue),
                        ],
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          _navigateAndDisplaySelectionCategoryPage(context);
                        },
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Row(children: [
                                Text(
                                  popResultCat.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward_ios_outlined,
                                    color: Colors.grey),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputTextField(
                        textController: titleOfMailTextEditingController,
                        hintText: 'Title of Mail',
                      ),
                      const SizedBox(height: 10),
                      InputTextField(
                        textController: descriptionTextEditingController,
                        hintText: 'Description',
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              _showDatePicker();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Date",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                    DateFormat('yyyy-MM-dd').format(_dateTime)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Divider(thickness: 1, color: Colors.black54),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.description_rounded,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Archive number",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 110,
                            child: TextField(
                              controller: archiveNumberTextEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  hintText: '2022/6019'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, TagsPage.id);
                  },
                  child: Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 8),
                            Icon(
                              Icons.numbers,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Tags",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigateAndDisplaySelectionStatusPage(context);
                  },
                  child: Container(
                    height: 60,
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.adjust,
                              color: Colors.grey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration:  BoxDecoration(
                                color: Color(int.parse(popStatusColor)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                              ),
                              child:  Center(
                                  child: Text(
                                popStatusName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 8, top: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Decision",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      InputTextField(
                        hintText: 'Add Decision',
                        textController: decisionTextEditingController,
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Add Image",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    leading: const Text(
                      "Activity",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                          !isClickActivity
                              ? Icons.keyboard_arrow_down_outlined
                              : Icons.keyboard_arrow_up,
                          color: Colors.black),
                      onPressed: () {
                        setState(() {
                          isClickActivity = !isClickActivity;
                        });
                      },
                    ),
                  ),
                ),
                !isClickActivity
                    ? Container(
                        height: 70,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InputTextField(
                                hintText: 'Add New Activity...',
                                textController:
                                    newActivityTextEditingController,
                                icon: Icons.person,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.send, color: Colors.blue))
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelectionCategoryPage(
      BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CategoryPage()),
    );
    if (!mounted) return;

    popResultCat = result;

    setState(() {});
  }

  Future<void> _navigateAndDisplaySelectionStatusPage(
      BuildContext context) async {
    final result1 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StatusPage()),
    );
    if (!mounted) return;

    popStatusColor = result1[0];
    popStatusName = result1[1];

    setState(() {});
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }
}
