// import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';
import 'package:postgrest/postgrest.dart';
// import 'package:supagrocery/app/app.locator.dart';
// import 'package:supagrocery/app/supabase_api.dart';
// import 'package:supagrocery/services/authentication_service.dart';

// use your own SUPABASE_URL
const String SUPABASE_URL = 'https://vqxhnfosfawubsnihjhm.supabase.co';

// use your own SUPABASE_SECRET key
const String SUPABASE_SECRET =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxeGhuZm9zZmF3dWJzbmloamhtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk3MzE5MzMsImV4cCI6MTk4NTMwNzkzM30.d3zm-HXyXbbFCb0Xb4rCM6Rj7HDQDPfVr5FiXCHZcPU';

abstract class SupabaseService<T> {
  // final _authService = locator<AuthenticationService>();
  // final _logger = Logger();
  final SupabaseClient supabase = SupabaseClient(SUPABASE_URL, SUPABASE_SECRET);

  String tableName() {
    return "sysuser";
  }

  Future<PostgrestResponse> all() async {
    // _logger.i(tableName());
    final response = await supabase.from(tableName()).select().execute();
    // _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> find(String id) async {
    // _logger.i(tableName() + ' ' + id);
    final response = await supabase
        .from(tableName())
        .select()
        .eq('id', id)
        .single()
        .execute();
    // _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> create(Map<String, dynamic> json) async {
    // _logger.i(tableName() + ' ' + json.toString());
    final response = await supabase.from(tableName()).insert(json).execute();
    // _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> update({
    required String id,
    required Map<String, dynamic> json,
  }) async {
    // _logger.i(tableName() + ' ' + json.toString());
    final response =
        await supabase.from(tableName()).update(json).eq('id', id).execute();
    // _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> delete(String id) async {
    // _logger.i(tableName() + ' ' + id);
    final response =
        await supabase.from(tableName()).delete().eq('id', id).execute();
    // _logger.i(response.toJson());
    return response;
  }
}
