import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'flappy_bird_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Bird',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late FlappyBirdGame game;

  @override
  void initState() {
    super.initState();
    game = FlappyBirdGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: {
          'gameOver': (context, game) => GameOverOverlay(
                game: game as FlappyBirdGame,
                onRestart: () {
                  game.reset();
                },
              ),
          'mainMenu': (context, game) => MainMenuOverlay(
                onStart: () {
                  (game as FlappyBirdGame).startGame();
                },
              ),
        },
        initialActiveOverlays: const ['mainMenu'],
      ),
    );
  }
}

class GameOverOverlay extends StatelessWidget {
  final FlappyBirdGame game;
  final VoidCallback onRestart;

  const GameOverOverlay({
    super.key,
    required this.game,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Game Over!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Score: ${game.score}',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenuOverlay extends StatelessWidget {
  final VoidCallback onStart;

  const MainMenuOverlay({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Flappy Bird',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'Start Game',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
