import 'package:complaints_management/api/controllers/category/mails_of_category_api_controller.dart';
import 'package:complaints_management/screens/login_and_signup.dart';
import 'package:complaints_management/screens/profile_screen.dart';
import 'package:complaints_management/screens/search_screen.dart';
import 'package:complaints_management/screens/single_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../api/controllers/auth/auth_api_controller.dart';
import '../api/controllers/statuses/all_statuses_api_controller.dart';
import '../models/category/mails_of_category.dart';
import '../models/status/all_statuses.dart';
import '../widgets/box_widget.dart';
import 'new_inbox_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClickOfficial1 = false;
  bool isClickOfficial2 = false;
  bool isClickOfficial3 = false;
  bool isClickOfficial4 = false;

  List<Statuses> _statuses = <Statuses>[];
  late Future<List<Statuses>> _future;

  List<Mail> _mails1 = <Mail>[];
  List<Mail> _mails2 = <Mail>[];
  List<Mail> _mails3 = <Mail>[];
  List<Mail> _mails4 = <Mail>[];
  late Future<List<Mail>> _futureSenders1;
  late Future<List<Mail>> _futureSenders2;
  late Future<List<Mail>> _futureSenders3;
  late Future<List<Mail>> _futureSenders4;

  @override
  void initState() {
    _future = AllStatusesApiController().allStatuses();
    _futureSenders1 =
        MailsOfCategoriesApiController().mailsOfCategories(id: '1');
    _futureSenders2 =
        MailsOfCategoriesApiController().mailsOfCategories(id: '2');
    _futureSenders3 =
        MailsOfCategoriesApiController().mailsOfCategories(id: '3');
    _futureSenders4 =
        MailsOfCategoriesApiController().mailsOfCategories(id: '4');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffF7F6FF),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.filter_list,
                              size: 24,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProfileScreen.id);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.person),
                                      SizedBox(width: 10),
                                      Text("Profile")
                                    ],
                                  ),
                                ),
                              ),
                              // popupmenu item 2
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: const [
                                    Icon(Icons.language),
                                    SizedBox(width: 10),
                                    Text("Arabic")
                                  ],
                                ),
                              ),
                              // popupmenu item 3
                              PopupMenuItem(
                                value: 3,
                                child: InkWell(
                                  onTap: () async {
                                    await logout(context);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.logout_outlined),
                                      SizedBox(width: 10),
                                      Text("logout")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            offset: const Offset(0, 60),
                            color: Colors.white,
                            elevation: 8,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                "images/person.png",
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    //
                    //
                    //
                    //

                    //Search
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SearchPage.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //
                    //
                    //
                    //
                    //
                    FutureBuilder<List<Statuses>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: SizedBox(
                            height: 192,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: Container(
                                        width: 165,
                                        height: 60,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 16, right: 8),
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: Container(
                                        width: 165,
                                        height: 60,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 16, right: 8),
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: Container(
                                        width: 165,
                                        height: 60,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 16, right: 8),
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[400]!,
                                      highlightColor: Colors.grey[300]!,
                                      child: Container(
                                        width: 165,
                                        height: 60,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 16, right: 8),
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            left: 16,
                                            right: 16,
                                            bottom: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _statuses = snapshot.data ?? [];
                          return SizedBox(
                            height: 192,
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleStatusScreen(
                                                        data: '1')));
                                      },
                                      child: BoxWidget(
                                          text: _statuses[0].name!,
                                          num: int.parse(
                                              _statuses[0].mailsCount!),
                                          color: Color(
                                              int.parse(_statuses[0].color!))),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleStatusScreen(
                                                        data: '2')));
                                      },
                                      child: BoxWidget(
                                          text: _statuses[1].name!,
                                          num: int.parse(
                                              _statuses[1].mailsCount!),
                                          color: Color(
                                              int.parse(_statuses[1].color!))),
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleStatusScreen(
                                                        data: '3')));
                                      },
                                      child: BoxWidget(
                                          text: _statuses[2].name!,
                                          num: int.parse(
                                              _statuses[2].mailsCount!),
                                          color: Color(
                                              int.parse(_statuses[2].color!))),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleStatusScreen(
                                                        data: '4')));
                                      },
                                      child: BoxWidget(
                                          text: _statuses[3].name!,
                                          num: int.parse(
                                              _statuses[3].mailsCount!),
                                          color: Color(
                                              int.parse(_statuses[3].color!))),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'Error',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      },
                    ),
