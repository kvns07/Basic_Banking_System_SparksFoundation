class UserData {
  int ?id;
  final String userName;
  final String cardNumber;
  final String cardExpiry;
  final double totalAmount;

  UserData({
    this.id,
    required this.cardNumber,
    required this.cardExpiry,
    required this.userName,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'cardNumber': cardNumber,
      'cardExpiry': cardExpiry,
      'totalAmount': totalAmount,
    };
  }
}
