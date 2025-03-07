import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const ButtonWidget({
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.lightBlue[300],
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : Text(
                    "CONTINUE",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
      ),
    );
  }
}