//******************************************************************************
                    ListTile(
                      leading: const Text(
                        "Official Organizations",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                            !isClickOfficial1
                                ? Icons.keyboard_arrow_down_outlined
                                : Icons.keyboard_arrow_up,
                            color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isClickOfficial1 = !isClickOfficial1;
                          });
                        },
                      ),
                    ),
                    !isClickOfficial1
                        ? FutureBuilder(
                            future: _futureSenders1,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                _mails1 = snapshot.data ?? [];
                                return SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: _mails1.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 16, right: 16),
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 12,
                                                        width: 12,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(50),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                       Text(
                                                         _mails1[index].subject.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          _mails1[index].status.name,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Text(
                                                  _mails1[index].description.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Text(
                                                  _mails1[index].decision.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 42,
                                                      width: 42,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(8),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Image.asset(
                                                          "images/person.png",
                                                          width: 36,
                                                          height: 36,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          )
                        : const SizedBox(),
//******************************************************************************
                    ListTile(
                      leading: const Text(
                        "NGOs",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                            !isClickOfficial2
                                ? Icons.keyboard_arrow_down_outlined
                                : Icons.keyboard_arrow_up,
                            color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isClickOfficial2 = !isClickOfficial2;
                          });
                        },
                      ),
                    ),
                    !isClickOfficial2
                        ? FutureBuilder(
                      future: _futureSenders3,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _mails3 = snapshot.data ?? [];
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: _mails3.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  _mails3[index].subject.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(8.0),
                                                  child: Text(
                                                    _mails3[index].status.name,
                                                    style:
                                                    const TextStyle(
                                                        color: Colors
                                                            .grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            _mails3[index].description.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            _mails3[index].decision.toString(),
                                            overflow:
                                            TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight:
                                              FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 42,
                                                width: 42,
                                                decoration:
                                                const BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/person.png",
                                                    width: 36,
                                                    height: 36,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                        : const SizedBox(),
//******************************************************************************
                    ListTile(
                      leading: const Text(
                        "Other",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                            !isClickOfficial3
                                ? Icons.keyboard_arrow_down_outlined
                                : Icons.keyboard_arrow_up,
                            color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isClickOfficial3 = !isClickOfficial3;
                          });
                        },
                      ),
                    ),
                    !isClickOfficial3
                        ? FutureBuilder(
                      future: _futureSenders4,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _mails4 = snapshot.data ?? [];
                          return SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: _mails4.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 12,
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                      Radius.circular(50),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  _mails4[index].subject.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(8.0),
                                                  child: Text(
                                                    _mails4[index].status.name,
                                                    style:
                                                    const TextStyle(
                                                        color: Colors
                                                            .grey),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            _mails4[index].description.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            _mails4[index].decision.toString(),
                                            overflow:
                                            TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight:
                                              FontWeight.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 42,
                                                width: 42,
                                                decoration:
                                                const BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "images/person.png",
                                                    width: 36,
                                                    height: 36,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                        : const SizedBox(),
//******************************************************************************
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Tags",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "All Tags",
                                    style: TextStyle(color: Colors.grey[300]),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "#Urgent",
                                    style: TextStyle(color: Colors.grey[300]),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "#News",
                                    style: TextStyle(color: Colors.grey[300]),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "#EgyptianMilitary",
                                    style: TextStyle(color: Colors.grey[300]),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "#Options",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            indent: 16,
                            color: Colors.grey,
                            thickness: 1.5,
                            endIndent: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //
              //****************************************************************
              // New Inbox
              //
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NewInboxPage.id);
                },
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 40,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "New Inbox",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut)
      Navigator.pushReplacementNamed(context, LoginAndSignupPage.id);
  }
}
