// class Model {
//   int?  code;
//   HadithModel? data;
//
//   Model.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     data = json['data'];
//   }
// }
//   class HadithModel {
//   int? bookID;
//   int? chapterID;
//   int? hadithID;
//   String? arText;
//   String? arSanad1;
//
//   HadithModel(
//   {this.bookID, this.chapterID, this.hadithID, this.arText, this.arSanad1});
//
//   HadithModel.fromJson(Map<String, dynamic> json) {
//   bookID = json['Book_ID'];
//   chapterID = json['Chapter_ID'];
//   hadithID = json['Hadith_ID'];
//   arText = json['Ar_Text'];
//   arSanad1 = json['Ar_Sanad_1'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "bookID": bookID,
//       "chapterID": chapterID,
//       "hadithID": hadithID,
//       "arText": arText,
//       "arSanad1": arSanad1,
//     };
//   }
// }
//
//
