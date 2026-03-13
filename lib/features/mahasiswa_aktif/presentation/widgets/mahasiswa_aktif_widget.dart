import 'package:flutter/material.dart';
import 'package:mobileprak/core/constants/constants.dart';
import 'package:mobileprak/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class ModernMahasiswaAktifCard extends StatefulWidget {
  final MahasiswaAktifModel mahasiswaAktif;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernMahasiswaAktifCard({Key? key, required this.mahasiswaAktif, this.onTap, this.gradientColors}) : super(key: key);

  @override
  State<ModernMahasiswaAktifCard> createState() => _ModernMahasiswaAktifCardState();
}

class _ModernMahasiswaAktifCardState extends State<ModernMahasiswaAktifCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    _scale = Tween<double>(begin: 1.0, end: 0.97).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradientColors ?? [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.8)];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: colors[0].withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))],
            border: Border.all(color: colors[0].withOpacity(0.08)),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(gradient: LinearGradient(colors: colors), shape: BoxShape.circle),
                child: Center(
                  child: widget.mahasiswaAktif.title.isNotEmpty
                      ? Text(widget.mahasiswaAktif.title.substring(0, 1).toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))
                      : const Icon(Icons.article, color: Colors.white),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.mahasiswaAktif.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                    Text(widget.mahasiswaAktif.body, style: TextStyle(fontSize: 13, color: Colors.grey[700]), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswaAktif;
  final VoidCallback? onTap;

  const MahasiswaAktifCard({Key? key, required this.mahasiswaAktif, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: mahasiswaAktif.title.isNotEmpty ? Text(mahasiswaAktif.title.substring(0, 1).toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)) : const Icon(Icons.article, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mahasiswaAktif.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Text(mahasiswaAktif.body, style: TextStyle(fontSize: 13, color: Colors.grey[700]), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaAktifEmptyState extends StatelessWidget {
  final VoidCallback? onRefresh;

  const MahasiswaAktifEmptyState({Key? key, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(padding: const EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle), child: Icon(Icons.article_outlined, size: 64, color: Colors.grey[400])),
          const SizedBox(height: 24),
          const Text('Tidak ada data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey)),
          const SizedBox(height: 8),
          Text('Belum ada postingan yang tersedia', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
          if (onRefresh != null) ...[const SizedBox(height: 24), ElevatedButton.icon(onPressed: onRefresh, icon: const Icon(Icons.refresh), label: const Text('Refresh'))]
        ],
      ),
    );
  }
}

class MahasiswaAktifListView extends StatelessWidget {
  final List<MahasiswaAktifModel> list;
  final VoidCallback onRefresh;
  final bool useModernCard;

  const MahasiswaAktifListView({Key? key, required this.list, required this.onRefresh, this.useModernCard = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return MahasiswaAktifEmptyState(onRefresh: onRefresh);

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          if (useModernCard) {
            return ModernMahasiswaAktifCard(mahasiswaAktif: item, onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Detail: ${item.title}'))));
          }
          return MahasiswaAktifCard(mahasiswaAktif: item, onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Detail: ${item.title}'))));
        },
      ),
    );
  }
}