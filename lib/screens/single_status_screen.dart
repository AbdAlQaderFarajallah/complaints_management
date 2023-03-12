import 'package:complaints_management/api/controllers/statuses/single_status_api_controller.dart';
import 'package:flutter/material.dart';

import '../models/status/single_status.dart';

class SingleStatusScreen extends StatefulWidget {
  static const String id = "SingleStatusPage";
  final String data;

  SingleStatusScreen({required this.data}) : super();

  @override
  State<SingleStatusScreen> createState() => _SingleStatusScreenState();
}

class _SingleStatusScreenState extends State<SingleStatusScreen> {
  List<Mails> _mails = <Mails>[];

  late Future<List<Mails>> _future;

  @override
  void initState() {
    super.initState();
    _future = SingleStatusApiController().singleStatus(id: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Center(
              child: Text(
                "Status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FutureBuilder<List<Mails>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _mails = snapshot.data ?? [];
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: _mails.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Padding(
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
                                                MainAxisAlignment.spaceBetween,
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
                                                    _mails[index]
                                                        .subject
                                                        .toString(),
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      _mails[index]
                                                          .sender!
                                                          .name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Text(
                                              _mails[index]
                                                  .description
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Text(
                                              _mails[index].decision.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                  )),
                              const Divider(
                                  thickness: 1, color: Colors.black54),
                              const SizedBox(height: 15)
                            ],
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Error',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
