// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:banco/model/transacoes.dart';
import 'package:flutter/foundation.dart';

class Account {
  final int id;
  final String name;
  final String pin;
  double balance;
  List<Transacoes> transactions;
  Account({
    required this.id,
    required this.name,
    required this.pin,
    required this.balance,
    required this.transactions,
  });

  Account copyWith({
    int? id,
    String? name,
    String? pin,
    double? balance,
    List<Transacoes>? transactions,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      pin: pin ?? this.pin,
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pin': pin,
      'balance': balance,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as int,
      name: map['name'] as String,
      pin: map['pin'] as String,
      balance: map['balance'] as double,
      transactions: List<Transacoes>.from(
        (map['transactions'] as List<int>).map<Transacoes>(
          (x) => Transacoes.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(id: $id, name: $name, pin: $pin, balance: $balance, transactions: $transactions)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.pin == pin &&
        other.balance == balance &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pin.hashCode ^
        balance.hashCode ^
        transactions.hashCode;
  }
}
