import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EdgeGlowNotificationPage extends StatefulWidget {
  const EdgeGlowNotificationPage({super.key});

  @override
  State<EdgeGlowNotificationPage> createState() =>
      _EdgeGlowNotificationPageState();
}

class _EdgeGlowNotificationPageState
    extends State<EdgeGlowNotificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool showGlow = false;
  bool showNotification = false;

  StreamPlatform currentPlatform = StreamPlatform.twitch;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Platform → Glow Color
  Color _platformGlowColor() {
    switch (currentPlatform) {
      case StreamPlatform.twitch:
        return const Color(0xFF9146FF); // Purple
      case StreamPlatform.kick:
        return const Color(0xFF00E701); // Green
      case StreamPlatform.youtube:
        return const Color(0xFFFF0000); // Red
    }
  }

  /// Trigger notification + glow
  Future<void> triggerNotification(StreamPlatform platform) async {
    setState(() {
      currentPlatform = platform;
      showGlow = true;
      showNotification = true;
    });

    _controller.repeat(reverse: true);

    await Future.delayed(const Duration(seconds: 2));

    _controller.stop();
    _controller.reset();

    if (mounted) {
      setState(() {
        showGlow = false;
        showNotification = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            /// MAIN CONTENT
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _demoButton("Twitch", StreamPlatform.twitch),
                  _demoButton("Kick", StreamPlatform.kick),
                  _demoButton("YouTube", StreamPlatform.youtube),
                ],
              ),
            ),

            /// NOTIFICATION CARD
            if (showNotification) Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 40.h),
              child: _notificationCard(),
            ),
        
            /// EDGE GLOW
            if (showGlow)
              IgnorePointer(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    return CustomPaint(
                      size: MediaQuery.of(context).size,
                      painter: EdgeGlowPainter(
                        animationValue: _controller.value,
                        glowColor: _platformGlowColor(),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _demoButton(String text, StreamPlatform platform) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        onPressed: () => triggerNotification(platform),
        child: Text(text),
      ),
    );
  }

  Widget _notificationCard() {
    final platformColor = _platformGlowColor();

    return Positioned(
      top: 120,
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              platformColor.withOpacity(0.35), // soft accent
              const Color(0xFF141414),          // deep charcoal
              const Color(0xFF0B0B0B),          // near-black
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
          border: Border.all(
            color: platformColor.withOpacity(0.35),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: platformColor.withOpacity(0.15),
              ),
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                _platformIcon(),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                "SuperFan sent you a message",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _platformIcon() {
    switch (currentPlatform) {
      case StreamPlatform.twitch:
        return 'assets/images/twitch.png';
      case StreamPlatform.kick:
        return 'assets/images/kick.png';
      case StreamPlatform.youtube:
        return 'assets/images/youtube.png';
    }
  }
}

/// PLATFORM ENUM
enum StreamPlatform { twitch, kick, youtube }

/// EDGE GLOW PAINTER (CONTINUOUS ANTI-CLOCKWISE)
class EdgeGlowPainter extends CustomPainter {
  final double animationValue; // 0.0 → 1.0
  final Color glowColor;

  EdgeGlowPainter({
    required this.animationValue,
    required this.glowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double glowWidth = 30;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path()
      ..addRect(rect);

    // Create a Paint with a shader along the perimeter
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = glowWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowWidth / 2)
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: 2 * 3.1415926,
        colors: [
          Colors.transparent,
          glowColor.withOpacity(0.7),
          glowColor.withOpacity(0.7),
          Colors.transparent,
        ],
        stops: [0.0, 0.1, 0.3, 1.0],
        transform: GradientRotation(animationValue * 2 * 3.1415926),
      ).createShader(rect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant EdgeGlowPainter oldDelegate) => true;
}
