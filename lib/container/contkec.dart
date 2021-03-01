import 'package:flutter/material.dart';

class ContKec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Kasus',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                        label:
                            Text('No', style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Kecamatan',
                            style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Positif',
                            style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Sembuh',
                            style: TextStyle(color: Colors.black))),
                    DataColumn(
                        label: Text('Meninggal',
                            style: TextStyle(color: Colors.black))),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Container(
                            width: 50,
                            child: Text(
                              '1',
                            ),
                          ),
                        ),
                        DataCell(Text(
                          'Cangkuang Kulon',
                        )),
                        DataCell(Text(
                          '120',
                        )),
                        DataCell(Text(
                          '50',
                        )),
                        DataCell(Text(
                          '50',
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '2',
                        )),
                        DataCell(Text(
                          'Cangkuang Wetan',
                        )),
                        DataCell(Text(
                          '150',
                        )),
                        DataCell(Text(
                          '80',
                        )),
                        DataCell(Text(
                          '50',
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
