import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/flame.dart';
import 'package:flame/flare_animation.dart';
import 'package:flame/game.dart';
import 'package:flame/position.dart';
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

  BoxGame() {
    _start();
  }

  void _start() async {
    image = await Flame.images.load('citybackground.png');

    flareAnimation =
        await FlareAnimation.load("assets/animations/Maialino.flr");
    flareAnimation.updateAnimation("Corsa");

    flareAnimation.x = 0;
    flareAnimation.y = 145;

    flareAnimation.width = 306;
    flareAnimation.height = 228;

    const int frames = 10;
    backgroundAnimation = Animation.sequenced(
      "citybackground.png",
      frames,
      textureWidth: 100,
      textureHeight: 500,
    );
    loaded = true;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffffffff);
    canvas.drawRect(bgRect, bgPaint);

    //canvas.drawImage(image, Offset.zero, bgPaint);

//    spriteImage = Sprite("citybackground.png", width: 400, height: 500);
//    spriteImage.render(canvas);

    if (loaded) {
      backgroundAnimation.getSprite().renderPosition(canvas, Position(0, 0));
      flareAnimation.render(canvas);
    }
  }

  void update(double t) {
    if (loaded) {
      flareAnimation.update(t);
    }
    if (timer.isFinished()) {
      flareAnimation.updateAnimation("Corsa");
    }
  }

  void resize(Size size) {
    screenSize = size;
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
