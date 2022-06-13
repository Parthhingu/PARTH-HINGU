// class CurrentBookings {
//   CurrentBookingData? currentBookings;

//   CurrentBookings({this.currentBookings});

//   CurrentBookings.fromJson(Map<String, dynamic> json) {
//     currentBookings = json['current_bookings'] != null
//         ? CurrentBookingData.fromJson(json['current_bookings'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.currentBookings != null) {
//       data['current_bookings'] = this.currentBookings!.toJson();
//     }
//     return data;
//   }
// }

// class CurrentBookingData {
//   String? packageLabel;
//   String? fromDate;
//   String? fromTime;
//   String? toDate;
//   String? toTime;

//   CurrentBookingData(
//       {this.packageLabel,
//       this.fromDate,
//       this.fromTime,
//       this.toDate,
//       this.toTime});

//   factory CurrentBookingData.initial() {
//     return CurrentBookingData(
//       fromDate: '',
//       fromTime: '',
//       packageLabel: '',
//       toDate: '',
//       toTime: '',
//     );
//   }

//   CurrentBookingData.fromJson(Map<String, dynamic> json) {
//     packageLabel = json['package_label'] ?? "";
//     // fromDate = json['from_date'] ?? "";
//     // fromTime = json['from_time'] ?? "";
//     // toDate = json['to_date'] ?? "";
//     // toTime = json['to_time'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['package_label'] = this.packageLabel;
//     data['from_date'] = this.fromDate;
//     data['from_time'] = this.fromTime;
//     data['to_date'] = this.toDate;
//     data['to_time'] = this.toTime;
//     return data;
//   }
// }

class CurrentBookingData {
  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookingData(
      {this.packageLabel,
      this.fromDate,
      this.fromTime,
      this.toDate,
      this.toTime});
  factory CurrentBookingData.initial() {
    return CurrentBookingData(
      fromDate: '',
      fromTime: '',
      packageLabel: '',
      toDate: '',
      toTime: '',
    );
  }

  CurrentBookingData.fromJson(Map<String, dynamic> json) {
    packageLabel = json['package_label'] ?? '';
    fromDate = json['from_date'] ?? "";
    fromTime = json['from_time'] ?? "";
    toDate = json['to_date'] ?? "";
    toTime = json['to_time'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_label'] = this.packageLabel;
    data['from_date'] = this.fromDate;
    data['from_time'] = this.fromTime;
    data['to_date'] = this.toDate;
    data['to_time'] = this.toTime;
    return data;
  }
}
