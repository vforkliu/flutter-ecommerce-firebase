import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    /// 当创建一个AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画
    /// 消耗不必要的资源。 通过将SingleTickerProviderStateMixin添加到类定义中，
    /// 可以将stateful对象作为vsync的值。
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    /// .forward()方法可以启动动画。数字的产生与屏幕刷新有关，因此每秒钟通常会产生60个数字
    _animationController.forward();
    // _animation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              /// 默认情况下，AnimationController对象的范围从0.0到1.0。如果您需要不同的范
              /// 围或不同的数据类型，则可以使用Tween来配置动画以生成不同的范围或数据类型的值
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeOut)),
              child: Image.asset('images/logo.png', height: 150),
            ),
            const SizedBox(
              height: 50,
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.linear)),
              child: const Text(
                'MY E-COMMERCE APP',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
          "Powered By Example Tech",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
