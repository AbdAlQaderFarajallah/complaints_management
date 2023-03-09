import 'package:complaints_management/api/controllers/search/search_api_controller.dart';
import 'package:complaints_management/models/search.dart';
import 'package:complaints_management/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String id = "SearchPage";

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Mails> _search = <Mails>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                child: SizedBox(
                  width: 75,
                  child: Row(
                    children: const [
                      SizedBox(height: 50),
                      Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Color(0xFF6589FF),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 310,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onChanged: (value) async {
                          if (value.isNotEmpty) {
                            _search =
                                await SearchApiController().search(text: value);
                            setState(() {});
                          } else {
                            _search = [];
                            setState(() {});
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      size: 30,
                      Icons.filter_alt_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                    itemCount: _search.length,
                    itemBuilder: (context, index) {
                      return Text(_search[index].subject!);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
