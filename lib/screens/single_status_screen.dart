import 'package:complaints_management/api/controllers/statuses/single_status_api_controller.dart';
import 'package:flutter/material.dart';

import '../models/status/single_status.dart';

class SingleStatusScreen extends StatefulWidget {
  static const String id = "SingleStatusPage";

  const SingleStatusScreen({Key? key}) : super(key: key);

  @override
  State<SingleStatusScreen> createState() => _SingleStatusScreenState();
}

class _SingleStatusScreenState extends State<SingleStatusScreen> {
  List<Mails> _mails = <Mails>[];

  late Future<List<Mails>> _future;

  @override
  void initState() {
    super.initState();
    _future = SingleStatusApiController().singleStatus(id: '1');
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
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
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
                                child: ListTile(
                                    leading: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                    title: Text(
                                      _mails[index].subject!,
                                      style: const TextStyle(color: Colors.black),
                                    )),
                              ),
                              const Divider(thickness: 1, color: Colors.black54),
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
