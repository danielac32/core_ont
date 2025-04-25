import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomButtonWidgetRegister extends StatelessWidget {
  final String text;
  final Callback onPress;

  const CustomButtonWidgetRegister({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 150, // <-- match_parent
      height: 40,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            shadowColor: colors.secondary//Colors.blue.withOpacity(0.5),
        ),
        child:  Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}