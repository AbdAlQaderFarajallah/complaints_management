import 'package:complaints_management/api/controllers/senders/all_senders_api_controller.dart';
import 'package:complaints_management/models/senders/all_senders.dart';
import 'package:flutter/material.dart';

class AllSenderScreen extends StatefulWidget {
  static const String id = "AllSenderScreen";

  const AllSenderScreen({Key? key}) : super(key: key);

  @override
  State<AllSenderScreen> createState() => _AllSenderScreenState();
}

class _AllSenderScreenState extends State<AllSenderScreen> {
  List<Senders> _senders = <Senders>[];

  @override
  void initState() {
    AllSendersApiController().allSenders().then((value) {
      _senders = value;
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("All Sender",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: ListView.builder(
                      itemCount: _senders.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context,
                                  [_senders[index].id, _senders[index].name]);
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _senders[index].name!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      _senders[index].mobile!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.black, thickness: 1)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
