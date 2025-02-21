import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:photo_view/photo_view.dart';

class ZoomPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  ZoomPageRoute({
    required this.builder,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return ScaleTransition(
              scale: animation.drive(tween),
              child: child,
            );
          },
        );
}

class ImageMessageViewer extends StatefulWidget {
  final List<String> imageList;
  final int currentIndex;
  const ImageMessageViewer(
      {super.key, required this.imageList, required this.currentIndex});

  @override
  State<StatefulWidget> createState() => ImageMessageViewerState();
}

class ImageMessageViewerState extends State<ImageMessageViewer> {
  late SwiperController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = SwiperController();
    index = widget.currentIndex;
  }

  closeViewer() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: closeViewer,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: SafeArea(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      child: Swiper(
                    controller: controller,
                    itemCount: widget.imageList.length,
                    scale: 1,
                    index: index,
                    loop: false,
                    onIndexChanged: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return PhotoView(
                          imageProvider: Image.network(
                        widget.imageList[index],
                      ).image);
                    },
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
