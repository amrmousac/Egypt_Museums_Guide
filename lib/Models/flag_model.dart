class FlagModel {
  String img;
  String era;
  String timePeriod;

  FlagModel({this.img, this.era, this.timePeriod});

  FlagModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    era = json['era'];
    timePeriod = json['time_period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['era'] = this.era;
    data['time_period'] = this.timePeriod;
    return data;
  }
}
