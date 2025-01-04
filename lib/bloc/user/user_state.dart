part of 'user_bloc.dart';

@immutable
sealed class UserState {
  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false,
    this.user,
  });
}

final class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

final class UserLoadedState extends UserState {
  const UserLoadedState(User user) : super(existUser: true, user: user);
}
