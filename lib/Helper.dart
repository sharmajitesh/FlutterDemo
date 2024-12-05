

class HelperUtils {
  static String getTimeRead(int value) {
    if (value > 0) {
      if (value == 1) {
        return "$value min read";
      } else {
        return "$value mins read";
      }
    }
    return "";
  }
}