import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layanan/blocs/absensi/absensi_bloc.dart';
import 'package:layanan/blocs/auth/auth_bloc.dart';
import 'package:layanan/blocs/info/info_bloc.dart';

import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/home_info_item.dart';
import 'package:layanan/ui/widgets/home_service_item.dart';
import 'package:layanan/ui/widgets/home_list_item.dart';
import 'package:layanan/shared/shared_values.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom navigation start //
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: blackColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/jadwal/all');
                },
                child: Image.asset(
                  'assets/fi_file-text.png',
                  width: 25,
                ),
              ),
              label: 'Jadwal Mapel',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/absensi/all');
                },
                child: Image.asset(
                  'assets/fi_user.png',
                  width: 25,
                ),
              ),
              label: 'Absensi',
            ),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/nilai/all');
                  },
                  child: Image.asset(
                    'assets/ic_flash.png',
                    width: 25,
                  ),
                ),
                label: 'Nilai Harian'),
          ],
        ),
      ),
      //button ditenganh
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: purpleColor,
      //   child: Image.asset(
      //     'assets/ic_plus_circle.png',
      //     width: 24,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // // bottom navigation end //
      //button ditengah

      // // start content //

      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildWalletCard(),
          akademik(context),
          absensi(),
          informasi(),
        ],
      ),
    );
  }
  // end content

  // bagian profile  Start//
  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profileImage == 'null' ||
                                state.user.profileImage == '0'
                            ? const AssetImage('assets/img_profile.png')
                            : NetworkImage(
                                '$baseUrl/admin-images/${state.user.profileImage}',
                              ) as ImageProvider,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: whiteColor),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  // bagian profil End //

  // bagian card //
  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/img_bg_card.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Profile Siswa ',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                  // Ubah ke string yang tepat, misalnya 'bold'
                ),
              ),
              const SizedBox(width: 8), // Jarak antara ikon dan teks
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white, // Ubah warna sesuai kebutuhan
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  'assets/fi_user.png', // Ubah dengan path gambar yang sesuai
                  width: 30, // Sesuaikan lebar gambar
                  height: 30, // Sesuaikan tinggi gambar
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          // NamaWidget(siswa: siswa),
          Text(
            'Nisn : 1235',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight
                  .normal, // Ubah ke string yang tepat, misalnya 'normal'
              letterSpacing: 4,
            ),
          ),
          Text(
            'Kelas : 1235',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight
                  .normal, // Ubah ke string yang tepat, misalnya 'normal'
              letterSpacing: 4,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
  // bagian card  end//

  // bagian layanan //
  Widget akademik(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akademik',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight
                  .w600, // Menyesuaikan dengan nilai FontWeight yang sesuai
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tugas/all');
                },
                child: const HomeServiceItem(
                  iconUrl: 'assets/fi_file-text.png',
                  title: 'Tugas',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/jadwal/all');
                },
                child: const HomeServiceItem(
                  iconUrl: 'assets/fi_file-text.png',
                  title: 'Jadwal Mapel',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/absensi/all');
                },
                child: const HomeServiceItem(
                  iconUrl: 'assets/fi_user.png',
                  title: 'Absensi',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/nilai/all');
                },
                child: const HomeServiceItem(
                  iconUrl: 'assets/ic_flash.png',
                  title: 'Nilai Harian',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // bagian layanan end //

  // bagian list //
  Widget absensi() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Absensi',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
              top: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: BlocProvider(
              create: (context) => AbsensiBloc()..add(AbsensiGet()),
              child: BlocBuilder<AbsensiBloc, AbsensiState>(
                builder: (context, state) {
                  if (state is AbsensiSuccess) {
                    return Column(
                      children: state.absensi.map((absensi) {
                        return HomeList(absensi: absensi);
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  // bagian list end//

  // bagian Informasi//
  Widget informasi() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => InfoBloc()..add(InfoGet()),
            child: BlocBuilder<InfoBloc, InfoState>(
              builder: (context, state) {
                if (state is InfoSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.info.map((info) {
                        return HomeItemInfo(info: info);
                      }).toList(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

// bagian info //
}
