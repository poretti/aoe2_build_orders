import 'package:flutter/material.dart';
import 'package:aoe_flash_cards/theme_data.dart';

class BouncyNextArrow extends StatefulWidget {
  @override
  _BouncyNextArrowState createState() => _BouncyNextArrowState();
}

class _BouncyNextArrowState extends State<BouncyNextArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.25, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SizedBox(
          height: 100,
          width: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.navigate_next_rounded,
              color: ColorsExt.polishedPine.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
