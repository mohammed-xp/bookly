import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errMessage,
    required this.onPressed,
  });

  final String errMessage;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errMessage,
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Refresh',
            backgroundColor: Colors.redAccent.withOpacity(0.5),
            textColor: Colors.white,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
