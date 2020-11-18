class Environment {
  final String baseUrl;
  final EnivironmentEnums environment;

  Environment(this.baseUrl, this.environment);
}

enum EnivironmentEnums { DEVELOPMENT, PRODUCTION }

mixin EnvironmentValue {
  static final Environment development = Environment(
      "https://us-central-your-test-project.cloudfunctions.net/api",
      EnivironmentEnums.DEVELOPMENT);

  static final Environment production = Environment(
      "https://us-central-your-prod-project.cloudfunctions.net/api",
      EnivironmentEnums.PRODUCTION);
}
