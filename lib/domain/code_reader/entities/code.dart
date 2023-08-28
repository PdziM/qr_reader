import 'dart:convert';

class Code {
  final String description;

  Code({
    required this.description,
  });

  Code copyWith({
    String? description,
  }) {
    return Code(
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
    };
  }

  factory Code.fromMap(Map<String, dynamic> map) {
    return Code(
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Code.fromJson(String source) =>
      Code.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Code(description: $description)';

  @override
  bool operator ==(covariant Code other) {
    if (identical(this, other)) return true;

    return other.description == description;
  }

  @override
  int get hashCode => description.hashCode;
}
