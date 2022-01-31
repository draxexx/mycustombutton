import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyCustomButton({
    required this.onPressed,
    required this.text,
    this.isLoadingIndicatorDisplayed = false,
    this.hasPostIcon = false,
    this.postIcon,
    this.isActive = true,
    this.isBordered = false,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius = 8,
    this.borderColor = Colors.red,
  });

  final String text;
  final VoidCallback onPressed;
  final bool hasPostIcon, isActive, isLoadingIndicatorDisplayed, isBordered;
  final IconData? postIcon;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive
          ? isLoadingIndicatorDisplayed
              ? () {}
              : onPressed
          : () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            width: isBordered ? 1 : 0,
            color: isBordered ? borderColor : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          color: isActive ? bgColor : Colors.grey,
        ),
        child: isLoadingIndicatorDisplayed
            ? const CircularProgressIndicator()
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text),
                    hasPostIcon
                        ? Row(
                            children: [
                              const SizedBox(width: 8),
                              Icon(
                                postIcon,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
      ),
    );
  }
}
