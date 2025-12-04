import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'components/bird.dart';
import 'components/pipe.dart';
import 'components/background.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  int score = 0;
  bool isGameStarted = false;
  bool isGameOver = false;
  Timer? pipeSpawnTimer;
  double pipeSpawnInterval = 2.0;

  @override
  Color backgroundColor() => const Color(0xFF4EC0CA);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add background
    background = Background();
    add(background);

    // Add bird
    bird = Bird();
    add(bird);
  }

  void startGame() {
    if (!isGameStarted) {
      isGameStarted = true;
      isGameOver = false;
      overlays.remove('mainMenu');
      
      // Start spawning pipes
      pipeSpawnTimer = Timer.periodic(
        Duration(milliseconds: (pipeSpawnInterval * 1000).toInt()),
        (timer) {
          if (!isGameOver) {
            spawnPipe();
          }
        },
      );
    }
  }

  void spawnPipe() {
    final pipe = Pipe();
    add(pipe);
  }

  @override
  void onTap() {
    if (isGameStarted && !isGameOver) {
      bird.flap();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isGameOver) {
      return;
    }

    // Check if bird hits ground or goes too high
    if (bird.position.y >= size.y || bird.position.y <= 0) {
      gameOver();
    }
  }

  void incrementScore() {
    score++;
  }

  void gameOver() {
    if (!isGameOver) {
      isGameOver = true;
      pipeSpawnTimer?.cancel();
      overlays.add('gameOver');
      pauseEngine();
    }
  }

  void reset() {
    score = 0;
    isGameStarted = false;
    isGameOver = false;
    
    // Remove all pipes
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
    
    // Reset bird
    bird.reset();
    
    // Remove overlay and restart
    overlays.remove('gameOver');
    resumeEngine();
    overlays.add('mainMenu');
  }
}
