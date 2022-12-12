import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supatest/base.dart';

// use your own SUPABASE_URL
const String SUPABASE_URL = 'https://vqxhnfosfawubsnihjhm.supabase.co';

// use your own SUPABASE_SECRET key
const String SUPABASE_SECRET =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxeGhuZm9zZmF3dWJzbmloamhtIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY2OTczMTkzMywiZXhwIjoxOTg1MzA3OTMzfQ.YJUNpKle7lRMeq1ZtxO8XqSSKn9ZIWpJbTZvQzKWYOY';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void callDbs() async {
  final SupabaseClient supabase = SupabaseClient(SUPABASE_URL, SUPABASE_SECRET);
  final data = await supabase.from('sysuser').select();
  print(data);
}

void saveUser() async {
  final SupabaseClient supabase = SupabaseClient(SUPABASE_URL, SUPABASE_SECRET);
  await supabase.from('sysuser').insert([
    {'name': 'Singapore On', 'phone': '0173663663323'},
  ]);
}

// update data
void updateUser() async {
  final SupabaseClient supabase = SupabaseClient(SUPABASE_URL, SUPABASE_SECRET);
  await supabase
      .from('sysuser')
      .update({'name': 'Singapore'}).eq('name', 'Singapore On');
}

// delete data
void deleteUser() async {
  final SupabaseClient supabase = SupabaseClient(SUPABASE_URL, SUPABASE_SECRET);
  await supabase.from('sysuser').delete().eq('name', 'Singapore');
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      callDbs();
    });
  }

  void _saveUser() {
    saveUser();
  }

  void _updateUser() {
    updateUser();
  }

  void _deleteUser() {
    deleteUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => {_saveUser()}, child: Text("Insert User")),
            ElevatedButton(
                onPressed: () => {_updateUser()}, child: Text("Update User")),
            ElevatedButton(
                onPressed: () => {_deleteUser()}, child: Text("Delete User")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


/*
class AuthenticationService {
  final _logger = Logger();
  final _localStorageService = locator<LocalStorageService>();

  AppUser? _user = null;
  AppUser? get user => _user;
  bool get hasUser => _user != null;

  Future<void> initialize() async {}

  Future<AppUser?> signIn({required AuthDto payload}) async {}

  Future<AppUser?> signUp({required AuthDto payload}) async {}

  Future<void> signOut() async {}

  Future<AppUser?> fetchUser({required String id}) async {}

  Future<PostgrestResponse> _createUser(User user, AuthDto payload) {}
}

Future<void> initialize() async {
  final accessToken = await _localStorageService.getItem('token');
  _logger.i(accessToken);

  if (accessToken == null) {
    return;
  }

  final response = await supabase.auth.api.getUser(accessToken);

  if (response.error != null) {
    return;
  }

  final user = response.data!;
  _logger.i(user.toJson());
  await fetchUser(id: user.id);
}

Future<AppUser?> signIn({required AuthDto payload}) async {
  final response = await supabase.auth.signIn(
    email: payload.email,
    password: payload.password,
  );

  if (response.error != null) {
    _logger.e(response.error!.message);
    return null;
  }
  _logger.i(response.data);
  await _localStorageService.setItem('token', response.data!.accessToken);
  return await fetchUser(id: response.data!.user!.id);
}

Future<AppUser?> signUp({required AuthDto payload}) async {
  final response = await supabase.auth.signUp(payload.email, payload.password);

  if (response.error != null) {
    _logger.e(response.error!.message);
    return null;
  }

  final user = response.data!.user!;
  _logger.i(user.toJson());
  await _createUser(user, payload);
  await _localStorageService.setItem('token', response.data!.accessToken);
  return await fetchUser(id: user.id);
}

Future<PostgrestResponse> _createUser(User user, AuthDto payload) {
  return supabase
      .from("app_users")
      .insert(
        AppUser(
          id: user.id,
          name: payload.name!,
          email: user.email,
        ),
      )
      .execute();
}

Future<void> signOut() async {
  final response = await supabase.auth.signOut();

  if (response.error != null) {
    _logger.e(response.error!.message);
    return;
  }
  _logger.i(response.rawData);
  await _localStorageService.removeItem('token');
  return;
}

Future<AppUser?> fetchUser({required String id}) async {
  final response =
      await supabase.from("app_users").select().eq('id', id).single().execute();

  _logger.i(
    'Count: ${response.count}, Status: ${response.status}, Data: ${response.data}',
  );

  if (response.error != null) {
    _logger.e(response.error!.message);
    return null;
  }

  _logger.i(response.data);
  final data = AppUser.fromJson(response.data);
  _user = data;

  return data;
}
*/