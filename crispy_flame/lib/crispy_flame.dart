import 'dart:ui';

import 'package:flame/flare_animation.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game {
  Size screenSize;
  double dx = 0.0;
  Rect boxRect;
  FlareAnimation flareAnimation;
  bool loaded = false;

  BoxGame() {
    _start();
  }

  void _start() async {
    flareAnimation =
        await FlareAnimation.load("assets/animations/Maialino.flr");
    flareAnimation.updateAnimation("Corsa");

    flareAnimation.x = 50;
    flareAnimation.y = 200;

    flareAnimation.width = 306;
    flareAnimation.height = 228;
    loaded = true;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffffffff);
    canvas.drawRect(bgRect, bgPaint);

    if (loaded) {
      flareAnimation.render(canvas);
    }
  }

  void update(double t) {
    if (loaded) {
      flareAnimation.update(t);
    }
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
//    if (d.globalPosition.dx > screenSize.width / 2) {
//      dx = 10.0;
//    } else {
//      dx = -10.0;
//    }
//    boxRect = boxRect.translate(dx, 0);
  }
}
