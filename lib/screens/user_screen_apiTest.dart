import 'dart:convert';

import 'package:apipractice/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class UserScreenApiTest extends StatefulWidget {
  const UserScreenApiTest({super.key});

  @override
  State<UserScreenApiTest> createState() => _UserScreenApiTestState();
}

class _UserScreenApiTestState extends State<UserScreenApiTest> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // var data = jsonDecode(response.body.toString());
    var datas = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in datas) {
        // print(a['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Api Test"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }

                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                ReRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                ReRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                                ReRow(title: 'City', value: snapshot.data![index].address!.city.toString()),
                                ReRow(title: 'Phone', value: snapshot.data![index].phone.toString()),

                              ]),
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}

class ReRow extends StatelessWidget {
   ReRow({super.key, required this.title, required this.value});

  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ],
      ),
    );
  }
}
