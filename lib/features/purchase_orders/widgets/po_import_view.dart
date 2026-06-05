import 'package:flutter/material.dart';

class POImportView extends StatefulWidget {
  const POImportView({super.key});

  @override
  State<POImportView> createState() => _POImportViewState();
}

class _POImportViewState extends State<POImportView> {
  bool _isUploading = false;
  String? _selectedFile;

  void _pickFile() {
    // Mock file picking
    setState(() {
      _selectedFile = 'PO_Import_2024.csv';
    });
  }

  void _uploadFile() async {
    setState(() {
      _isUploading = true;
    });
    
    // Mock upload delay
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully imported 2 Purchase Orders!')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import Purchase Orders'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Upload a CSV or EDI file to import purchase orders into the system.'),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.cloud_upload_outlined, size: 48, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 16),
                  Text(_selectedFile ?? 'No file selected', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  FilledButton.tonal(
                    onPressed: _isUploading ? null : _pickFile,
                    child: const Text('Browse Files'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isUploading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: (_selectedFile == null || _isUploading) ? null : _uploadFile,
          child: _isUploading 
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
              : const Text('Import'),
        ),
      ],
    );
  }
}
