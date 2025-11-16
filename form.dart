import 'package:flutter/material.dart';
import 'package:aiskolar_app/app.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _ctrl = List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (final c in _ctrl) c.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final uid = supabase.auth.currentUser!.id;
    await supabase.from('applications').insert({
      'user_id': uid,
      'name': _ctrl[0].text,
      'address': _ctrl[1].text,
      'phone': _ctrl[2].text,
      'email': _ctrl[3].text,
      'school': _ctrl[4].text,
      'course': _ctrl[5].text,
    });
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/upload-docs');
  }

  @override
  Widget build(BuildContext context) {
    final labels = [
      'Full Name',
      'Home Address',
      'Phone Number',
      'Email',
      'School',
      'Course'
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Application Form')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              for (int i = 0; i < labels.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    controller: _ctrl[i],
                    decoration: InputDecoration(labelText: labels[i]),
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: const Text('Submit & Upload Documents'))
            ],
          ),
        ),
      ),
    );
  }
}
