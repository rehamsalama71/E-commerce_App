import 'package:ecommerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset('assets/6048383502703923491.mp4')
      ..setLooping(true) 
      ..initialize().then((_) {
      
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
        backgroundColor: Color(0xfffF8F5E8),
        body: Stack(children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background/6048383503160164663_121.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Positioned.fill(
            child: Column(
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Center(child: CircularProgressIndicator()),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Finally ..,\n Shopping Done successfully',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total Price : \$${provider.getTotalPrice()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]));
  }
}
