class courseData {
  String? previous;
  String? next;
  List<Result>? result;

  courseData({this.previous, this.next, this.result});

  courseData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previous'] = this.previous;
    data['next'] = this.next;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? serial;
  String? course;
  String? section;
  String? credit;
  String? facultyName;
  String? semester;

  Result(
      {this.serial,
        this.course,
        this.section,
        this.credit,
        this.facultyName,
        this.semester});

  Result.fromJson(Map<String, dynamic> json) {
    serial = json['Serial'];
    course = json['Course'];
    section = json['Section'];
    credit = json['Credit'];
    facultyName = json['Faculty Name'];
    semester = json['Semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Serial'] = this.serial;
    data['Course'] = this.course;
    data['Section'] = this.section;
    data['Credit'] = this.credit;
    data['Faculty Name'] = this.facultyName;
    data['Semester'] = this.semester;
    return data;
  }
}