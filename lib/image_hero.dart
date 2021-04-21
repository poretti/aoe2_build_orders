import 'package:flutter/material.dart';

class BuildOrderHero extends StatelessWidget {
  final String id;
  final String photo;

  /// `id` is only required for `Hero` uniqueness. That way the same
  /// photo can be reused.
  ///
  /// `photo` aka filepath - presumably something like 'assets/castle.png'
  const BuildOrderHero({required this.id, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: id + photo, child: Image.asset(photo));
  }
}