import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false), // keep old material look
      home: const PersonalInformationPage(),
    );
  }
}

/* ============================================================================
   1. PERSONAL INFORMATION  (picture 1000032702.png)
============================================================================ */
class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});
  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: const Text('Application Form – Personal Information',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, c) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: c.maxHeight * .04),
                  _roundedField('Contact Number*',
                      keyboard: TextInputType.phone, onSaved: (v) {
                    data['contactNumber'] = v;
                  }),
                  const SizedBox(height: 16),
                  _roundedField('Civil Status*', onSaved: (v) {
                    data['civilStatus'] = v;
                  }),
                  const SizedBox(height: 16),
                  _roundedField('Nationality*', onSaved: (v) {
                    data['nationality'] = v;
                  }),
                  const SizedBox(height: 16),
                  _roundedField('Email Address*',
                      keyboard: TextInputType.emailAddress, onSaved: (v) {
                    data['emailAddress'] = v;
                  }),
                  const SizedBox(height: 16),
                  _countryDropdown(),
                  const SizedBox(height: 32),
                  _nextButton(() {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EducationalBackgroundPage(
                                  applicationData: Map.from(data))));
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundedField(String hint,
      {TextInputType? keyboard, required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      keyboardType: keyboard,
      validator: (v) => v!.trim().isEmpty ? 'Required' : null,
      onSaved: onSaved,
    );
  }

  Widget _countryDropdown() {
    return DropdownButtonFormField<String>(
      items: _countries
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (_) {},
      onSaved: (v) => data['country'] = v,
      validator: (v) => v == null ? 'Required' : null,
      decoration: const InputDecoration(
        hintText: 'Country',
        filled: true,
        fillColor: Color(0xFFF5FCF9),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }

  Widget _nextButton(VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 20,
          backgroundColor: const Color(0xFFFFD047),
          foregroundColor: const Color(0xFF022760),
          shape: const StadiumBorder(),
        ),
        child: const Text('NEXT'),
      ),
    );
  }

  final List<String> _countries = [
    'Bangladesh',
    'Switzerland',
    'Canada',
    'Japan',
    'Germany',
    'Australia',
    'Sweden',
    'Philippines'
  ];
}

/* ============================================================================
   2. EDUCATIONAL BACKGROUND  (1000032703.png)
============================================================================ */
class EducationalBackgroundPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const EducationalBackgroundPage({super.key, required this.applicationData});
  @override
  State<EducationalBackgroundPage> createState() =>
      _EducationalBackgroundPageState();
}

class _EducationalBackgroundPageState extends State<EducationalBackgroundPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
        title: 'Educational Background',
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              _field('Name of School*', onSaved: (v) => data['schoolName'] = v),
              const SizedBox(height: 16),
              _field('Year Level or Grade*',
                  onSaved: (v) => data['yearLevel'] = v),
              const SizedBox(height: 16),
              _field('Cluster*', onSaved: (v) => data['cluster'] = v),
              const SizedBox(height: 16),
              _field('General Weighted Average*',
                  keyboard: TextInputType.number,
                  onSaved: (v) => data['gwa'] = v),
              const SizedBox(height: 32),
              _nextButton(() {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FamilyBackgroundPage(
                              applicationData: Map.from(data))));
                }
              }),
            ],
          ),
        ));
  }

  Widget _field(String hint,
      {TextInputType? keyboard, required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      validator: (v) => v!.trim().isEmpty ? 'Required' : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 20,
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
          ),
          child: const Text('NEXT'),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: body,
        ),
      ),
    );
  }
}

/* ============================================================================
   3. FAMILY BACKGROUND  (1000032704.png)
============================================================================ */
class FamilyBackgroundPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const FamilyBackgroundPage({super.key, required this.applicationData});
  @override
  State<FamilyBackgroundPage> createState() => _FamilyBackgroundPageState();
}

