import 'package:vexana/vexana.dart';

class TvShowModel extends INetworkModel<TvShowModel> {
  final double? score;
  final Show? show;

  TvShowModel({this.score, this.show});

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(score: json['score'], show: json['show'] != null ? Show.fromJson(json['show']) : null);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    if (show != null) {
      data['show'] = show!.toJson();
    }
    return data;
  }

  @override
  TvShowModel fromJson(Map<String, dynamic> json) {
    return TvShowModel.fromJson(json);
  }

  @override
  bool operator ==(covariant TvShowModel other) {
    if (identical(this, other)) return true;

    return other.score == score && other.show == show;
  }

  @override
  int get hashCode => score.hashCode ^ show.hashCode;
}

class Show extends INetworkModel<Show> {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final String? status;

  Show({this.id, this.url, this.name, this.type, this.language, this.status});

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'],
      language: json['language'],
      status: json['status'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['type'] = type;
    data['language'] = language;
    data['status'] = status;
    return data;
  }

  @override
  Show fromJson(Map<String, dynamic> json) {
    return Show.fromJson(json);
  }
}
