import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../api/controllers/category/all_categories_api_controller.dart';
import '../api/controllers/search/search_api_controller.dart';
import '../api/controllers/statuses/all_statuses_api_controller.dart';
import '../models/all_categories.dart';
import '../models/search.dart';
import '../models/status/all_statuses.dart';

class FiltersScreen extends StatefulWidget {
  static const String id = "FilterSearchPage";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Categories> _categories = <Categories>[];

  late Future<List<Categories>> _futureCategories;

  List<Statuses> _statuses = <Statuses>[];
  late Future<List<Statuses>> _futureStatus;
  List<Mails> _search = <Mails>[];
  DateTime _dateTimeFrom = DateTime.now();
  DateTime _dateTimeTo = DateTime.now();

  late String statusId;

  @override
  void initState() {
    _futureCategories = AllCategoriesApiController().allCategories();
    _futureStatus = AllStatusesApiController().allStatuses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                height: 240,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: FutureBuilder<List<Categories>>(
                  future: _futureCategories,
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
                                onTap: () {},
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
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 290,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: FutureBuilder<List<Statuses>>(
                  future: _futureStatus,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      _statuses = snapshot.data ?? [];
                      return Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _statuses.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    statusId = _statuses[index].id.toString();
                                    setState(() {});
                                  },
                                  child: ListTile(
                                      leading: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              _statuses[index].color!)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                      ),
                                      title: Text(
                                        _statuses[index].name!,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      )),
                                ),
                                const Divider(
                                    thickness: 1, color: Colors.black54),
                              ],
                            );
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
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.date_range, color: Colors.red, size: 30),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Text('From : '),
                                InkWell(
                                  onTap: () {
                                    _showDatePickerFrom();
                                    setState(() {});
                                  },
                                  child: Text(DateFormat('yyyy-MM-dd')
                                      .format(_dateTimeFrom)),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                const Text('To : '),
                                InkWell(
                                  onTap: () {
                                    _showDatePickerTo();
                                    setState(() {});
                                  },
                                  child: Text(DateFormat('yyyy-MM-dd')
                                      .format(_dateTimeTo)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  SearchApiController()
                      .search(
                          statusId: statusId,
                          start: _dateTimeFrom.toString(),
                          end: _dateTimeTo.toString())
                      .then((value) {
                    _search = value;
                  });
                  setState(() {});
                  Future.delayed(const Duration(seconds: 5),
                      () => Navigator.pop(context, _search));
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePickerFrom() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTimeFrom = value!;
      });
    });
  }

  void _showDatePickerTo() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTimeTo = value!;
      });
    });
  }
}
