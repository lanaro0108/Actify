import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppBackground({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero, // padrão
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'lib/assets/images/tela_login.png',
            fit: BoxFit.cover,
          ),
        ),

        // overlay para contraste
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.45),
          ),
        ),

        Padding(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}
