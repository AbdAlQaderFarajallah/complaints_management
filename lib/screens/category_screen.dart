import 'package:complaints_management/api/controllers/category/all_categories_api_controller.dart';
import 'package:complaints_management/models/all_categories.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  static const String id = "CategoryPage";

  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Categories> _categories = <Categories>[];

  late Future<List<Categories>> _future;

  @override
  void initState() {
    super.initState();
    _future = AllCategoriesApiController().allCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                "Category",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(height: 50),
              FutureBuilder<List<Categories>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    _categories = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pop(context, _categories[index].name);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(_categories[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.black54,
                                  )
                                ],
                              ));
                        },
                      ),
                    );
                  } else {
                    return const Center(
                        child: Text(
                      'Error',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
