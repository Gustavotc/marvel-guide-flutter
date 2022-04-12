import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final bool isLoading;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.isLoading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(Size(screenWidth * 0.9, 50)),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: isLoading
            ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
      ),
      onPressed: isLoading ? null : onPress,
    );
  }
}
