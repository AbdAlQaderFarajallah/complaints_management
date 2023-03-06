import 'package:complaints_management/api/controllers/tags/all_tags_api_controller.dart';
import 'package:complaints_management/widgets/tags_widget.dart';
import 'package:flutter/material.dart';

import '../models/all_tags.dart';

class TagsPage extends StatefulWidget {
  static const String id = "TagsPage";

  const TagsPage({Key? key}) : super(key: key);

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  List<Tags> _tags = <Tags>[];

  late Future<List<Tags>> _future;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
    _future = AllTagsApiController().allTags();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
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
                        "Tags",
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
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Tags>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _tags = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _tags.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: TagWidget(
                                      name: _tags[index].name.toString()),
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
                    ),
                  );
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: "Add new tag...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
