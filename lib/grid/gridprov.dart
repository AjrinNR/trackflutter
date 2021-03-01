import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelapi/griddmodel.dart';
import 'package:flutter_application_1/controllerapi/griddcontroller.dart';

class GridProv extends StatelessWidget {
  final GetPost _getPost = new GetPost();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPost.manggilPostData(),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Row(
                            children: <Widget>[
                              _buildStatCard(
                                  'Meninggal',
                                  snapshot.data[index].meninggal,
                                  Colors.black45),
                              _buildStatCard(
                                  'Sembuh',
                                  snapshot.data[index].sembuh,
                                  Colors.teal[400]),
                              _buildStatCard(
                                  'Postif',
                                  snapshot.data[index].positif,
                                  Colors.blueAccent[100]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
        }
      },
    );
  }

  Expanded _buildStatCard(String title, String count, color) {
    return Expanded(
      child: Container(
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
                fontSize: 15.0,
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
