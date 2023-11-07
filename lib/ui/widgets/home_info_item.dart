import 'package:flutter/material.dart';
import 'package:layanan/models/info_model.dart';
import 'package:layanan/shared/shared_values.dart';
import 'package:layanan/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeItemInfo extends StatelessWidget {
 
  final InfoModel info;

  const HomeItemInfo({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // ignore: deprecated_member_use
        if (await canLaunch(info.link.toString())) {
          // ignore: deprecated_member_use
          launch(info.link.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 155,
          height: 176,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  '$baseUrl/admin-images/${info.image.toString()}',
                  width: 155,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  info.nama.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
