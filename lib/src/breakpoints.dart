enum Breakpoint { desktop, tablet, mobile }

class Breakpoints {
  static final Breakpoints _api = Breakpoints._internal();
  static Breakpoints get instance => _api;
  Breakpoints._internal();

  final double _desktop = 1024.0;
  final double _tablet = 768.0;
  final double _mobile = 600.0;

  double get desktop => _desktop;
  double get tablet => _tablet;
  double get mobile => _mobile;

  set desktop(double desktop) => _desktop;
  set tablet(double tablet) => _tablet;
  set mobile(double mobile) => _mobile;
}
