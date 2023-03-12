import 'package:complaints_management/api/controllers/tags/all_tags_api_controller.dart';
import 'package:complaints_management/api/controllers/tags/create_tag_api_controller.dart';
import 'package:complaints_management/widgets/tags_widget.dart';
import 'package:flutter/material.dart';

import '../models/all_tags.dart';
import '../widgets/input_text_field.dart';

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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Tags",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Tags>>(
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InputTextField(
                        icon: Icons.add,
                        hintText: "Add Tag",
                        textController: textEditingController),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        onPressed: () async {
                          await createTag();
                          Navigator.pop(context);
                        },
                        child: const Text('SAVE')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createTag() async {
    await CreateTagApiController().createTag(
      name: textEditingController.text,
    );
  }
}