class _FamilyBackgroundPageState extends State<FamilyBackgroundPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
        title: 'Family Background',
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("Father's Name*", (v) => data['fatherName'] = v),
              const SizedBox(height: 16),
              _field("Father's Occupation*", (v) => data['fatherOccupation'] = v),
              const SizedBox(height: 16),
              _field("Mother's Name*", (v) => data['motherName'] = v),
              const SizedBox(height: 16),
              _field("Mother's Occupation*", (v) => data['motherOccupation'] = v),
              const SizedBox(height: 16),
              _field('Number of siblings*',
                  keyboard: TextInputType.number,
                  (v) => data['siblingsCount'] = v),
              const SizedBox(height: 16),
              _field('Family Monthly Income*',
                  keyboard: TextInputType.number,
                  (v) => data['familyIncome'] = v),
              const SizedBox(height: 32),
              _nextButton(() {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FinancialInformationPage(
                              applicationData: Map.from(data))));
                }
              }),
            ],
          ),
        ));
  }

  Widget _field(String hint, FormFieldSetter<String> onSaved,
          {TextInputType? keyboard}) =>
      TextFormField(
        decoration: _inputDeco(hint),
        keyboardType: keyboard,
        validator: (v) => v!.trim().isEmpty ? 'Required' : null,
        onSaved: onSaved,
      );

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 20,
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
          ),
          child: const Text('NEXT'),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: body,
        ),
      ),
    );
  }
}

/* ============================================================================
   4. FINANCIAL INFORMATION  (1000032705.png)
============================================================================ */
class FinancialInformationPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const FinancialInformationPage({super.key, required this.applicationData});
  @override
  State<FinancialInformationPage> createState() =>
      _FinancialInformationPageState();
}

class _FinancialInformationPageState extends State<FinancialInformationPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
        title: 'Financial Information',
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              _field('Source of Financial Support*',
                  (v) => data['financialSource'] = v),
              const SizedBox(height: 16),
              _field('Estimated Monthly Expenses*',
                  keyboard: TextInputType.number,
                  (v) => data['monthlyExpenses'] = v),
              const SizedBox(height: 16),
              _field('Reason for Needing Financial Assistance*',
                  maxLines: 4,
                  (v) => data['reason'] = v),
              const SizedBox(height: 32),
              _nextButton(() {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AdditionalDocumentsPage(
                              applicationData: Map.from(data))));
                }
              }),
            ],
          ),
        ));
  }

  Widget _field(String hint, FormFieldSetter<String> onSaved,
      {TextInputType? keyboard, int maxLines = 1}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      maxLines: maxLines,
      validator: (v) => v!.trim().isEmpty ? 'Required' : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 20,
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
          ),
          child: const Text('NEXT'),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: body,
        ),
      ),
    );
  }
}

/* ============================================================================
   5. ADDITIONAL DOCUMENTS  (1000032706.png)
============================================================================ */
class AdditionalDocumentsPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const AdditionalDocumentsPage({super.key, required this.applicationData});
  @override
  State<AdditionalDocumentsPage> createState() =>
      _AdditionalDocumentsPageState();
}

class _AdditionalDocumentsPageState extends State<AdditionalDocumentsPage> {
  final Map<String, bool> docs = {
    'Certificate of Enrolment or latest Report Card': false,
    'Barangay Certificate of Indigency': false,
    'Certificate of Good Moral Character': false,
    'Birth Certificate (PSA copy)': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: const Text('Additional Documents',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            children: [
              const Text(
                'Please check the documents you will upload:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ...docs.keys.map((d) => CheckboxListTile(
                    title: Text(d,
                        style: const TextStyle(color: Colors.white70)),
                    value: docs[d],
                    onChanged: (v) => setState(() => docs[d] = v!),
                    activeColor: const Color(0xFFFFD047),
                    checkColor: const Color(0xFF022760),
                  )),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final checked = docs.entries
                        .where((e) => e.value)
                        .map((e) => e.key)
                        .toList();
                    if (checked.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please select at least one')));
                      return;
                    }
                    final Map<String, dynamic> finalData =
                        Map.from(widget.applicationData);
                    finalData['documents'] = checked;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SubmitPage(applicationData: finalData)));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: const Color(0xFFFFD047),
                    foregroundColor: const Color(0xFF022760),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ============================================================================
   6. SUBMIT PAGE  (1000032707.png)
============================================================================ */
class SubmitPage extends StatelessWidget {
  final Map<String, dynamic> applicationData;
  const SubmitPage({super.key, required this.applicationData});

  Future<void> _submit(BuildContext context) async {
    // TODO: upload / save logic here
    // e.g. http.post(… body: applicationData …);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Application submitted – thank you!')));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: const Text('Review & Submit',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '2x2 ID photo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.add_a_photo,
                    size: 48, color: Color(0xFF022760)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Proof of residency or valid ID',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.upload_file,
                    size: 48, color: Color(0xFF022760)),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () => _submit(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: const Color(0xFFFFD047),
                    foregroundColor: const Color(0xFF022760),
                    minimumSize: const Size(double.infinity, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
