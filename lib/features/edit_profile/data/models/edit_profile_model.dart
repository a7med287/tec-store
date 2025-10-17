class EditProfileModel {
  final bool isSuccess;
  final String message;
  final String messageAr;
  final UserData data;

  EditProfileModel({
    required this.isSuccess,
    required this.message,
    required this.messageAr,
    required this.data,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      isSuccess: json['isSuccess'] ?? false,
      message: json['message'] ?? '',
      messageAr: json['messageAr'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserData {
  final int id;
  final String userName;
  final String fullName;
  final String email;
  final String lastUpdated;

  UserData({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.lastUpdated,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      userName: json['userName'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      lastUpdated: json['lastUpdated'] ?? '',
    );
  }
}
