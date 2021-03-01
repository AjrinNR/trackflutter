import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/controllerapi/griddcontroller.dart';
import 'package:flutter_application_1/modelapi/griddmodel.dart';

class Indo extends StatefulWidget {
  // Indo({
  //   this.currentDose,
  //   this.currentDate,
  //   this.setValue,
  //   this.currentIndex,
  // });
  // final int currentDose;
  // final DateTime currentDate;
  // final void Function(int, DateTime, int) setValue;
  // final currentIndex;

  @override
  _IndoState createState() => new _IndoState();
}

class _IndoState extends State<Indo> {
  // int _dose;
  // DateTime _today;
  final GetPost _getPost = new GetPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _getPost.manggilPostData(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Total Kasus Indonesia',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            width: 800,
                            height: 830.5,
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      _buildStatCard(
                                          'Sembuh',
                                          snapshot.data[index].sembuh,
                                          Colors.teal[400]),
                                      _buildStatCard(
                                          'Postif',
                                          snapshot.data[index].positif,
                                          Colors.redAccent[400]),
                                      _buildStatCard(
                                          'Meninggal',
                                          snapshot.data[index].meninggal,
                                          Colors.brown[800]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].toList(),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, color) {
    return Expanded(
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
