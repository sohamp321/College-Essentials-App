import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _height = 50.0;

  void _animateContainer() {
    setState(() {
      if (_height == 50.0) {
        _height = 150.0;
      } else {
        _height = 50.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _animateContainer,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width * 0.75,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.blue,
                border: Border.all(width: 1.0,
                color: Colors.white.withOpacity(0.7),
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
          GestureDetector(
            onTap: _animateContainer,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width * 0.75,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(width: 1.0,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
          GestureDetector(
            onTap: _animateContainer,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width * 0.75,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(width: 1.0,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
          GestureDetector(
            onTap: _animateContainer,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width * 0.75,
              height: _height,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  border: Border.all(width: 1.0,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
