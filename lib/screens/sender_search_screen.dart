import 'package:flutter/material.dart';

class SenderSearchScreen extends StatefulWidget {
  static const String id = "SenderSearchScreen";

  const SenderSearchScreen({Key? key}) : super(key: key);

  @override
  State<SenderSearchScreen> createState() => _SenderSearchScreenState();
}

class _SenderSearchScreenState extends State<SenderSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0 ,vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){}, child: const Text("Cancel", style: TextStyle(color: Colors.blue, fontSize: 16),)),
                    TextButton(onPressed: (){}, child: const Text("Sender", style: TextStyle(color: Colors.black, fontSize: 16),)),
                    TextButton(onPressed: (){}, child: const Text("Done", style: TextStyle(color: Colors.blue, fontSize: 16),)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xffE6E6E6),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Method For Searching
                    },
                    decoration: InputDecoration(
                      hintText: "",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: Colors.black54),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text("\"Text\"", textDirection: TextDirection.ltr,),
                    ),
                  ],
                ),
                const Divider(thickness: 1, color: Colors.black54),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
