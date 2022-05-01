import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_guide/core/app_colors.dart';

class DetailTitle extends StatelessWidget {
  final String name;

  const DetailTitle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 375,
      left: 16,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkRed,
          borderRadius: BorderRadius.circular(3),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.marvel(
                    textStyle: Theme.of(context).textTheme.bodyMedium)
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
