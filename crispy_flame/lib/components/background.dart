import 'package:flame/components/component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flutter/cupertino.dart';

class Background extends Component {
  Paint _bgPaint;
  ParallaxComponent parallaxComponent = ParallaxComponent();
  Rect _bgRect;

  Background() {
    parallaxComponent.load(["background.jpg"]);
  }

  void render(Canvas canvas) {
    canvas.drawRect(_bgRect, _bgPaint);
    parallaxComponent.render(canvas);
  }

  void update(double t) {
    if (parallaxComponent.loaded()) {
      parallaxComponent.update(t);
    }
  }

  void resize(Size gameSize) {
    _bgRect = Rect.fromLTWH(0, 0, gameSize.width, gameSize.height);
    _bgPaint = Paint();
    _bgPaint.color = Color(0xffffffff);
  }

}
