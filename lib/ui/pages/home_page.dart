import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/home_service_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      // bottom navigation start //
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_flash.png',
                  width: 20,
                  color: blueColor,
                ),
                label: 'Overview'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_flash.png',
                  width: 20,
                ),
                label: 'Overview'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_flash.png',
                  width: 20,
                ),
                label: 'Overview'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_flash.png',
                  width: 20,
                ),
                label: 'Overview'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottom navigation end //

      // start content //

      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(),
          buildWalletCard(),
          layanan(),
        ],
      ),
    );
  }
  // end content

  // bagian profile  Start//
  Widget buildProfile() {
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
              Text(
                'Surya Sahputra',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Surya',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/img_profile.png'),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 16,
                height: 16,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: whiteColor),
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
        ],
      ),
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
          Text(
            'Surya',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 1235',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'balence',
            style: whiteTextStyle,
          ),
          Text(
            'Contoh',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }
  // bagian card  end//

  // bagian layanan //

  Widget layanan() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Layanan',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_flash.png',
                title: 'Top up',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_flash.png',
                title: 'Top up',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_flash.png',
                title: 'Top up',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_flash.png',
                title: 'Top up',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
  // bagian layanan end //
}
