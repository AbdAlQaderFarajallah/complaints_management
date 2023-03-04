import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  static const String id = "CategoryPage";

  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Category",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                            child: Text(
                              "Official organization",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.black54),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                            child: Text(
                              "NGOs",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          // Icon(Icons.check, color: Colors.blue,)
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.black54),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                            child: Text(
                              "UnBorder",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          // Icon(Icons.check, color: Colors.blue,)
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.black54),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                            child: Text(
                              "Others",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          // Icon(Icons.check, color: Colors.blue,)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
