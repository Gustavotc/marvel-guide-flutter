import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final ValueListenable<bool> loading;

  const CustomProgressIndicator({Key? key, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loading,
      builder: (context, bool isLoading, _) {
        return (isLoading)
            ? const Positioned(
                bottom: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Container();
      },
    );
  }
}
