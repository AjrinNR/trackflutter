import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:flutter_application_1/controllerapi/provcontroller.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/modelapi/provmodel.dart';

class TableIndonesia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Provinsi _getProvinsi = new Provinsi();
    TextStyle headerTextStyle = TextStyle(color: Colors.white, fontSize: 18);
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _getProvinsi.getDataProvinsi(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CovidProvinsi>> snapshot) {
          if (snapshot.hasData) {
            List<CovidProvinsi> dataIndo = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Provinsi',
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              columns: [
                                DataColumn(
                                    label: Text(
                                  'Provinsi',
                                  style: headerTextStyle,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Positif',
                                  style: headerTextStyle,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Sembuh',
                                  style: headerTextStyle,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Meninggal',
                                  style: headerTextStyle,
                                )),
                              ],
                              rows: dataIndo
                                  .map((CovidProvinsi dataIndo) =>
                                      DataRow(cells: [
                                        DataCell(Text(dataIndo.provinsi)),
                                        DataCell(
                                            Text(dataIndo.positif.toString())),
                                        DataCell(
                                            Text(dataIndo.sembuh.toString())),
                                        DataCell(Text(
                                            dataIndo.meninggal.toString())),
                                      ]))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
