import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

class TotalDisplay extends StatelessWidget {
  final Money total;
  final double widthFactor;
  final Function()? onTap;

  const TotalDisplay({
    Key? key,
    required this.total,
    this.widthFactor = 0.8,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
          widthFactor: widthFactor,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            margin: const EdgeInsetsDirectional.only(start: 10),
            padding: const EdgeInsets.all(10),
            child: Text(
              total.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}
