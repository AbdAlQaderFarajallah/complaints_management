import 'package:flutter/material.dart';

class NewInboxPage extends StatefulWidget {
  static const String id = "NewInboxPage";

  const NewInboxPage({Key? key}) : super(key: key);

  @override
  State<NewInboxPage> createState() => _NewInboxPageState();
}

class _NewInboxPageState extends State<NewInboxPage> {
  bool isClickTile = false;
  bool isClickActivity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){}, child: Text("Cancel", style: TextStyle(color: Colors.blue, fontSize: 16),)),
                      TextButton(onPressed: (){}, child: Text("New Inbox", style: TextStyle(color: Colors.black, fontSize: 16),)),
                      TextButton(onPressed: (){}, child: Text("Done", style: TextStyle(color: Colors.blue, fontSize: 16),)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              children: [
                                Icon(Icons.person, color: Colors.grey,),
                                SizedBox(width: 8,),
                                Text("Sender", style: TextStyle(color: Colors.grey, fontSize: 16),),
                              ]
                          ),
                          Icon(Icons.error_outline, color: Colors.blue),
                        ],
                      ),
                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  indent: 16,
                                  color: Colors.grey,
                                  thickness: 0.9,
                                  endIndent: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                const Text(
                                "Others",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                                  SizedBox(width: 8,),
                                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey,),
  ]
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType:
                        TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title of mail",
                        ),
                      ),
                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  indent: 16,
                                  color: Colors.grey,
                                  thickness: 0.9,
                                  endIndent: 0,
                                ),
                              ),
                            ],
                          ),
                      TextFormField(
                        keyboardType:
                        TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(children: [Icon(Icons.date_range, color: Colors.blue,), SizedBox(width: 8,), Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Date", style: TextStyle(color: Colors.black, fontSize: 18),), Text("Tuesday, July 5, 2022", style: TextStyle(color: Colors.grey, fontSize: 16),)],)],),
                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  indent: 16,
                                  color: Colors.grey,
                                  thickness: 0.9,
                                  endIndent: 0,
                                ),
                              ),
                            ],
                          ),
                      Row(children: [Icon(Icons.description_rounded, color: Colors.blue,), SizedBox(width: 8,), Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text("Archive number", style: TextStyle(color: Colors.black, fontSize: 18),), Text("2022 / 6019", style: TextStyle(color: Colors.grey, fontSize: 16),)],)],),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.numbers,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 8,),
                          Text(
                            "Tags",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.question_mark,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Center(
                                child: Text(
                                  "Inbox",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                )),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Decision",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextFormField(
                        keyboardType:
                        TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add decision...",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add image",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
                ListTile(
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
                !isClickActivity
                    ? Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Method For Searching
                    },
                    decoration: InputDecoration(
                      hintText: "Add new activity...",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
