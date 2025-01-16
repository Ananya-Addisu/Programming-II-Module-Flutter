import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming II Module',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.red,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _openPDF(BuildContext context, String pdfPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(pdfPath: 'assets/$pdfPath'),
      ),
    );
  }

  void _launchTeacherNotes() async {
    const url =
        'https://t.me/SidraqProductionArchivebot?start=BQADAQADBQgAAq1xQUReiCMBLb2qnBYE';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void _launchDevelopersPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DevelopersPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programming II Module'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[900]!,
              Colors.grey[850]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              for (int i = 1; i <= 6; i++) _buildChapterCard(context, i),
              _buildTeacherNotesCard(context),
              _buildDevelopersCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterCard(BuildContext context, int chapterNumber) {
    final List<String> chapterTitles = [
      'Functions',
      'Arrays',
      'Strings',
      'Pointers',
      'Structures',
      'File Operations'
    ];

    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(8),
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => _openPDF(context, '$chapterNumber.pdf'),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[850]!,
                Colors.grey[900]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                size: 40,
                color: Colors.red,
              ),
              const SizedBox(height: 8),
              Text(
                'Chapter $chapterNumber',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                chapterTitles[chapterNumber - 1],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDevelopersCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCustomCard(
            title: 'Developers',
            icon: Icons.developer_mode,
            onTap: () => _launchDevelopersPage(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherNotesCard(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCustomCard(
            title: 'Teacher\'s Notes',
            icon: Icons.book,
            onTap: _launchTeacherNotes,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(8),
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[850]!,
                Colors.grey[900]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.red,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;

  const PDFViewerPage({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.black,
      ),
      body: SfPdfViewer.asset(
        pdfPath,
        canShowScrollHead: true,
        pageSpacing: 8,
      ),
    );
  }
}

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> developers = [
      {'name': 'ANANYA ADDISU', 'id': 'BDU1600957'},
      {'name': 'BISRAT AYALEW', 'id': 'BDU1601168'},
      {'name': 'REDIET BEKALU', 'id': 'BDU1602323'},
      {'name': 'DAGMAWIT AMSALU', 'id': 'BDU1601218'},
      {'name': 'EYOB MOLLA', 'id': 'BDU1601462'},
      {'name': 'DEGNET HABTAMU', 'id': 'BDU1601270'},
      {'name': 'HIYWOT TESHOME', 'id': 'BDU1601788'},
      {'name': 'YONAS ADANE', 'id': 'BDU1602840'},
      {'name': 'MINTESNOT DERIB', 'id': 'BDU1602150'},
      {'name': 'FINOTELOZA WANAW', 'id': 'BDU1601526'},
      {'name': 'GATWECH DENG', 'id': 'BDU1510065'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Development Team - Group 4'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: developers.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey[850],
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  developers[index]['name']![0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                developers[index]['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ID: ${developers[index]['id']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.red,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
