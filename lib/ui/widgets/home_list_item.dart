import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:layanan/models/absensi_model.dart';
import 'package:layanan/shared/theme.dart';

class HomeList extends StatelessWidget {
  final AbsensiModel absensi;

  const HomeList({
    Key? key,
    required this.absensi,
  }) : super(key: key);
  String getKeterangan(String? status) {
    if (status == null) {
      return 'Tidak diketahui';
    }
    String keterangan;
    switch (int.tryParse(status) ?? -1) {
      case 0:
        keterangan = 'Alfa';
        break;
      case 1:
        keterangan = 'Hadir';
        break;
      case 2:
        keterangan = 'Izin';
        break;
      case 3:
        keterangan = 'Sakit';
        break;
      default:
        keterangan = '-';
    }
    return keterangan;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/img_profile.png',
            width: 25,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  absensi.siswaModel!.nama.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  'Status: ${getKeterangan(absensi.status.toString())}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Ket: ${(absensi.ket.toString())}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Mapel: ${(absensi.mapelModel!.nama.toString())}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateFormat('MMM dd yyyy').format(absensi.tanggal ?? DateTime.now()),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
