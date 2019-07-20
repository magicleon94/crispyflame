import 'package:crispy_flame/crispy_flame.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flutter/cupertino.dart';

class Background {
  BoxGame game;
  Paint bgPaint;
  ParallaxComponent parallaxComponent;
  Rect bgRect;

  Background(this.game) {
    parallaxComponent = ParallaxComponent();
    parallaxComponent.load(["background.jpg"]);
    game.add(parallaxComponent);
  }

  void render(Canvas canvas) {
    canvas.drawRect(bgRect, bgPaint);
    parallaxComponent.render(canvas);
  }

  void update(double t) {
    parallaxComponent.update(t);
  }

  void resize() {
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    bgPaint = Paint();
    bgPaint.color = Color(0xffffffff);
  }
}
