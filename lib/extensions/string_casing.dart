extension StringCasing on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeEach() {
    List<String> strings = split(' ');
    for (final (index, string) in strings.indexed) {
      strings[index] = '${string[0].toUpperCase()}${string.substring(1)}';
    }
    return strings.join(' ');
  }
}
