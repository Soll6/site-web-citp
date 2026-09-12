import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class RealisationsScreen extends StatelessWidget {
  const RealisationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_header(), _filtres(), _grid()]),
    );
  }

  Widget _header() => Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Portfolio • 2014 — 2025'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
              const SizedBox(height: 8),
              Text('Les Réalisations Qui Façonnent la Nation', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
              const SizedBox(height: 8),
              Text('Supervisés selon standards internationaux avec traçabilité intégrale et maîtrise rigoureuse des délais.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF))),
            ]),
          ),
        ),
      );

  Widget _filtres() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Wrap(spacing: 8, children: [
              _chip('Tous les Ouvrages', true),
              _chip('Grand Libreville', false),
              _chip('Moyen-Ogooué', false),
              _chip('Estuaire & Transfrontaliers', false),
            ]),
          ),
        ),
      );

  Widget _chip(String t, bool active) => Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: active ? AppColors.primary : Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: active ? AppColors.primary : const Color(0xFFE2E8F0))), child: Text(t, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: active ? Colors.white : AppColors.primary)));

  Widget _grid() => Container(
        color: const Color(0xFFF2F3FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 900;
              return Wrap(spacing: 16, runSpacing: 16, children: [
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.59 : c.maxWidth, child: _cardLarge()),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.39 : c.maxWidth, child: _card('Bifoun – Lambaréné • 87 km', 'Axe Structurant', 'Modernisation RN1 avec drainage profond et ouvrages d\'art.', 'Moyen-Ogooué', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG614SFko3Oh4UWN_fXfkchU9RfUgiIFDzBNsLjP9wvyTjM89RtL_PyLZkQ4AiC2Su5r-H1ky8iaSLuQ7mTnz1WFLpkMNi4dXyTqa2Jk7oW7J3v7G0kyfmh93U9eeiFiWybxWshARiif45PCTyGHrV2EIVl2Khfrc_T1bSu6XfvgcjpaWafcptQsSWL8m9XWOVxrwqtbE4ET6BB8cJheadN1obQLO-iIJcclT0oUyRWvQUh197I9urnw', 'Réceptionné')),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.49 : c.maxWidth, child: _card('Ntoum – Cocobeach • 83 km', 'Corridor Transfrontalier', 'Désenclavement littoral, sols latéritiques, pontons.', 'Estuaire', 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-T2dM8TtbHmgVJJwAZx27rCQmyWvHlOFbY9_JOvSj12NG7VFWJHRkRaSoKb0Ef3lTXPBqtdfywDFjduBN-Am1joEGToaRtdmORJHe1aghklzG1f7cVohbQpVOvHUDBXP7TvwyqV2LqVcl1MBcFDuJIrdUPTPvhcYbvgQ7UFpA4lQ7V9qFZMwZ-OjFJV6z0LWMZbXmioF-2ZTY5VfFM0QAHkwkdoe4vIYZjv2J26fSL86zzGCjHvP2XA', 'Tranche 1')),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.49 : c.maxWidth, child: _card('Gymnases d\'Élite • 5000 places', 'Infrastructures Sportives', 'Charpentes métalliques, toitures thermo-acoustiques.', 'National', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmjOlHbYuGlMoYK_PXptb6UcVTmW_ATjPPHc3SqF9j4YK8leF_12tphin9oQaOuu5CenaI2Txk490x0LQIPDTrp585XIP8KtkofG2LqDZvX0pI9U_RdEEIOs45JaIvIn9LxXHH8Cz0mGq1mq1sMFKzjjEe-Jg0OjU2hb-4Ia9NW6wUSW6M3AW9bKZAURPMOJQShJJM2DEY3kSQ3RhwolebEubxrqc-7i6I6WMH3qBDDke_Tx1sjDWrg', 'Inauguré')),
              ]);
            }),
          ),
        ),
      );

  Widget _cardLarge() => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuBl1fAGVBBevtkXEL2h1pDqqP3CV_igQpN9fDQYH_GDMIpbLkRBxIzRHvDVuPa3NKeDnw5VWdPG25HZZVGFVY_V00x7m_RALGS2DBaecGQvUbpXQXhnOde8hyMtYAbDHYjT0l6tV623gFJ_yuYw5DREXDAkbuBoM1OeaWQmzVbBUMEhmmjnTagLh1OCKGg1jfT6IXfdMGrU3mkAtY3_wdhJQABHLwVFhRWPDK5YvVJg6Syt-lUnTVJW_w', height: 260, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
            Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFF59E0B), borderRadius: BorderRadius.circular(20)), child: Text('98% • Chantier en finition', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white)))),
          ]),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Voiries du Grand Libreville • 32,4 km', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 8),
              Text('Terrassement, enrobé haute durabilité, collecteurs et éclairage photovoltaïque. Maître d\'ouvrage : État Gabonais.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.5)),
              const SizedBox(height: 12),
              LinearProgressIndicator(value: 0.982, backgroundColor: const Color(0xFFE2E7FF), color: AppColors.secondaryContainer),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Avancement physique', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)), Text('Livraison imminente', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary))]),
            ]),
          ),
        ]),
      );

  Widget _card(String title, String sur, String desc, String loc, String img, String badge) => Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.network(img, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
            Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(6)), child: Text(badge, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)))),
            Positioned(bottom: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(6)), child: Text(loc, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)))),
          ]),
          Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(sur.toUpperCase(), style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.secondary, letterSpacing: 0.8)), Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary)), const SizedBox(height: 6), Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))])),
        ]),
      );
}
