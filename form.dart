

class SubmitPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const SubmitPage({super.key, required this.applicationData});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  Uint8List? _idPhotoBytes;          // 2×2 ID picture
  String? _idPhotoName;
  PlatformFile? _residencyFile;      // proof-of-residency file

  // ----------------------------------------------------------
  // pick 2×2 photo (only images)
  // ----------------------------------------------------------
  Future<void> _pickIdPhoto() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowCompression: true,
    );
    if (result == null || result.files.single.bytes == null) return;
    setState(() {
      _idPhotoBytes = result.files.single.bytes;
      _idPhotoName = result.files.single.name;
    });
  }

  // ----------------------------------------------------------
  // pick proof-of-residency (any file)
  // ----------------------------------------------------------
  Future<void> _pickResidency() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowCompression: true,
    );
    if (result == null) return;
    setState(() => _residencyFile = result.files.single);
  }

  // ----------------------------------------------------------
  // final submit
  // ----------------------------------------------------------
  Future<void> _submit(BuildContext context) async {
    if (_idPhotoBytes == null || _residencyFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please attach both required files.")),
      );
      return;
    }

    // TODO: upload files + applicationData to your server here
    // e.g.:
    // await upload(
    //   idPhoto: _idPhotoBytes!,
    //   residency: File(residencyFile.path!),
    //   data: widget.applicationData,
    // );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Application submitted — thank you!")),
    );
    if (!mounted) return;
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  // ----------------------------------------------------------
  // UI
  // ----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: const Text("Review & Submit",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFD047),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("2x2 ID Photo",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),

              // 2×2 photo picker
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: _pickIdPhoto,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(.9),
                  ),
                  alignment: Alignment.center,
                  child: _idPhotoBytes == null
                      ? const Icon(Icons.add_a_photo,
                          size: 48, color: Color(0xFF022760))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.memory(_idPhotoBytes!,
                                height: 100, fit: BoxFit.cover),
                            const SizedBox(height: 4),
                            Text(_idPhotoName!,
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 24),

              const Text("Proof of Residency / Valid ID",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),

              // residency file picker
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: _pickResidency,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(.9),
                  ),
                  alignment: Alignment.center,
                  child: _residencyFile == null
                      ? const Icon(Icons.upload_file,
                          size: 48, color: Color(0xFF022760))
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.description,
                                size: 48, color: Color(0xFF022760)),
                            const SizedBox(height: 4),
                            Text(_residencyFile!.name,
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _submit(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD047),
                      foregroundColor: const Color(0xFF022760),
                      elevation: 20,
                      shape: const StadiumBorder(),
                      minimumSize: const Size(double.infinity, 50)),
                  child: const Text("SUBMIT"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
