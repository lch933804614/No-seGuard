import 'package:flutter/material.dart';
import 'package:noiseguard/domain/lawyer.dart';
import 'package:noiseguard/legal_assistance/detail_screen.dart';


class LegalScreen extends StatelessWidget {
  final List<Lawyer> lawyers = [
    Lawyer(
      name: "김도윤 변호사",
      field: "층간소음 피해 소송",
      phone: "02-1234-5678",
      workingHours: "평일 11:00 - 18:00",
      image: "assets/images/lawyer1.jpeg",
      email: "doyunlaw@example.com",
      description:
      "층간소음으로 인한 법적 피해를 전문적으로 다루는 변호사입니다. 여러 케이스를 성공적으로 해결한 경험이 풍부합니다.",
    ),
    Lawyer(
      name: "곽두팔 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-5432",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/images/lawyer2.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
    Lawyer(
      name: "송윤섭 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-5672",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/images/lawyer3.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
    Lawyer(
      name: "김민지 변호사",
      field: "층간소음 피해 소송",
      phone: "02-9876-1234",
      workingHours: "평일 10:00 - 17:00",
      image: "assets/images/lawyer4.jpeg",
      email: "kwaklaw@example.com",
      description:
      "층간소음 및 환경 소송 전문 변호사로, 원만한 해결과 승소율이 높은 전략을 제공합니다.",
    ),
  ];

  LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "📜 법적 대응이 필요할 때\n확실한 해결책을 찾아보세요.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lawyers.length,
                itemBuilder: (context, index) {
                  return _buildLawyerCard(context, lawyers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLawyerCard(BuildContext context, Lawyer lawyer) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(lawyer.image),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lawyer.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    lawyer.field,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    lawyer.phone,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    lawyer.workingHours,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey.shade300),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LawyerDetailScreen(lawyer: lawyer)),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              minimumSize: Size(double.infinity, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Detail",
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}