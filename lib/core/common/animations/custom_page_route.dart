import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  CustomPageRoute({
    required this.page,
    super.settings,
  }) : super(
         transitionDuration: const Duration(milliseconds: 500),
         reverseTransitionDuration: const Duration(milliseconds: 400),
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final slideIn =
               Tween<Offset>(
                 begin: const Offset(0.06, 0),
                 end: Offset.zero,
               ).animate(
                 CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0, 1, curve: Curves.easeOutQuart),
                 ),
               );

           final fadeIn =
               Tween<double>(
                 begin: 0,
                 end: 1,
               ).animate(
                 CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0, 0.5, curve: Curves.easeOut),
                 ),
               );

           final scaleIn =
               Tween<double>(
                 begin: 0.97,
                 end: 1,
               ).animate(
                 CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0, 1, curve: Curves.easeOutQuart),
                 ),
               );

           final slideOut =
               Tween<Offset>(
                 begin: Offset.zero,
                 end: const Offset(-0.08, 0),
               ).animate(
                 CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: Curves.easeInQuart,
                 ),
               );

           final fadeOut =
               Tween<double>(
                 begin: 1,
                 end: 0.6,
               ).animate(
                 CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: Curves.easeInQuart,
                 ),
               );

           final scaleOut =
               Tween<double>(
                 begin: 1,
                 end: 0.96,
               ).animate(
                 CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: Curves.easeInQuart,
                 ),
               );

           return SlideTransition(
             position: slideOut,
             child: ScaleTransition(
               scale: scaleOut,
               child: FadeTransition(
                 opacity: fadeOut,
                 child: SlideTransition(
                   position: slideIn,
                   child: ScaleTransition(
                     scale: scaleIn,
                     child: FadeTransition(
                       opacity: fadeIn,
                       child: child,
                     ),
                   ),
                 ),
               ),
             ),
           );
         },
       );
  final Widget page;
}
