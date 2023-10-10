import 'package:flutter/material.dart';

class ReshuffleCardsButton extends StatelessWidget {
  final void Function()? onPressed;
  const ReshuffleCardsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.amber, width: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          onPressed: onPressed,
          child: const Text(
            "Embaralhar",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
