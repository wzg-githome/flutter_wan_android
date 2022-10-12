import 'package:flutter_wan_android/custom/common_class.dart';

class ImageUtils {
  ///image 占位符
  static Widget buildPlaceholder(double borderRadius) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: const Center(
        child: Text(
          "loading...",
          style: TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
