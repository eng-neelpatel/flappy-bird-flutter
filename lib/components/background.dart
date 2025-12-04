import 'package:flame/components.dart';
import '../flappy_bird_game.dart';

class Background extends PositionComponent with HasGameRef<FlappyBirdGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = gameRef.size;
    position = Vector2.zero();
  }
}
