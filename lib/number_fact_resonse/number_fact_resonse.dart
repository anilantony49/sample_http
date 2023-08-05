import 'package:json_annotation/json_annotation.dart';

part 'number_fact_resonse.g.dart';

@JsonSerializable()
class NumberFactResonse {
  @JsonKey(name:'text')
  String? text;
  @JsonKey(name:'number')
  int? number;
  @JsonKey(name:'found')
  bool? found;
  @JsonKey(name:'type')
  String? type;

  NumberFactResonse({this.text, this.number, this.found, this.type});

  factory NumberFactResonse.fromJson(Map<String, dynamic> json) {
    return _$NumberFactResonseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberFactResonseToJson(this);
}
