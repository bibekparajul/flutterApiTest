import 'dart:convert';

import 'package:apipractice/Models/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //list is created because the name for the array is not given
  List<PostsModel> postList = [];

  //future function is created in order get the response after some time
  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    //then the response is decoded
    var data = jsonDecode(response.body.toString());


    //after this the status is checked
    if (response.statusCode == 200) {
      postList.clear();

      //if reponse exists the add the data into the postlist
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Practice"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(

            //comes from api so future builder is used
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator(color: Colors.blue,value: 0.3,));
                } else {
                  return ListView.builder(
                      itemCount:postList.length,
                      itemBuilder: (context, index) {
                    return Card(elevation: 2.0,
                      margin: EdgeInsets.all(9),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Id:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text(postList[index].id.toString(),),
                            SizedBox(height: 5,),
                            Text('Title:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text(postList[index].title.toString())
                          ],
                        ),
                      ),
                    );
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
