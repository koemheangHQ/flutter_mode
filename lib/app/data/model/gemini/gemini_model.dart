class GeminiResponse {
  List<Candidate> candidates;
  PromptFeedback promptFeedback;

  GeminiResponse({
    required this.candidates,
    required this.promptFeedback,
  });

  factory GeminiResponse.fromJson(Map<String, dynamic> json) => GeminiResponse(
        candidates: List<Candidate>.from(
            json["candidates"].map((x) => Candidate.fromJson(x))),
        promptFeedback: PromptFeedback.fromJson(json["promptFeedback"]),
      );
}

class Candidate {
  Content content;
  String finishReason;
  int index;
  List<SafetyRating> safetyRatings;

  Candidate({
    required this.content,
    required this.finishReason,
    required this.index,
    required this.safetyRatings,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        content: Content.fromJson(json["content"]),
        finishReason: json["finishReason"],
        index: json["index"],
        safetyRatings: List<SafetyRating>.from(
            json["safetyRatings"].map((x) => SafetyRating.fromJson(x))),
      );
}

class Content {
  List<Part>? parts;
  String? role;

  Content({
     this.parts,
    required this.role,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        parts: json['parts'] != null
            ? List<Part>.from(json["parts"].map((x) => Part.fromJson(x)))
            : [],
        role: json["role"] ?? 'n/a',
      );
}

class Part {
  String? text;

  Part({
    required this.text,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        text: json["text"] ?? "n/a",
      );
}

class SafetyRating {
  String category;
  String probability;

  SafetyRating({
    required this.category,
    required this.probability,
  });

  factory SafetyRating.fromJson(Map<String, dynamic> json) => SafetyRating(
        category: json["category"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "probability": probability,
      };
}

class PromptFeedback {
  List<SafetyRating> safetyRatings;

  PromptFeedback({
    required this.safetyRatings,
  });

  factory PromptFeedback.fromJson(Map<String, dynamic> json) => PromptFeedback(
        safetyRatings: List<SafetyRating>.from(
            json["safetyRatings"].map((x) => SafetyRating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "safetyRatings":
            List<dynamic>.from(safetyRatings.map((x) => x.toJson())),
      };
}
