import 'package:flutter/material.dart';

class PageTransitions {
  static Route peaceRoute(Widget page) {
    return PageRouteBuilder(
      // Duração mais longa e fluida para transmitir calma
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        
        // Curva cúbica: gera um movimento desacelerado, suave e relaxante
        final peaceCurve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
          reverseCurve: Curves.easeInOutCubic,
        );

        // Deslocamento sutil: a tela sobe de leve (2%), sem movimentos bruscos
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.02),
          end: Offset.zero,
        ).animate(peaceCurve);

        // Esmaecimento suave
        return FadeTransition(
          opacity: peaceCurve,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
