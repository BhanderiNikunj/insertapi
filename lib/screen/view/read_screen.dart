import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insertapi/screen/model/home_model.dart';
import 'package:insertapi/screen/model/read_model.dart';
import 'package:insertapi/utills/db_apihelper.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController dic = TextEditingController();
  TextEditingController id = TextEditingController();

  late Future<List<ReadModel>> _getInsertdata;
  late Future<List<InsertModel>> _getUpdatedata;

  @override
  void initState() {
    super.initState();
    _getInsertdata = ApiHelper().fetchEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ReadModel>>(
          future: _getInsertdata,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${snapshot.data![index].name}"),
                            IconButton(
                              onPressed: () async {
                                var delet = await ApiHelper().Delet("${snapshot.data![index].id}");
                                if (delet.status == true) {
                                  Fluttertoast.showToast(
                                      msg: "${delet.message}",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadScreen(),),);
                                }
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                //
                                name.text = snapshot.data![index].name!;
                                dic.text = snapshot.data![index].desc!;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Column(
                                      children: [
                                        TextField(
                                          controller: name,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: dic,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            var responce = await ApiHelper()
                                                .updataData(
                                                    "${snapshot.data![index].id}",
                                                    name.text,
                                                    dic.text);
                                            if (responce.status == true) {
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ReadScreen(),),);

                                            }
                                          },
                                          child: Text("done"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.system_update),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 100,
                      //   width: double.infinity,
                      //   child: Text("${snapshot.data![index].dName}"),
                      // ),
                    ],
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
