import 'package:flutter/material.dart';
import 'package:layanan/models/absensi_data_model.dart';
import 'package:layanan/services/absensi_data_service.dart';

const whiteColor = Colors.white; // Define whiteColor
// import yang diperlukan

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekap Absensi '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: FutureBuilder<List<AbsensiDataModel>>(
              future: AbsensiDataService().getAbsensidatas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No Data'));
                } else {
                  List<AbsensiDataModel> data = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 30.0,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Nama',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'NISN',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Alfa',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Sakit',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Izin',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: data
                          .map(
                            (item) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(item.siswaModel?.nama ?? 'N/A')),
                                DataCell(Text(item.siswaModel?.nisn ?? 'N/A')),
                                DataCell(Text(item.alfa?.toString() ?? 'N/A')),
                                DataCell(Text(item.sakit?.toString() ?? 'N/A')),
                                DataCell(Text(item.izin?.toString() ?? 'N/A')),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
