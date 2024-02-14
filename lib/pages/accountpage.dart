import 'package:campuscupid/components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:campuscupid/main.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _nameController = TextEditingController();
  final _regnoController = TextEditingController();

  String? _avatarUrl;
  var _loading = true;

  /// Called once a user id is received within `onAuthenticated()`
  Future<void> _getProfile() async {
    setState(() {
      _loading = true;
    });

    try {
      final userId = supabase.auth.currentUser!.id;
      final data =
          await supabase.from('profiles').select().eq('id', userId).single();
      _nameController.text = (data['full_name'] ?? '') as String;
      _regnoController.text = (data['regno'] ?? '') as String;
      _avatarUrl = (data['avatar_url'] ?? '') as String;
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  /// Called when user taps `Update` button
  Future<void> _updateProfile() async {
    setState(() {
      _loading = true;
    });
    final fullname = _nameController.text.trim();
    final regno = _regnoController.text.trim();
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'full_name': fullname,
      'regno': regno,
      'updated_at': DateTime.now().toIso8601String(),
    };
    try {
      await supabase.from('profiles').upsert(updates);
      if (mounted) {
        const SnackBar(
          content: Text('Successfully updated profile!'),
        );
      }
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  /// Called when image has been uploaded to Supabase storage from within Avatar widget
  Future<void> _onUpload(String imageUrl) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('profiles').upsert({
        'id': userId,
        'avatar_url': imageUrl,
      });
      if (mounted) {
        const SnackBar(
          content: Text('Updated your profile image!'),
        );
      }
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _avatarUrl = imageUrl;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _regnoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              children: [
                Avatar(imageUrl: _avatarUrl, onUpload: _onUpload),
                SizedBox(height: 18),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Your Name'),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: _regnoController,
                  decoration: const InputDecoration(labelText: 'Reg. No.'),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _loading ? null : _updateProfile,
                  child: Text(_loading ? 'Saving...' : 'Update'),
                ),
                const SizedBox(height: 18),
                TextButton(onPressed: _signOut, child: const Text('Sign Out')),
              ],
            ),
    );
  }
}
