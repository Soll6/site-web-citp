import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ActualitesScreen extends StatelessWidget {
  const ActualitesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_header(), _grid()]),
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
              Text('Revue de Presse • 2024-2025'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
              Text('Actualités & Presse Institutionnelle', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
              Text('Suivez l\'actualité des grands chantiers et la couverture médiatique nationale et internationale.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF))),
            ]),
          ),
        ),
      );

  Widget _grid() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final cols = c.maxWidth > 900 ? 3 : c.maxWidth > 600 ? 2 : 1;
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: cols == 1 ? 0.95 : 0.82,
                children: [
                  _article('Gabon Review', '12 Février 2025', 'Voiries du Grand Libreville : le CITP accélère la cadence sur Alénakiri', 'Les usagers saluent la métamorphose rapide du réseau d\'assainissement et la qualité des enrobés...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfS23aCuXC-m5EU6g3qX-kIAeiCQA2JyprZisFHD59Wo8xis0cdnYbreudtKc75FRes1BHHxwbj19YlQNl-pdq_1LrEcP-Zn68CQFZr3M_7pOgxhWe8hQhblJZJyMBiP-LLAu3ri3Zi9_DFWBF6OFWnO1NiO5PR2PONhY3Ja7aByFaQyTdmOaKk01MsdELGS341tvIrWFPo3JsPH1zXZ5by8AM5DI2XjFXX1IRpMARtB_pOAx0IYX5XA'),
                  _article('Forbes Afrique', 'Janvier 2025 • 7 min', 'Infrastructures en Afrique Centrale : La méthode CITP sous la conduite de Seydou Kane', 'Dans un dossier rétrospectif consacré à l\'accélération des axes stratégiques gabonais, Forbes Afrique décrypte comment le CITP redéfinit les standards de souveraineté logistique, le respect strict des calendriers d\'exécution et le transfert de compétences de haute ingénierie sur le sol national.', 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?auto=format&fit=crop&w=800&q=80'),
                  _article('L\'Union', '28 Déc 2024', 'Moyen-Ogooué : Réception technique réussie Bifoun–Lambaréné', 'Le ministre des Travaux Publics salue la rigueur technique et la conformité aux normes internationales...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG614SFko3Oh4UWN_fXfkchU9RfUgiIFDzBNsLjP9wvyTjM89RtL_PyLZkQ4AiC2Su5r-H1ky8iaSLuQ7mTnz1WFLpkMNi4dXyTqa2Jk7oW7J3v7G0kyfmh93U9eeiFiWybxWshARiif45PCTyGHrV2EIVl2Khfrc_T1bSu6XfvgcjpaWafcptQsSWL8m9XWOVxrwqtbE4ET6BB8cJheadN1obQLO-iIJcclT0oUyRWvQUh197I9urnw'),
                  _article('Direct Infos Gabon', '15 Nov 2024', 'Ntoum–Cocobeach : désenclavement du littoral nord', 'Traitement des sols marécageux et pontons de franchissement d\'estuaires salués...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-T2dM8TtbHmgVJJwAZx27rCQmyWvHlOFbY9_JOvSj12NG7VFWJHRkRaSoKb0Ef3lTXPBqtdfywDFjduBN-Am1joEGToaRtdmORJHe1aghklzG1f7cVohbQpVOvHUDBXP7TvwyqV2LqVcl1MBcFDuJIrdUPTPvhcYbvgQ7UFpA4lQ7V9qFZMwZ-OjFJV6z0LWMZbXmioF-2ZTY5VfFM0QAHkwkdoe4vIYZjv2J26fSL86zzGCjHvP2XA'),
                  _article('Gabon Media Time', '02 Oct 2024', 'Gymnases d\'élite : livraison et homologation FIBA', 'Infrastructures sportives livrées avec toitures thermo-acoustiques et 5000 places...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmjOlHbYuGlMoYK_PXptb6UcVTmW_ATjPPHc3SqF9j4YK8leF_12tphin9oQaOuu5CenaI2Txk490x0LQIPDTrp585XIP8KtkofG2LqDZvX0pI9U_RdEEIOs45JaIvIn9LxXHH8Cz0mGq1mq1sMFKzjjEe-Jg0OjU2hb-4Ia9NW6wUSW6M3AW9bKZAURPMOJQShJJM2DEY3kSQ3RhwolebEubxrqc-7i6I6WMH3qBDDke_Tx1sjDWrg'),
                  _article('Le Nouveau Gabon', '18 Sep 2024', 'RSE : la Fondation Seydou Kane équipe 12 écoles', 'Dons de matériel didactique et bourses d\'études pour riverains des chantiers...', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCLhuR7vo0bQOTK1NcpZrVDWCnvCT-Kgo97a3sdG2aUQuVMYOgY9mdB7-lNolQqcT0iaDixvMzjZzWVOalOomwQQO-3Kcr7otqgxuUJUmE0Rsq9ldcKHWARSKw5l9mok16fJMmhfXXhw4DoJ-0sYwVfMqP31ATd3P3Cj0ry1CBIuPevNtimX4qjHU0VgZ4a2ouA2XSPfK0UQoIJaJ5ZQPaw7ljT4RyfMO-7wO6osXUydNJJjbTBMh2drQ'),
                ],
              );
            }),
          ),
        ),
      );

  Widget _article(String source, String date, String title, String excerpt, String img) {
    final isForbes = source == 'Forbes Afrique';
    return Container(
        decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), child: Image.network(img, height: 160, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)), child: Text(source, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary))), Flexible(child: Text(date, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)))]),
              if (isForbes) ...[
                const SizedBox(height: 8),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFFDCBD), borderRadius: BorderRadius.circular(20)), child: Text('Édition Spéciale • Enquête Exclusive', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary))),
              ],
              const SizedBox(height: 10),
              Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.primary, height: 1.3)),
              const SizedBox(height: 8),
              Text(excerpt, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)),
              if (isForbes) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E7FF))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Expanded(child: Column(children: [Text('100%', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 16)), Text('Maîtrise d’œuvre directe', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 10, color: AppColors.onSurfaceVariant))])),
                    Container(width: 1, height: 36, color: const Color(0xFFE2E8F0)),
                    Expanded(child: Column(children: [Text('+85%', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: AppColors.secondaryContainer, fontSize: 16)), Text('Main-d’œuvre gabonaise', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 10, color: AppColors.onSurfaceVariant))])),
                  ]),
                ),
              ],
              const SizedBox(height: 12),
              Row(children: [Text('Lire l\'article', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer)), const Icon(Icons.north_east, size: 14, color: AppColors.secondaryContainer)]),
            ]),
          ),
        ]),
      );
  }
}
