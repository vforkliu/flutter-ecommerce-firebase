import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  List<WelcomeSlider> slides = [
    WelcomeSlider(
        image: 'assets/images/splash_1.png',
        title: 'Welcome to Flutter',
        description: 'This is a description'),
    WelcomeSlider(
        image: 'assets/images/splash_2.png',
        title: 'Welcome to Flutter',
        description: 'This is a description'),
    WelcomeSlider(
        image: 'assets/images/splash_3.png',
        title: 'Welcome to Flutter',
        description: 'This is a description'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen()));
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (value) {
                              setState(() {
                                _currentPage = value;
                              });
                            },
                            itemCount: slides.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Image.asset(
                                    slides[index].image,
                                    height: 350,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(slides[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28)),
                                  const SizedBox(height: 5),
                                  Text(slides[index].description,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 94, 92, 92),
                                        fontSize: 20,
                                      )),
                                ],
                              );
                            }
                            )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          slides.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 10,
                                width: _currentPage == index ? 30 : 10,
                                decoration: BoxDecoration(
                                    color: _currentPage == index ? Colors.red : Colors.grey,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            );
                      }),
                    ),

                  ],
                )
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            if (_currentPage == slides.length - 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomeScreen()));
            } else {
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
            }
          },
          child: _currentPage != slides.length - 1 ? const Icon(Icons.arrow_forward) : const Icon(Icons.done),
        ),
      ),
    );
  }
}

class WelcomeSlider {
  final String image;
  final String title;
  final String description;
  WelcomeSlider(
      {required this.image, required this.title, required this.description});
}
