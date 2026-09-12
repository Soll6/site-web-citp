import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CarrieresScreen extends StatelessWidget {
  const CarrieresScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_header(), _postes(), _avantages()]),
    );
  }

  Widget _header() => Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 800;
              return isDesktop
                  ? Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Recrutement • 12 postes ouverts'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
                        const SizedBox(height: 8),
                        Text('Construisez Votre Avenir\navec le Leader du BTP Gabonais', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1)),
                        const SizedBox(height: 12),
                        Text('Rejoignez 1 200 collaborateurs qui transforment le Gabon. Formation, sécurité Zéro Accident et évolution CEMAC.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF), height: 1.6)),
                      ])),
                      const SizedBox(width: 32),
                      ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCLhuR7vo0bQOTK1NcpZrVDWCnvCT-Kgo97a3sdG2aUQuVMYOgY9mdB7-lNolQqcT0iaDixvMzjZzWVOalOomwQQO-3Kcr7otqgxuUJUmE0Rsq9ldcKHWARSKw5l9mok16fJMmhfXXhw4DoJ-0sYwVfMqP31ATd3P3Cj0ry1CBIuPevNtimX4qjHU0VgZ4a2ouA2XSPfK0UQoIJaJ5ZQPaw7ljT4RyfMO-7wO6osXUydNJJjbTBMh2drQ', width: 420, height: 260, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
                    ])
                  : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Recrutement • 12 postes ouverts'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer)),
                      Text('Construisez Votre Avenir avec le Leader du BTP Gabonais', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
                    ]);
            }),
          ),
        ),
      );

  Widget _postes() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Postes à Pourvoir', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 16),
              LayoutBuilder(builder: (ctx, c) {
                final cols = c.maxWidth > 900 ? 2 : 1;
                return GridView.count(crossAxisCount: cols, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: cols == 2 ? 2.6 : 2.0, children: [
                  _poste('Ingénieur Géotechnique', 'Libreville • CDI', 'Laboratoire interne • Sondages • Formulation enrobés', Icons.engineering),
                  _poste('Conducteur de Centrale d\'Enrobage', 'Owendé • CDI', '240 T/h • Maintenance • QSE', Icons.precision_manufacturing),
                  _poste('Chef de Chantier VRD', 'Grand Libreville • CDI', 'Voiries urbaines • 32 km • Management équipe', Icons.construction),
                  _poste('Topographe LiDAR / Drone', 'Ntoum • CDI', 'BIM routière • Relevés • Modélisation', Icons.map_outlined),
                  _poste('Responsable QHSE', 'Siège • CDI', 'ISO 45001 • Audits • Zéro Accident', Icons.health_and_safety_outlined),
                  _poste('Géomètre Projeteur', 'Lambaréné • CDD', 'Tracés • Cubatures • DAO', Icons.architecture),
                ]);
              }),
            ]),
          ),
        ),
      );

  Widget _poste(String title, String loc, String desc, IconData icon) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: Colors.white, size: 20)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary, fontSize: 13)), Text(loc, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondary)), Text(desc, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant))])),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.secondaryContainer,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            child: const Text('Postuler', maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ]),
      );

  Widget _avantages() => Container(
        color: const Color(0xFFF2F3FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(children: [
              Text('Pourquoi Rejoindre le CITP ?', style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 20),
              LayoutBuilder(builder: (ctx, c) {
                return Wrap(spacing: 16, runSpacing: 16, children: [
                  SizedBox(width: c.maxWidth > 900 ? (c.maxWidth - 32) / 3 : c.maxWidth, child: _av(Icons.school_outlined, 'Formation Continue', 'Académies de conduite d\'engins et mentorat USTM/Masuku.')),
                  SizedBox(width: c.maxWidth > 900 ? (c.maxWidth - 32) / 3 : c.maxWidth, child: _av(Icons.shield_outlined, 'Sécurité Zéro Accident', 'EPI, quart d\'heure sécurité quotidien et audits inopinés.')),
                  SizedBox(width: c.maxWidth > 900 ? (c.maxWidth - 32) / 3 : c.maxWidth, child: _av(Icons.public, 'Carrière Panafricaine', 'Mobilité CEMAC et projets BAD d\'envergure.')),
                ]);
              }),
            ]),
          ),
        ),
      );

  Widget _av(IconData i, String t, String d) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(children: [Icon(i, color: AppColors.secondaryContainer, size: 28), const SizedBox(height: 8), Text(t, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary)), const SizedBox(height: 6), Text(d, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))]));
}
