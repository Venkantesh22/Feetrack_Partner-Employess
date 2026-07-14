class CheckPointModel {
  final String? question;
  final bool? answer;

  CheckPointModel({
    this.question,
    this.answer,
  });

  factory CheckPointModel.fromJson(Map<String, dynamic> json) =>
      CheckPointModel(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
