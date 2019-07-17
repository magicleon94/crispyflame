import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/flame.dart';
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
  ParallaxComponent parallaxComponent;

  BoxGame() {
    _start();
  }

  void _start() async {
    image = await Flame.images.load('background.jpg');

    flareAnimation =
        await FlareAnimation.load("assets/animations/Maialino.flr");
    flareAnimation.updateAnimation("Corsa");

    flareAnimation.x = 0;
    flareAnimation.y = 145;

    flareAnimation.width = 306;
    flareAnimation.height = 228;

//    int frames = 1521 ~/ screenSize.width;
//    backgroundAnimation = Animation.sequenced(
//      "background.jpg",
//      frames,
//      textureWidth: screenSize.width,
//      textureHeight: screenSize.height,
//      stepTime: 0.5,
//    );

    parallaxComponent = ParallaxComponent()..load(["background.jpg"]);
    loaded = true;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffffffff);
    canvas.drawRect(bgRect, bgPaint);

//    var paint = Paint()..color = Color(0xffffffff);
//    var rect = Rect.fromLTWH(0.0, 0.0, double.infinity, screenSize.height);
//    canvas.drawImageRect(image, rect, rect, paint);

    if (loaded) {
//      parallaxComponent.render(canvas);
//      backgroundAnimation.getSprite().render(canvas);
//      backgroundAnimation.getSprite().renderPosition(canvas, Position(0, 0));
      flareAnimation.render(canvas);
    }
  }

  void update(double t) {
    if (loaded) {
      flareAnimation.update(t);
//      backgroundAnimation.update(t);
//      parallaxComponent.update(t);
    }
    if (timer.isFinished()) {
      flareAnimation.updateAnimation("Corsa");
    }
  }

  void resize(Size size) {
    screenSize = size;
//    parallaxComponent?.width = screenSize.width;
//    parallaxComponent?.height = screenSize.height;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    timer.start();
    flareAnimation.updateAnimation("Salto");
//    if (d.globalPosition.dx > screenSize.width / 2) {
//      dx = 10.0;
//    } else {
//      dx = -10.0;
//    }
//    boxRect = boxRect.translate(dx, 0);
  }
}
