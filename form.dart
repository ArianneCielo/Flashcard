// application_form.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFD047),
            title: const Center(child: Text('Application Form'))),
        body: const FormFlow(),
      ),
    );
  }
}

/* ---------- DATA MODEL ---------- */
class FormData {
  // Personal
  String? contact, civil, nationality, email, country;
  // Educational
  String? school, yearLevel, cluster, gwa;
  // Family
  String? fatherName, fatherOcc, motherName, motherOcc, siblings, familyIncome;
  // Financial
  String? support, expenses, reason;
  // Files
  List<String> files = [];
}

/* ---------- MAIN FLOW ---------- */
class FormFlow extends StatefulWidget {
  const FormFlow({super.key});
  @override
  State<FormFlow> createState() => _FormFlowState();
}

class _FormFlowState extends State<FormFlow> {
  final PageController _page = PageController();
  final FormData data = FormData();

  void _next() => _page.nextPage(
      duration: const Duration(milliseconds: 300), curve: Curves.easeIn);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _page,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PersonalPage(data: data, onNext: _next),
        EducationalPage(data: data, onNext: _next),
        FamilyPage(data: data, onNext: _next),
        FinancialPage(data: data, onNext: _next),
        DocsPage(data: data, onSubmit: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Application submitted!')));
        }),
      ],
    );
  }
}

/* ---------- SHARED DECOR ---------- */
InputDecoration _decoration(String hint) => InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF5FCF9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50))));

ButtonStyle _btnStyle() => ElevatedButton.styleFrom(
    elevation: 20,
    backgroundColor: const Color(0xFFFFD047),
    foregroundColor: const Color(0xFF022760),
    minimumSize: const Size(double.infinity, 50),
    shape: const StadiumBorder());

/* ---------- 1. PERSONAL ---------- */
class PersonalPage extends StatelessWidget {
  final FormData data;
  final VoidCallback onNext;
  const PersonalPage({super.key, required this.data, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(children: [
            const SizedBox(height: 40),
            TextFormField(
                decoration: _decoration('Contact Number'),
                keyboardType: TextInputType.phone,
                onChanged: (v) => data.contact = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Civil Status'),
                onChanged: (v) => data.civil = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Nationality'),
                onChanged: (v) => data.nationality = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Email Address'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => data.email = v),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
                items: countries
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => data.country = v,
                decoration: _decoration('Country')),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onNext, style: _btnStyle(), child: const Text('NEXT'))
          ]),
        ),
      ),
    );
  }
}

/* ---------- 2. EDUCATIONAL ---------- */
class EducationalPage extends StatelessWidget {
  final FormData data;
  final VoidCallback onNext;
  const EducationalPage({super.key, required this.data, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(children: [
            const SizedBox(height: 40),
            TextFormField(
                decoration: _decoration('Name of School'),
                onChanged: (v) => data.school = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Year Level or Grade'),
                onChanged: (v) => data.yearLevel = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Cluster'),
                onChanged: (v) => data.cluster = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('General Weighted Average'),
                onChanged: (v) => data.gwa = v),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onNext, style: _btnStyle(), child: const Text('NEXT'))
          ]),
        ),
      ),
    );
  }
}

/* ---------- 3. FAMILY ---------- */
class FamilyPage extends StatelessWidget {
  final FormData data;
  final VoidCallback onNext;
  const FamilyPage({super.key, required this.data, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(children: [
            const SizedBox(height: 40),
            TextFormField(
                decoration: _decoration("Father's Name"),
                onChanged: (v) => data.fatherName = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration("Father's Occupation"),
                onChanged: (v) => data.fatherOcc = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration("Mother's Name"),
                onChanged: (v) => data.motherName = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration("Mother's Occupation"),
                onChanged: (v) => data.motherOcc = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Number of Siblings'),
                keyboardType: TextInputType.number,
                onChanged: (v) => data.siblings = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Family Monthly Income'),
                keyboardType: TextInputType.number,
                onChanged: (v) => data.familyIncome = v),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onNext, style: _btnStyle(), child: const Text('NEXT'))
          ]),
        ),
      ),
    );
  }
}

/* ---------- 4. FINANCIAL ---------- */
class FinancialPage extends StatelessWidget {
  final FormData data;
  final VoidCallback onNext;
  const FinancialPage({super.key, required this.data, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(children: [
            const SizedBox(height: 40),
            TextFormField(
                decoration: _decoration('Source of Financial Support'),
                onChanged: (v) => data.support = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Estimated Monthly Expenses'),
                keyboardType: TextInputType.number,
                onChanged: (v) => data.expenses = v),
            const SizedBox(height: 16),
            TextFormField(
                decoration: _decoration('Reason for Needing Financial Assistance'),
                maxLines: 3,
                onChanged: (v) => data.reason = v),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onNext, style: _btnStyle(), child: const Text('NEXT'))
          ]),
        ),
      ),
    );
  }
}

/* ---------- 5. DOCUMENTS + UPLOAD ---------- */
class DocsPage extends StatefulWidget {
  final FormData data;
  final VoidCallback onSubmit;
  const DocsPage({super.key, required this.data, required this.onSubmit});

  @override
  State<DocsPage> createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  final List<String> _fileNames = [];

  Future<void> _pick() async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();
    if (res != null) setState(() => _fileNames.add(res.files.single.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(children: [
            const SizedBox(height: 40),
            const Text('Upload Additional Documents',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 20),
            ...[
              '2x2 ID Photo',
              'Certificate of Enrollment',
              'Barangay Certificate of Indigency',
              'Certificate of Good Moral Character',
              'Birth Certificate (PSA copy)'
            ].map((doc) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                      onPressed: _pick, style: _btnStyle(), child: Text('Upload $doc')),
                )),
            const SizedBox(height: 20),
            Wrap(
                spacing: 8,
                children:
                    _fileNames.map((f) => Chip(label: Text(f))).toList()),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: widget.onSubmit, style: _btnStyle(), child: const Text('SUBMIT'))
          ]),
        ),
      ),
    );
  }
}

/* ---------- COUNTRY LIST ---------- */
final List<String> countries = [
  'Bangladesh',
  'Switzerland',
  'Canada',
  'Japan',
  'Germany',
  'Australia',
  'Sweden'
];
