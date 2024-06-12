/// id : 1
/// name : "إذاعة إبراهيم الأخضر"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"
/// recent_date : "2020-04-25 16:04:04"

class RadiosModel {
  RadiosModel({
      this.id, 
      this.name, 
      this.url, 
      this.recentDate,});

  RadiosModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  num? id;
  String? name;
  String? url;
  String? recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['recent_date'] = recentDate;
    return map;
  }

}