class TransectionDetails {
  int? id;
  final int transectionId;
  final String userName;
  final String senderName;
  final double transectionAmount;

  TransectionDetails({
    this.id,
    required this.transectionId,
    required this.userName,
    required this.transectionAmount,
    required this.senderName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transectionId': transectionId,
      'userName': userName,
      'senderName': senderName,
      'transectionAmount': transectionAmount,
    };
  }
}
