enum BuildType {
  FastCastle,
  FastFeudal,
}

extension BuildTypeExtension on BuildType {
  String get displayName {
    switch (this) {
      case BuildType.FastCastle:
        return 'Fast Castle';
      case BuildType.FastFeudal:
        return 'Fast Feudal';
    }
  }
}
