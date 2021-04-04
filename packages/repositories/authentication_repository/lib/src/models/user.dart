import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({String? email, String? id, String? name, String? photo})
      : _name = name,
        _photo = photo,
        _email = email,
        _id = id;

  /// The current user's email address.
  final String? _email;

  /// The current user's id.
  final String? _id;

  /// The current user's name (display name).
  final String? _name;

  /// Url for the current user's photo.
  final String? _photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(email: '', id: '');

  @override
  List<Object> get props => [_id!, _email ?? '', _name ?? '', _photo ?? ''];
}
