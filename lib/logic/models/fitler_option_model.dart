class FilterOption {
  int? startYear;
  int? endYear;

  FilterOption({this.startYear, this.endYear});

  FilterOption.fromJson(Map<String, dynamic> json) {
    startYear = json['startYear'];
    endYear = json['endYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startYear'] = this.startYear;
    data['endYear'] = this.endYear;
    return data;
  }
}
