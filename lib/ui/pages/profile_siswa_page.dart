import 'package:flutter/material.dart';
import 'package:layanan/models/siswa_model.dart';
import 'package:layanan/services/siswa_service.dart';
import 'package:layanan/shared/shared_values.dart';


class ProfileSiswaPage extends StatelessWidget {
  const ProfileSiswaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<List<SiswaModel>>(
          future: SiswaService().getSiswas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data'));
            } else {
              List<SiswaModel> data = snapshot.data!;

              SiswaModel item =
                  data[0]; // Assuming you want to display the first item
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: item.userSiswaModel?.profileImage == 'null' ||
                                  item.userSiswaModel?.profileImage == '0'
                              ? const AssetImage('assets/img_profile.png')
                              : NetworkImage(
                                  '$baseUrl/admin-images/${item.userSiswaModel?.profileImage}',
                                ) as ImageProvider,
                        ),
                      ),
                    ),
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Nama : ${item.nama}')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Nisn : ${item.nisn}')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(
                                'Email : ${item.userSiswaModel?.email ?? '-'}')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(
                                'Terakhir Aktif : ${item.userSiswaModel?.last ?? '-'}')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
