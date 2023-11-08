import 'package:flutter/material.dart';
import 'package:layanan/models/jadwal_mapel_model.dart';
import 'package:layanan/services/jadwal_mapel_service.dart';

const whiteColor = Colors.white; // Define whiteColor
// import yang diperlukan

class JadwalmapelPage extends StatelessWidget {
  const JadwalmapelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Mata Pelajaran '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: FutureBuilder<List<JadwalmapelModel>>(
              future: JadwalMapelService().getJadwalMapels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  List<JadwalmapelModel> data = snapshot.data!;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 30.0,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Hari',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Waktu',
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
                            'Guru',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: data
                          .map(
                            (item) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(item.hariModel?.nama ?? 'N/A')),
                                DataCell(Text(item.waktuModel?.range ?? 'N/A')),
                                DataCell(Text(item.mapelModel?.nama ?? 'N/A')),
                                DataCell(Text(item.guruModel?.nama ?? 'N/A')),
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
