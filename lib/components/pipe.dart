import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../flappy_bird_game.dart';

class Pipe extends PositionComponent with HasGameRef<FlappyBirdGame> {
  Pipe() : super(size: Vector2(60, 0));

  static final Random _random = Random();
  final double speed = 150;
  final double gap = 180;
  bool scored = false;

  late double topPipeHeight;
  late RectangleComponent topPipe;
  late RectangleComponent bottomPipe;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Random height for top pipe
    topPipeHeight = _random.nextDouble() * (gameRef.size.y * 0.4) + 50;
    
    position.x = gameRef.size.x;
    
    // Top pipe
    topPipe = RectangleComponent(
      size: Vector2(size.x, topPipeHeight),
      paint: Paint()..color = Colors.green[700]!,
    );
    topPipe.add(RectangleHitbox());
    add(topPipe);

    // Bottom pipe
    final bottomPipeY = topPipeHeight + gap;
    final bottomPipeHeight = gameRef.size.y - bottomPipeY;
    bottomPipe = RectangleComponent(
      position: Vector2(0, bottomPipeY),
      size: Vector2(size.x, bottomPipeHeight),
      paint: Paint()..color = Colors.green[700]!,
    );
    bottomPipe.add(RectangleHitbox());
    add(bottomPipe);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.isGameStarted && !gameRef.isGameOver) {
      position.x -= speed * dt;

      // Check if bird passed the pipe
      if (!scored && position.x + size.x < gameRef.bird.position.x) {
        scored = true;
        gameRef.incrementScore();
      }

      // Remove pipe when off screen
      if (position.x + size.x < 0) {
        removeFromParent();
      }
    }
  }
}
