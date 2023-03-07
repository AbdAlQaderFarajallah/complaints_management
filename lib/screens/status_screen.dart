import 'package:complaints_management/models/all_statuses.dart';
import 'package:flutter/material.dart';

import '../api/controllers/statuses/all_statuses_api_controller.dart';

class StatusPage extends StatefulWidget {
  static const String id = "StatusPage";

  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<Statuses> _statuses = <Statuses>[];

  late Future<List<Statuses>> _future;

  @override
  void initState() {
    super.initState();
    _future = AllStatusesApiController().allStatuses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Center(
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
            FutureBuilder<List<Statuses>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _statuses = snapshot.data ?? [];
                  return Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _statuses.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                  leading: Container(
                                    height: 32,
                                    width: 32,
                                    decoration:  BoxDecoration(
                                      color: Color(int.parse(_statuses[index].color!)),
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                  title: Text(
                                    _statuses[index].name!,
                                    style: const TextStyle(color: Colors.black),
                                  )),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
