import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/source_response/source.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({
    super.key,
    required this.source,
    required this.isSelected,
  });

  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 8),
      padding:  REdgeInsets.symmetric(vertical: 8 , horizontal:  12),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: ColorsManager.green,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: GoogleFonts.exo(
          color: isSelected ? ColorsManager.white : ColorsManager.green,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
