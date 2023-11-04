import 'package:flutter/material.dart';
import 'package:insertapi/screen/view/read_screen.dart';
import 'package:insertapi/utills/db_apihelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController dic = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: dic,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // var Screen = await ApiHelper().Insert(id.text, name.text, dic.text);
                  // if("${Screen.status}"=="true")
                  //   {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadScreen(),),);
                    // }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
