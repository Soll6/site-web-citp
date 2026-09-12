import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ActivitesScreen extends StatelessWidget {
  const ActivitesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_header(), _gridDomaines(), _capacites()]),
    );
  }

  Widget _header() => Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Pôles d\'Excellence Technique'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
              const SizedBox(height: 8),
              Text('Maîtrise Complète de la Chaîne des Travaux Publics', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1)),
              const SizedBox(height: 12),
              ConstrainedBox(constraints: const BoxConstraints(maxWidth: 720), child: Text('De l\'étude géotechnique à l\'enrobé tropical, le CITP opère en maîtrise intégrée avec centrales autonomes et parcs d\'engins propriétaires.', style: GoogleFonts.inter(fontSize: 15, color: const Color(0xFFE2E7FF), height: 1.6))),
            ]),
          ),
        ),
      );

  Widget _gridDomaines() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final cols = c.maxWidth > 900 ? 2 : 1;
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: cols == 2 ? 1.35 : 1.15,
                children: [
                  _activCard('Aménagement Urbain', 'Pavage haute résistance • Bordures • Drainage urbain', 'Libreville • Alénakiri • Nzeng-Ayong', Icons.architecture, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfS23aCuXC-m5EU6g3qX-kIAeiCQA2JyprZisFHD59Wo8xis0cdnYbreudtKc75FRes1BHHxwbj19YlQNl-pdq_1LrEcP-Zn68CQFZr3M_7pOgxhWe8hQhblJZJyMBiP-LLAu3ri3Zi9_DFWBF6OFWnO1NiO5PR2PONhY3Ja7aByFaQyTdmOaKk01MsdELGS341tvIrWFPo3JsPH1zXZ5by8AM5DI2XjFXX1IRpMARtB_pOAx0IYX5XA'),
                  _activCard('Routes & Enrobés', 'BBSG haut module • Géotextile • 87,0 km revêtus — Co-financement BAD/État', 'Bifoun – Lambaréné • 87 km • Réceptionné 100%', Icons.directions_car, 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?auto=format&fit=crop&w=800&q=80'),
                  _activCard('Drainage & Hydraulique', 'Dalots • Buses armées • Bassins de rétention', 'Grand Libreville • Estuaire', Icons.water_drop_outlined, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCKO7x_2ZNkqowB92FaWdZH1l0TRnu1RdB6aB1ZHDQnurZnpO4fA_mgHT37G6zCBmU5Bo6abFcv-j4FmmjfdeGxxhVAw35QFAp3nMM3S9X-GP6cHOq7OAlbrxZn9Myy174N_paCqoeIp0aVRqjx0fJnnwrY5C7o33t02YHTryeeEDB-6gv0SJd1TMvhYktKLriLAqdwlbek1Hencj8hc00CetO0MzEpIaGr_tP8qJ7hoQ7kjA_jE2ZLoA'),
                  _activCard('Bâtiments Structurants', 'Gymnases 5000 places • Terminaux logistiques', 'Complexes sportifs • Zones franches', Icons.stadium, 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3dRluy-snOHSC6vuCMtlpUCOqI4qsXV1i11tYdI3sonGm7exwpLz28GUqlS1CJXiU1MUiLhqWl5xIt4suQrY3qZy2bUS6_3RfEcZaJgspm6u4zW5JDIH6kWjbfMfDzNb5z0HVfJfgC0z7Vdwxvg_pH2yrfm-rpt3PrZiqTYyyxfle0Hgdhhf6zUUMbM-f47joyiRPElQDHENTft3WeUjDbHq8mNvYBtIQzOkDTZ1Yfpdo0mzCcx5_2A'),
                ],
              );
            }),
          ),
        ),
      );

  Widget _activCard(String title, String subtitle, String loc, IconData icon, String img) {
    final isBifoun = title == 'Routes & Enrobés';
    return Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), child: Image.network(img, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [Icon(icon, size: 16, color: AppColors.secondaryContainer), const SizedBox(width: 6), Expanded(child: Text(loc.toUpperCase(), overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.onSurfaceVariant)))]),
              const SizedBox(height: 8),
              Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary)),
              Text(subtitle, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondary)),
              const SizedBox(height: 8),
              Text(isBifoun
                  ? 'Reconstruction lourde avec pose d’enrobé à chaud haut module (BBSG), stabilisation géotextile contre l’érosion équatoriale et reprofilage des courbes accidentogènes. 87,0 km — 100% opérationnel, co-financement BAD/État.'
                  : 'Maîtrise intégrée : études, terrassements, enrobés et contrôle géotechnique interne pour garantir tenue sous climat équatorial.', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)),
              if (isBifoun) ...[
                const SizedBox(height: 10),
                Wrap(spacing: 6, runSpacing: 6, children: [
                  _miniChip('87,0 km revêtus'),
                  _miniChip('BAD/État'),
                  _miniChip('100% réceptionné'),
                ]),
              ],
            ]),
          ),
        ]),
      );
  }

  Widget _miniChip(String t) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFFDCBD), borderRadius: BorderRadius.circular(20)), child: Text(t, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary)));

  Widget _capacites() => Container(
        color: const Color(0xFFF2F3FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isNarrow = c.maxWidth < 600;
              if (isNarrow) {
                return Wrap(
                  alignment: WrapAlignment.spaceAround,
                  spacing: 16,
                  runSpacing: 24,
                  children: [
                    SizedBox(width: (c.maxWidth / 2) - 24, child: _cap('450+', 'km de voirie livrés')),
                    SizedBox(width: (c.maxWidth / 2) - 24, child: _cap('240 T/h', 'Centrales d\'enrobage')),
                    SizedBox(width: (c.maxWidth / 2) - 24, child: _cap('185', 'Engins propriétaires')),
                    SizedBox(width: (c.maxWidth / 2) - 24, child: _cap('100%', 'Traçabilité laboratoire')),
                  ],
                );
              }
              return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _cap('450+', 'km de voirie livrés'),
                _cap('240 T/h', 'Centrales d\'enrobage'),
                _cap('185', 'Engins propriétaires'),
                _cap('100%', 'Traçabilité laboratoire'),
              ]);
            }),
          ),
        ),
      );

  Widget _cap(String v, String l) => Column(mainAxisSize: MainAxisSize.min, children: [Text(v, textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)), const SizedBox(height: 4), Text(l, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))]);
}
