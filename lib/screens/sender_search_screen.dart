import 'package:complaints_management/api/controllers/senders/all_senders_api_controller.dart';
import 'package:complaints_management/models/all_senders.dart';
import 'package:flutter/material.dart';

class SenderSearchScreen extends StatefulWidget {
  static const String id = "SenderSearchScreen";

  const SenderSearchScreen({Key? key}) : super(key: key);

  @override
  State<SenderSearchScreen> createState() => _SenderSearchScreenState();
}

class _SenderSearchScreenState extends State<SenderSearchScreen> {
  List<Senders> _senders = <Senders>[];

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
                  Text("Sender",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  onChanged: (value) async {
                    if (value.isNotEmpty) {
                      _senders = await AllSendersApiController().allSenders();
                      setState(() {});
                    } else {
                      _senders = [];
                      setState(() {});
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: _senders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Text(
                            _senders[index].name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
