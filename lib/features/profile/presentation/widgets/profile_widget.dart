import 'package:flutter/material.dart';
import '../../data/models/profile_model.dart';

class ModernProfileCard extends StatelessWidget {
  final ProfileModel profile;

  const ModernProfileCard({Key? key, required this.profile}) : super(key: key);

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: Colors.green, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: Colors.green.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Foto Profil Besar
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF00E676), Color(0xFF1DE9B6)]),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
            ),
            child: Center(
              child: Text(
                profile.nama.substring(0, 1).toUpperCase(),
                style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Nama & Role
          Text(profile.nama, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Text(profile.role, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 32),
          const Divider(height: 1),
          const SizedBox(height: 32),
          // Detail Info
          _buildInfoRow(Icons.email_outlined, 'Email', profile.email),
          const SizedBox(height: 24),
          _buildInfoRow(Icons.business_outlined, 'Instansi', profile.instansi),
        ],
      ),
    );
  }
}