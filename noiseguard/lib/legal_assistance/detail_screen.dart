// 변호사 상세 페이지
import 'package:flutter/material.dart';
import 'package:noiseguard/domain/lawyer.dart';
import 'package:url_launcher/url_launcher.dart';

class LawyerDetailScreen extends StatelessWidget {
  final Lawyer lawyer;

  const LawyerDetailScreen({super.key, required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lawyer.name),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(lawyer.image),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Text(
                lawyer.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                lawyer.field,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Icons.phone, lawyer.phone),
            _buildInfoRow(Icons.email, lawyer.email),
            _buildInfoRow(Icons.access_time, lawyer.workingHours),
            SizedBox(height: 20),
            Text(
              "변호사 소개",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              lawyer.description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _makePhoneCall(lawyer.phone),
                icon: Icon(Icons.phone),
                label: Text("전화하기"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // print("전화를 걸 수 없습니다.");
    }
  }
}
