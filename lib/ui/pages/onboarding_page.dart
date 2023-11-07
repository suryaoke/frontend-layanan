import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/buttons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = ['SIAKAD \n MAN 1 Kota Padang', 'Selamat datang :)'];

  List<String> subtitles = [
    'Menuju Sistem Digital 2023.',
    'Silahkan Login',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: [
              Image.asset(
                'assets/img_layanan2.png',
                height: 331,
              ),
              Image.asset(
                'assets/img_mankotapadang.png',
                height: 331,
              ),
            ],
            options: CarouselOptions(
              height: 331,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: carouselController,
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 21,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  titles[currentIndex],
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  subtitles[currentIndex],
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: currentIndex == 1 ? 38 : 50,
                ),
                currentIndex == 1
                    ? Column(
                        children: [
                          // CustomFilledButton(
                          //   title: 'Get Started',
                          //   onPressed: () {
                          //     Navigator.pushNamedAndRemoveUntil(
                          //         context, '/sign-up', (route) => false);
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          CustomFilledButton(
                            title: 'Login',
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/sign-in', (route) => false);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == 0
                                  ? blueColor
                                  : lightBackgroundColor,
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == 1
                                  ? blueColor
                                  : lightBackgroundColor,
                            ),
                          ),
                          const Spacer(),
                          CustomFilledButton(
                            widht: 150,
                            title: 'Continue',
                            onPressed: () {
                              carouselController.nextPage();
                            },
                          ),
                        ],
                      )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
