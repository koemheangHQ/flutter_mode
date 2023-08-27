class EnvironmentModel {
  String environment;
  String? language;

  EnvironmentModel({required this.environment, this.language});

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) =>
      EnvironmentModel(
        environment: json["env"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "env": environment,
        "language": language,
      };
}
