class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('https://dev-sample.io');
  static final Env staging = Env('https://test-sample.io');
  static final Env production = Env('https://sample.io');
}
