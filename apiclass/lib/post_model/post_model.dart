import 'package:collection/collection.dart';

class PostModel {
	int? postId;
	int? id;
	String? name;
	String? email;
	String? body;

	PostModel({this.postId, this.id, this.name, this.email, this.body});

	factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
				postId: json['postId'] as int?,
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				body: json['body'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'postId': postId,
				'id': id,
				'name': name,
				'email': email,
				'body': body,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! PostModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			postId.hashCode ^
			id.hashCode ^
			name.hashCode ^
			email.hashCode ^
			body.hashCode;
}
