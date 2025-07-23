import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tally_clone/widgets/app_bar_custom.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  final List<String> imagePaths = [
    'assets/track_1.jpg',
    'assets/track_2.jpg',
    'assets/track.jpg',
    'assets/cars.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('Gallery'),
        appBar: AppBar(),
        widgets: const [],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/track_1.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Revelation25",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'f1',
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemRed),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 0.5,
                      childAspectRatio: 1.9,
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      double scale = 1.0 - (_scrollOffset / 1000).clamp(0, 0.3);
                      bool isHovered = false;
                      return StatefulBuilder(builder: ((context, setState) {
                        return MouseRegion(
                            onEnter: (_) => setState(() => isHovered = true),
                            onExit: (_) => setState(() => isHovered = false),
                            child: AnimatedScale(
                              curve: Curves.easeInOut,
                              scale: isHovered ? 1.07 * scale : scale,
                              duration: const Duration(milliseconds: 500),
                              child: AnimatedPadding(
                                padding: EdgeInsets.all(isHovered ? 20 : 12),
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48),
                                    child: Image.asset(
                                      imagePaths[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      }));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
