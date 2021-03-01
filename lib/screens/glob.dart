import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/controllerapi/globcontroller.dart';
import 'package:flutter_application_1/modelapi/globmodel.dart';

class TableGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = TextStyle(color: Colors.white, fontSize: 18);
    final Global _getGlobal = new Global();
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _getGlobal.getDataGlobal(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CovidGlob>> snapshot) {
          if (snapshot.hasData) {
            List<CovidGlob> dataGlob = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Negara',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Data Kasus',
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              columns: [
                                DataColumn(
                                    label:
                                        Text('Negara', style: headerTextStyle)),
                                DataColumn(
                                    label: Text('Positif',
                                        style: headerTextStyle)),
                                DataColumn(
                                    label:
                                        Text('Sembuh', style: headerTextStyle)),
                                DataColumn(
                                    label: Text('Meninggal',
                                        style: headerTextStyle)),
                              ],
                              rows: dataGlob
                                  .map(
                                    (CovidGlob dataGlob) => DataRow(
                                      cells: [
                                        DataCell(Text(dataGlob.country_region)),
                                        DataCell(
                                            Text(dataGlob.positif.toString())),
                                        DataCell(
                                            Text(dataGlob.sembuh.toString())),
                                        DataCell(Text(
                                            dataGlob.meninggal.toString())),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
}
