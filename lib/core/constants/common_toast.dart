//---------------- top snackbar ---------------------
import 'package:flutter/material.dart';

enum MessageType { error, done, warning }

void showTopSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.blue, required MessageType messageType}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: TopSnackBar(
        message: message,
        backgroundColor: backgroundColor,
        messageType: messageType,
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the snackbar after a delay
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

class TopSnackBar extends StatefulWidget {
  final String message;
  final Color? backgroundColor;
  final MessageType messageType;

  const TopSnackBar(
      {super.key,
      required this.message,
      this.backgroundColor = Colors.blue,
      required this.messageType});

  @override
  State<TopSnackBar> createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define default background colors for each message type
    final Color defaultBackgroundColor;
    switch (widget.messageType) {
      case MessageType.done:
        defaultBackgroundColor = Colors.green;
        break;
      case MessageType.warning:
        defaultBackgroundColor = Colors.orange;
        break;
      case MessageType.error:
      default:
        defaultBackgroundColor = Colors.red;
        break;
    }

    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: defaultBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.message,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (widget.messageType) {
      case MessageType.done:
        return const Icon(Icons.check_circle, color: Colors.white, size: 24);
      case MessageType.warning:
        return const Icon(Icons.warning, color: Colors.white, size: 24);
      case MessageType.error:
      default:
        return const Icon(Icons.error_rounded, color: Colors.white, size: 24);
    }
  }
}
