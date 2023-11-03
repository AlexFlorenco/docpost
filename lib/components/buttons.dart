import 'package:flutter/material.dart';

import 'constants.dart';

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({super.key, required this.label, required this.onPress});
//   final String label;
//   final VoidCallback onPress;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: TextButton(
//         onPressed: onPress,
//         style: TextButton.styleFrom(
//           backgroundColor: primaryColor,
//           foregroundColor: textColorWhite,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ),
//         child: Text(label),
//       ),
//     );
//   }
// }

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
          backgroundColor: primaryColor,
          foregroundColor: foregroundPrimaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key, required this.label, required this.onPress});
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          side: const BorderSide(color: primaryColor),
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
