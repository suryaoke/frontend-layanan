import 'package:flutter/material.dart';

import 'package:layanan/models/tugas_kd3_model.dart';
import 'package:layanan/models/tugas_kd4_model.dart';
import 'package:layanan/services/tugas_kd4_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:layanan/services/tugas_kd3_service.dart';
import 'package:layanan/shared/shared_values.dart';

const whiteColor = Colors.white; // Define whiteColor
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class TugasPage extends StatelessWidget {
  const TugasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Harian'),
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
            FutureBuilder<List<TugasKd3Model>>(
              future: TugasKd3Service().getTugasKd3s(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  List<TugasKd3Model> data = snapshot.data!;

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
                                  'Batas Waktu',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Ket Tugas',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Materi',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tugas',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tugas Upload',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                            rows: data
                                .map(
                                  (item) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                          Text(item.mapelModel?.nama ?? 'N/A')),
                                      DataCell(Text(
                                          item.nilaikd3Model?.ph.toString() ??
                                              'N/A')),
                                      DataCell(Text(item.last ?? 'N/A')),
                                      DataCell(Text(item.ket ?? 'N/A')),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.materi != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.materi}');
                                            }
                                          },
                                          child: item.materi != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Container(), // Jika tugasupload adalah null, tampilkan kontainer kosong
                                        ),
                                      ),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.tugas != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.tugas}');
                                            }
                                          },
                                          child: item.tugas != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Container(), // Jika tugasupload adalah null, tampilkan kontainer kosong
                                        ),
                                      ),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.tugasupload != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.tugasupload}');
                                            }
                                          },
                                          child: item.tugasupload != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Text('Belum Dikirim'),
                                        ),
                                      ),
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
            FutureBuilder<List<TugasKd4Model>>(
              future: TugasKd4Service().getTugasKd4s(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data'));
                } else {
                  List<TugasKd4Model> data = snapshot.data!;

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
                                  'Batas Waktu',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Ket Tugas',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Materi',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tugas',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Tugas Upload',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                            rows: data
                                .map(
                                  (item) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                          Text(item.mapelModel?.nama ?? 'N/A')),
                                      DataCell(Text(
                                          item.nilaikd4Model?.ph.toString() ??
                                              'N/A')),
                                      DataCell(Text(item.last ?? 'N/A')),
                                      DataCell(Text(item.ket ?? 'N/A')),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.materi != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.materi}');
                                            }
                                          },
                                          child: item.materi != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Container(), // Jika tugasupload adalah null, tampilkan kontainer kosong
                                        ),
                                      ),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.tugas != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.tugas}');
                                            }
                                          },
                                          child: item.tugas != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Container(), // Jika tugasupload adalah null, tampilkan kontainer kosong
                                        ),
                                      ),
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            if (item.tugasupload != null) {
                                              _launchURL(
                                                  '$baseUrl/pdf/${item.tugasupload}');
                                            }
                                          },
                                          child: item.tugasupload != null
                                              ? const Icon(Icons
                                                  .picture_as_pdf) // Ganti dengan ikon yang sesuai
                                              : Text('Belum Dikirim'),
                                        ),
                                      ),
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
