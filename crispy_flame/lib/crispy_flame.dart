import 'dart:ui';

import 'package:crispy_flame/components/background.dart';
import 'package:flame/animation.dart';
import 'package:flame/flare_animation.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends BaseGame {
  Size screenSize;
  double dx = 0.0;
  Rect boxRect;
  FlareAnimation flareAnimation;
  bool loaded = false;
  Sprite spriteImage;
  Image image;
  Timer timer = Timer(2);
  Animation backgroundAnimation;
  Background background;

  BoxGame() {
    _start();
  }

  void _start() async {
    background = Background();
    add(background.parallaxComponent);

    flareAnimation =
        await FlareAnimation.load("assets/animations/Maialino.flr");
    flareAnimation.updateAnimation("Corsa");

    flareAnimation.x = 0;
    flareAnimation.y = 145;
    flareAnimation.width = 306;
    flareAnimation.height = 228;

    loaded = true;
  }

  @override
  bool debugMode() => true;

  void render(Canvas canvas) {
    if (loaded) {
      background.render(canvas);
      flareAnimation.render(canvas);
    }
  }

  void update(double t) {
    if (loaded) {
      background.update(t);
      flareAnimation.update(t);
      if (timer.isRunning()) {
        timer.update(t);
      }
      if (timer.isFinished()) {
        timer.stop();
        flareAnimation.updateAnimation("Corsa");
      }
    }
  }

  void resize(Size size) {
    screenSize = size;
    background?.resize(screenSize);
//    if (parallaxComponent.loaded()) {
//      parallaxComponent.resize(size);
//    }
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    if (!timer.isRunning()) {
      timer.start();
      flareAnimation.updateAnimation("Salto");
    }
//    if (d.globalPosition.dx > screenSize.width / 2) {
//      dx = 10.0;
//    } else {
//      dx = -10.0;
//    }
//    boxRect = boxRect.translate(dx, 0);
  }
}
