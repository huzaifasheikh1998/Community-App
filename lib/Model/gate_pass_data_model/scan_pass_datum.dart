import 'package:collection/collection.dart';

import 'pass_relation.dart';
import 'user_contact_relation.dart';

class ScanPassDatum {
  int? id;
  int? passId;
  int? passUserContactId;
  String? qrCode;
  String? isScan;
  int? isSms;
  int? isWhatsapp;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  PassRelation? passRelation;
  UserContactRelation? userContactRelation;

  ScanPassDatum({
    this.id,
    this.passId,
    this.passUserContactId,
    this.qrCode,
    this.isScan,
    this.isSms,
    this.isWhatsapp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passRelation,
    this.userContactRelation,
  });

  factory ScanPassDatum.fromJson(Map<String, dynamic> json) => ScanPassDatum(
        id: json['id'] as int?,
        passId: json['pass_id'] as int?,
        passUserContactId: json['pass_user_contact_id'] as int?,
        qrCode: json['qr_code'] as String?,
        isScan: json['is_scan'] as String?,
        isSms: json['is_sms'] as int?,
        isWhatsapp: json['is_whatsapp'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        passRelation: json['pass_relation'] == null
            ? null
            : PassRelation.fromJson(
                json['pass_relation'] as Map<String, dynamic>),
        userContactRelation: json['user_contact_relation'] == null
            ? null
            : UserContactRelation.fromJson(
                json['user_contact_relation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_id': passId,
        'pass_user_contact_id': passUserContactId,
        'qr_code': qrCode,
        'is_scan': isScan,
        'is_sms': isSms,
        'is_whatsapp': isWhatsapp,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'pass_relation': passRelation?.toJson(),
        'user_contact_relation': userContactRelation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ScanPassDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passId.hashCode ^
      passUserContactId.hashCode ^
      qrCode.hashCode ^
      isScan.hashCode ^
      isSms.hashCode ^
      isWhatsapp.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passRelation.hashCode ^
      userContactRelation.hashCode;
}
