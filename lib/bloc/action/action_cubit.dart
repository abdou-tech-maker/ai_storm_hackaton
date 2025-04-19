import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'action_state.dart';

class ActionCubit extends Cubit<ActionState> {
  ActionCubit() : super(ActionInitial());

  static const String ayorUrl = "https://backend.dev.ayorservices.com/";
  static const String agentUrl = "https://storm-api-b2zj.onrender.com/";

  String? _accessToken;

  Future<void> login(String email, String password) async {
    emit(ActionLoading());
    final url = Uri.parse('${ayorUrl}auth/jwt/create/');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        _accessToken = jsonDecode(response.body)['access'];
        emit(ActionAuthenticated());
      } else {
        emit(ActionError('Login failed: ${response.body}'));
      }
    } catch (e) {
      emit(ActionError('Login error: $e'));
    }
  }

  Future<void> execute(String input) async {
    if (_accessToken == null) {
      emit(ActionError('You must log in first.'));
      return;
    }

    emit(ActionLoading());

    final url = Uri.parse('${agentUrl}v1/execute');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'recommendations': [input]
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(ActionSuccess(data));
      } else {
        emit(ActionError('Execute failed: ${response.body}'));
      }
    } catch (e) {
      emit(ActionError('Execution error: $e'));
    }
  }
}
