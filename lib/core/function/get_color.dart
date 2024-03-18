String normalizeColor(String color) {
  RegExp regexWithHash = RegExp(r'^#([0-9A-Fa-f]{6})$');
  RegExp regexWithoutHash = RegExp(r'^([0-9A-Fa-f]{6})$');

  if (color.startsWith('#')) {
    Match? match = regexWithHash.firstMatch(color);
    if (match != null) {
      return '#0x${match.group(1)!}';
    }
  } else {
    Match? match = regexWithoutHash.firstMatch(color);
    if (match != null) {
      return '#0x${match.group(1)!}';
    }
  }

  return ''; // or throw an exception for invalid colors
}
