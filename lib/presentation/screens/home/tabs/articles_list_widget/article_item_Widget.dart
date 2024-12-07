import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/core/utils/routes_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutesManager.details,
          arguments: article,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8.w), // Use responsive padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
          children: [
            Hero(
              tag: article.url?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
                  width: double.infinity,
                  height: 200.h, // Adjust height for consistent image sizing
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              article.source?.name ?? 'Unknown Source',
              style: GoogleFonts.poppins(
                color: ColorsManager.green,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              article.title ?? 'No Title Available',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Handle long titles gracefully
            ),
            SizedBox(height: 4.h),
            Text(
              article.publishedAt ?? 'Unknown Date',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
