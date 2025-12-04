import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../flappy_bird_game.dart';
import 'pipe.dart';

class Bird extends PositionComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  Bird() : super(size: Vector2(40, 30));

  double velocity = 0;
  final double gravity = 1000;
  final double jumpSpeed = -400;
  double initialY = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);
    initialY = position.y;
    
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.isGameStarted && !gameRef.isGameOver) {
      velocity += gravity * dt;
      position.y += velocity * dt;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );

    // Draw eye
    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.x * 0.7, size.y * 0.3),
      3,
      eyePaint,
    );

    // Draw beak
    final beakPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    final beakPath = Path()
      ..moveTo(size.x, size.y / 2)
      ..lineTo(size.x + 10, size.y / 2 - 5)
      ..lineTo(size.x + 10, size.y / 2 + 5)
      ..close();
    canvas.drawPath(beakPath, beakPaint);
  }

  void flap() {
    velocity = jumpSpeed;
  }

  void reset() {
    position.y = initialY;
    velocity = 0;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Pipe) {
      gameRef.gameOver();
    }
  }
}
