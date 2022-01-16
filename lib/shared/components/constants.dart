
// Function print Full Text
void printFullText(String text) {
  final pattern = RegExp(' .{1,800');
  pattern.allMatches(text).forEach((match) => (match.group(0)));
}

