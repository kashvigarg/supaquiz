import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository();

  final supabase = Supabase.instance.client;
  final User? user = Supabase.instance.client.auth.currentUser;
  final Session? session = Supabase.instance.client.auth.currentSession;

  get userId => user!.id;
  bool get isAlreadyLoggedIn => user == null;

  signUp(String email, String password) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  signIn(String email, String password) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  signOut() async {
    await supabase.auth.signOut();
  }
}
