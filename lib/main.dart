import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:tally_clone/pages/about.dart';
import 'package:tally_clone/pages/events.dart';
import 'package:tally_clone/pages/gallery.dart';
import 'package:tally_clone/pages/sponsors.dart';
import 'package:tally_clone/widgets/app_bar_custom.dart';
// import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:tally_clone/widgets/hover_widget_builder.dart';

void main() {
  runApp(const Revelation());
}

class Revelation extends StatefulWidget {
  const Revelation({Key? key}) : super(key: key);

  @override
  State<Revelation> createState() => _RevelationState();
}

class _RevelationState extends State<Revelation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revelation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/events': (context) => const Events(),
        '/sponsors': (context) => const SponsorsPage(),
        '/about': (context) => const About(),
        '/gallery': (context) => const Gallery(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _fadeController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _fadeAnimation;

  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _featureKeys = List.generate(6, (index) => GlobalKey());
  final List<AnimationController> _featureControllers = [];
  final List<Animation<double>> _featureAnimations = [];

  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _floatingAnimation = Tween<double>(
      begin: -15,
      end: 15,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    for (int i = 0; i < 6; i++) {
      final controller = AnimationController(
        duration: Duration(milliseconds: 800 + (i * 200)),
        vsync: this,
      );
      _featureControllers.add(controller);

      final animation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ));
      _featureAnimations.add(animation);
    }

    _fadeController.forward();

    // Add scroll listener for scroll-triggered animations
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });

    // Check visibility of feature cards and animate them
    for (int i = 0; i < _featureKeys.length; i++) {
      final key = _featureKeys[i];
      final context = key.currentContext;

      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final screenHeight = MediaQuery.of(context).size.height;

          // Trigger animation when card is 70% visible
          if (position.dy < screenHeight * 0.7 &&
              position.dy > -box.size.height * 0.3) {
            if (!_featureControllers[i].isAnimating &&
                _featureControllers[i].value == 0) {
              _featureControllers[i].forward();
            }
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fadeController.dispose();
    _scrollController.dispose();
    for (var controller in _featureControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          title: const Text("Revelation25'"),
          appBar: AppBar(),
          widgets: const []),
      backgroundColor: const Color.fromARGB(255, 240, 247, 255),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/track_1.jpg"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildHeroSection(),
                  _buildFeaturesSection(),
                  _buildCustomizationSection(),
                  _buildCTASection(),
                  _buildFooter(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimerSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.hardLight,
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(217, 255, 24, 63),
                Color.fromARGB(228, 28, 150, 250)
              ]),
          borderRadius: BorderRadius.circular(12)),
      child: TimerCountdown(
        format: CountDownTimerFormat.daysHoursMinutesSeconds,
        endTime: DateTime.utc(2025, 8, 8),
        onEnd: () {
          const Text("Let the Race to Glory Begin !");
        },
        timeTextStyle: const TextStyle(
            fontFamily: 'f1',
            color: Color.fromARGB(255, 223, 243, 255),
            fontSize: 32,
            shadows: [
              Shadow(
                color: Color.fromARGB(220, 120, 255, 255),
                blurRadius: 20,
              ),
              Shadow(
                color: Color.fromARGB(220, 120, 255, 255),
                blurRadius: 40,
              ),
            ]),
        colonsTextStyle: const TextStyle(
            fontFamily: 'f1',
            color: Color.fromARGB(255, 223, 243, 255),
            fontSize: 24),
        descriptionTextStyle: const TextStyle(
            fontFamily: 'f1',
            color: Color.fromARGB(255, 223, 243, 255),
            fontSize: 12),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(height: 50),
          AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.1,
                        ),
                        children: [
                          TextSpan(
                            text: 'R',
                            style: TextStyle(
                              color: const Color.fromRGBO(210, 28, 28, 1),
                              fontFamily: 'f1',
                              shadows: [
                                Shadow(
                                  color: CupertinoColors.destructiveRed
                                      .withOpacity(0.8),
                                  blurRadius: 20,
                                ),
                                Shadow(
                                  color:
                                      const Color.fromARGB(255, 223, 243, 255)
                                          .withOpacity(0.6),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: 'evelation',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 223, 243, 255),
                              fontFamily: 'f1',
                              shadows: [
                                Shadow(
                                  color:
                                      const Color.fromARGB(255, 228, 244, 255)
                                          .withOpacity(0.8),
                                  blurRadius: 20,
                                ),
                                Shadow(
                                  color:
                                      const Color.fromARGB(255, 223, 243, 255)
                                          .withOpacity(0.6),
                                  blurRadius: 40,
                                ),
                              ],
                            ),
                          ),
                          TextSpan(
                            text: '2025',
                            style: TextStyle(
                                fontFamily: 'f1',
                                color: const Color.fromRGBO(210, 28, 28, 1),
                                background: Paint()
                                  ..color =
                                      const Color.fromARGB(255, 226, 132, 103)
                                  ..strokeWidth = 20
                                  ..style = PaintingStyle.stroke,
                                shadows: [
                                  Shadow(
                                    color:
                                        const Color.fromARGB(255, 255, 110, 48)
                                            .withOpacity(0.8),
                                    blurRadius: 20,
                                  ),
                                  Shadow(
                                    color:
                                        const Color.fromARGB(255, 223, 243, 255)
                                            .withOpacity(0.6),
                                    blurRadius: 40,
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Feel the Vibe of Chennai\'s biggest cultural\'s noice.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 246, 246),
                        height: 2,
                        fontFamily: 'inter',
                      ),
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      minSize: 100,
                      pressedOpacity: 0.39,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: CupertinoColors.destructiveRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Register Now !',
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildTimerSection(),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 80),
          _buildFloatingElements(),
        ],
      ),
    );
  }

  Widget _buildFloatingElements() {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Positioned(
                left: 100,
                top: 50 + _floatingAnimation.value,
                child: Transform.rotate(
                  angle: math.sin(_scrollOffset * 0.5) * 0.1,
                  child: _buildFloatingCard('😊', Colors.blue.shade50),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Positioned(
                right: 120,
                top: 80 - _floatingAnimation.value,
                child: Transform.rotate(
                  angle: math.cos(_scrollOffset * 0.05) * 0.05,
                  child: _buildFloatingCard('🎉', Colors.pink.shade50),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Positioned(
                left: 300,
                top: 200 + _floatingAnimation.value * 0.5,
                child: Transform.rotate(
                  angle: math.sin(_scrollOffset * 0.012) * 0.15,
                  child: _buildFloatingCard('✨', Colors.purple.shade50),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Positioned(
                right: 80,
                top: 250 - _floatingAnimation.value * 0.8,
                child: Transform.rotate(
                  angle: math.cos(_scrollOffset * 0.015) * 0.12,
                  child: _buildFloatingCard('🚀', Colors.green.shade50),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingCard(String emoji, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 32, fontFamily: 'Inter'),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
        padding: const EdgeInsets.all(40),
        color: Colors.grey.shade50,
        child: Stack(children: [
          Positioned.fill(
            child: Image.asset('assets/track_2.jpg', fit: BoxFit.cover),
          ),
          Column(
            children: [
              const Text(
                'A Cultural Extravaganza like no other',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'DB Revelation\'s 9th Edition like no other',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),
              _buildFeatureGrid(),
            ],
          ),
        ]));
  }

  Widget _buildFeatureGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
        childAspectRatio: 1.2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        final features = [
          {
            'emoji': '💡',
            'title': 'Just start innovating',
            'description': 'Bring in what\'s new to the table',
            'color': Colors.blue.shade50,
          },
          {
            'emoji': '🔐',
            'title': 'Trust',
            'description':
                'Our judges are unparalleled to provoke the best out of yourself',
            'color': Colors.green.shade50,
          },
          {
            'emoji': '🆓',
            'title': 'No Entry',
            'description':
                'You will not leave empty handed - There is always something for you !',
            'color': Colors.cyan.shade50,
          },
          {
            'emoji': '⚡',
            'title': 'Learn and Grow',
            'description': 'Make Friends, Learn from others, Work on yourself',
            'color': Colors.red.shade50,
          },
          {
            'emoji': '🎨',
            'title': 'First F1 theme based Culturals of Chennai',
            'description':
                'We heard all the F1 Tifosi, so we made this right for you ',
            'color': Colors.deepOrange.shade50,
          },
          {
            'emoji': '🔗',
            'title': 'Network',
            'description': 'Learn and Grow',
            'color': Colors.amber.shade50,
          },
        ];

        return AnimatedBuilder(
          animation: _featureAnimations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - _featureAnimations[index].value)),
              child: Transform.scale(
                scale: 0.8 + (0.2 * _featureAnimations[index].value),
                child: Opacity(
                  opacity: _featureAnimations[index].value,
                  child: HoverBuilder(
                    builder: (isHovered) {
                      return _buildFeatureCard(
                        key: _featureKeys[index],
                        features[index]['emoji'] as String,
                        features[index]['title'] as String,
                        features[index]['description'] as String,
                        features[index]['color'] as Color,
                        index,
                        isHovered,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFeatureCard(String emoji, String title, String description,
      Color bgColor, int index, bool isHovered,
      {Key? key}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        key: key,
        duration: const Duration(milliseconds: 185),
        padding: EdgeInsets.all(isHovered ? 40 : 30),
        transform: Matrix4.identity()..scale(isHovered ? 1.04 : 1.0),
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHovered ? bgColor.withOpacity(0.9) : bgColor,
          borderRadius: BorderRadius.circular(isHovered ? 90 : 30),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.black.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: isHovered ? 30 : 20,
              offset: Offset(0, isHovered ? 15 : 10),
            ),
            // Blurry highlight effect around pointer
            if (isHovered)
              BoxShadow(
                color: Colors.white.withOpacity(0.98),
                blurRadius: 30,
                spreadRadius: 10,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _featureAnimations[index],
              builder: (context, child) {
                return Transform.rotate(
                  angle: math.pi * 0.1 * _featureAnimations[index].value,
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 48),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomizationSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: 'Make Memories ',
                    style: TextStyle(color: Colors.white, shadows: [
                      Shadow(
                        color: const Color.fromARGB(255, 79, 243, 255)
                            .withOpacity(0.8),
                        blurRadius: 20,
                      ),
                      Shadow(
                        color: const Color.fromARGB(255, 223, 243, 255)
                            .withOpacity(0.6),
                        blurRadius: 40,
                      ),
                    ])),
                TextSpan(
                  text: 'uniquely yours',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(255, 255, 178, 69)
                            .withOpacity(0.8),
                        blurRadius: 20,
                      ),
                      Shadow(
                        color: const Color.fromARGB(255, 223, 243, 255)
                            .withOpacity(0.6),
                        blurRadius: 40,
                      ),
                    ],
                    color: Colors.white,
                    background: Paint()
                      ..color = Colors.yellow.shade200
                      ..strokeWidth = 15
                      ..style = PaintingStyle.stroke,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20),
          const SizedBox(height: 60),
          _buildCustomizationDemo(),
        ],
      ),
    );
  }

  Widget _buildCustomizationDemo() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          '🎨 Revelation25\' Placeholder for Event Updates',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildCTASection() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.black,
      child: Column(
        children: [
          const Text(
            'Winning on the go !',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Rev25\'',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Make the First Move !',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey.shade900,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'REVELATION',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2025 Revelation',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
