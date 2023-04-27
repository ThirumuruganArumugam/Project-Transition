import 'package:flutter/material.dart';

// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faded"),
        backgroundColor: Colors.blueGrey[500],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 400.0,
              height: 300.0,
              child: FadeTransition(
                  opacity: _animation,
                  child: Image.network(
                      "https://th.bing.com/th/id/OIP.CsZPKXftmPWRE_J82XYShAHaEK?w=299&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7")),
            ),
          ),
        ],
      ),
    );
  }
}