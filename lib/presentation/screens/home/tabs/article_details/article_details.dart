import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sun/core/utils/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../data/api/model/articles_response/article.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Article;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          article.title ?? '',
          style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.bgPattern),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: article.url ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 1),
                      spreadRadius: 1,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.content ?? '',
                        softWrap: true,
                        style: GoogleFonts.poppins(fontSize: 16.sp),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 20.w,
                              ),
                              elevation: 0,
                            ),
                            onPressed: () async {
                              await _launchUrl(article.url ?? '');
                            },
                            child: Text(
                              'View Full Article',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    await launchUrl(_url);
  }
}
