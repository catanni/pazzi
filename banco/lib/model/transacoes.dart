// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transacoes {
  final int id;
  final int accountId;
  final String type;
  final String balance;
  Transacoes({
    required this.id,
    required this.accountId,
    required this.type,
    required this.balance,
  });

  Transacoes copyWith({
    int? id,
    int? accountId,
    String? type,
    String? balance,
  }) {
    return Transacoes(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'accountId': accountId,
      'type': type,
      'balance': balance,
    };
  }

  factory Transacoes.fromMap(Map<String, dynamic> map) {
    return Transacoes(
      id: map['id'] as int,
      accountId: map['accountId'] as int,
      type: map['type'] as String,
      balance: map['balance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transacoes.fromJson(String source) =>
      Transacoes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transacoes(id: $id, accountId: $accountId, type: $type, balance: $balance)';
  }

  @override
  bool operator ==(covariant Transacoes other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.accountId == accountId &&
        other.type == type &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return id.hashCode ^ accountId.hashCode ^ type.hashCode ^ balance.hashCode;
  }
}
