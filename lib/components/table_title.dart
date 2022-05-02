import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  final String title;
  final bool hasButton;
  final VoidCallback? buttonCallback;

  const TableTitle({
      Key? key,
      required this.title,
      this.hasButton = false,
      this.buttonCallback
    }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
        child: Row(children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          hasButton
            ? IconButton(
                onPressed: buttonCallback, 
                icon: const Icon(Icons.add_circle_outline, color: Colors.red),
              )
            : const SizedBox(),
        ],)
      );
}
