import 'package:flutter/material.dart';
import 'package:layanan/models/kd3_model.dart';
import 'package:layanan/models/kd4_model.dart';
import 'package:layanan/services/kd3_service.dart';
import 'package:layanan/services/kd4_service.dart';

const whiteColor = Colors.white; // Define whiteColor

class NilaiPage extends StatelessWidget {
  const NilaiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nilai Harian'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'KI-3 Pengetahuan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'KI-4 Keterampilan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Kd3Model>>(
              future: Kd3Service().getKd3s(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  List<Kd3Model> data = snapshot.data!;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 30.0, // Set spacing between columns
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
                                  'Mapel',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Ph',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nilai',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Feedback',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                            rows: data
                                .map(
                                  (item) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                          Text(item.siswaModel?.nama ?? 'N/A')),
                                      DataCell(
                                          Text(item.siswaModel?.nisn ?? 'N/A')),
                                      DataCell(
                                          Text(item.mapelModel?.nama ?? 'N/A')),
                                      DataCell(Text(
                                          item.nilaikd3Model?.ph.toString() ??
                                              'N/A')),
                                      DataCell(Text(item.remedial != null
                                          ? item.remedial!
                                          : (item.nilai != null
                                              ? item.nilai!
                                              : '-'))),
                                      DataCell(Text(item.feedback ?? '-')),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<List<Kd4Model>>(
              future: Kd4Service().getKd4s(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  List<Kd4Model> data = snapshot.data!;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 30.0, // Set spacing between columns
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
                                  'Mapel',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Ph',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nilai',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Feedback',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                            rows: data
                                .map(
                                  (item) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                          Text(item.siswaModel?.nama ?? 'N/A')),
                                      DataCell(
                                          Text(item.siswaModel?.nisn ?? 'N/A')),
                                      DataCell(
                                          Text(item.mapelModel?.nama ?? 'N/A')),
                                      DataCell(Text(
                                          item.nilaikd4Model?.ph.toString() ??
                                              'N/A')),
                                      DataCell(Text(item.remedial != null
                                          ? item.remedial!
                                          : (item.nilai != null
                                              ? item.nilai!
                                              : '-'))),
                                      DataCell(Text(item.feedback ?? '-')),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
