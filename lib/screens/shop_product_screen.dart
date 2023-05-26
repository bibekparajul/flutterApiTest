import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Models/shop_products_model.dart';
import 'package:http/http.dart' as http;

class ShopProductScreen extends StatefulWidget {
  const ShopProductScreen({super.key});

  @override
  State<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends State<ShopProductScreen> {
  Future<ShopProductsModel> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/c6fc4b67-38af-4401-a564-22eb103f591a'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ShopProductsModel.fromJson(data);
    } else {
      return ShopProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Product Api Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getProductApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      ListTile(
                                  title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                  subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                  ),
                                )
                                ,



                                Container(
                                  height: MediaQuery.of(context).size.height * .3,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot
                                          .data!.data![index].images!.length,
                                      itemBuilder: (context, position) {
                                        return Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Container(
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    .25,
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    .5,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .data![index]
                                                        .images![position]
                                                        .url
                                                        .toString()),fit: BoxFit.cover)),
                                          ),
                                        );
                                      }),
                                ),
                                Icon(snapshot.data!.data![index].inWishlist == false ? Icons.favorite:
                                Icons.favorite_outline
                                )
                          

                              ],
                            );
                          });
                    } else {
                      return Text("Loading...");
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
