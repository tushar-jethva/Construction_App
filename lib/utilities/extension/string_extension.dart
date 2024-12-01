/// Common extensions for [String]
extension StringExtension on String {
  /// Returns a new string with the first [length] characters of this string.
  String limit(int length) =>
      length < this.length ? substring(0, length) : this;
}


/// capitalize the first letter of the string
extension Capitalize on String {
  /// capitalize the first letter of the string
  String get capitalize  {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
