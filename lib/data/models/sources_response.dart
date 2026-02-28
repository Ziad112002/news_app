
import 'remote_source.dart';

class SourcesResponse {
   String? status;
   List<RemoteSource>? sources;

  SourcesResponse({
    this.status,
    this.sources,
  });

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((item) => RemoteSource.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'sources': sources?.map((source) => source.toJson()).toList(),
    }..removeWhere((key, value) => value == null); // optional: clean nulls
  }


}

