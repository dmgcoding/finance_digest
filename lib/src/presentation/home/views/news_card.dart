import 'package:cached_network_image/cached_network_image.dart';
import 'package:finance_digest/core/const/colors.dart';
import 'package:finance_digest/core/utils/time.dart';
import 'package:finance_digest/core/utils/utils.dart';
import 'package:finance_digest/src/domain/models/market_news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.n,
    super.key,
  });

  final MarketNews n;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(n.url))) {
          showSnackbar(context, 'Could not launch ${n.url}');
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: n.image,
                placeholder: (context, url) => const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.image,
                    color: AppColors.white,
                    size: 60,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          n.source.toUpperCase(),
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          getFormattedDateFromTimestamp(n.datetime)
                              .toUpperCase(),
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Builder(builder: (context) {
                      var text = n.headline;
                      if (n.headline.length > 50) {
                        text = '${n.headline.substring(0, 50)}...';
                      }
                      return Text(
                        text,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      );
                    }),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
