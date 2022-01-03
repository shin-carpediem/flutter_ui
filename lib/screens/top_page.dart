import 'package:flutter/material.dart';
import 'package:flutter_ui/screens/post_screen.dart';
import 'package:flutter_ui/widgets/header_widget.dart';
import 'package:flutter_ui/widgets/heros_widget.dart';
import 'package:flutter_ui/widgets/featured_widget.dart';
import 'package:flutter_ui/screens/courses_screen.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  TopPageState createState() => TopPageState();
}

class TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    final tween = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.0, 0.0),
    );

    _animation1 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeInOutBack),
    ));
    _animation2 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.1, 0.8, curve: Curves.easeInOutBack),
    ));
    _animation3 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.9, curve: Curves.easeInOutBack),
    ));
    _animation4 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeInOutBack),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SlideTransition(
                  position: _animation1,
                  child: const Header(title: 'Learn Diligently'),
                ),
                SlideTransition(
                  position: _animation2,
                  child: Heros(),
                ),
                SlideTransition(
                  position: _animation3,
                  child: Featured(),
                ),
                SlideTransition(
                  position: _animation4,
                  child: const PostScreen("Courses List"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward().then((_) async {
            await Navigator.of(context)
                .push(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const CoursesPage()),
                )
                .then((_) => _controller.reverse());
          });
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
