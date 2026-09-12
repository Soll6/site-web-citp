import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AproposScreen extends StatelessWidget {
  const AproposScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _hero(),
        _motPdg(),
        _histoire(),
        _valeurs(),
        _certifs(),
        _gouvernance(),
      ]),
    );
  }

  Widget _hero() => Container(
        color: AppColors.primary,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [Icon(Icons.home, size: 14, color: AppColors.surfaceContainerHigh), const SizedBox(width: 6), Text('Accueil / À propos du CITP', style: GoogleFonts.inter(fontSize: 11, color: Colors.white70, letterSpacing: 0.8))]),
              const SizedBox(height: 20),
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(6)), child: Row(mainAxisSize: MainAxisSize.min, children: [Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle)), const SizedBox(width: 8), Text('Référence BTP & Génie Civil Gabonais'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1))])),
              const SizedBox(height: 16),
              Text('Bâtisseurs d\'infrastructures\nd\'envergure nationale et panafricaine', style: GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1)),
              const SizedBox(height: 12),
              ConstrainedBox(constraints: const BoxConstraints(maxWidth: 700), child: Text('Depuis plus de deux décennies, le CITP façonne l\'ossature routière, hydraulique et structurelle du Gabon avec maîtrise technique sans compromis.', style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFFE2E7FF), height: 1.6))),
            ]),
          ),
        ),
      );

  Widget _motPdg() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 900;
              return isDesktop
                  ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _portrait()), const SizedBox(width: 32), Expanded(flex: 2, child: _vision())])
                  : Column(children: [_portrait(), const SizedBox(height: 24), _vision()]);
            }),
          ),
        ),
      );

  Widget _portrait() => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/Seydou Kane.png',
              height: 420,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.96), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(6)),
                    child: Text('Fondateur & PDG', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                  const SizedBox(height: 6),
                  Text('Seydou Kane', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.primary)),
                  Text('Président Directeur Général — CITP Gabon S.A.', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant)),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _vision() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Container(width: 40, height: 3, color: AppColors.secondaryContainer), const SizedBox(width: 12), Text('Vision Stratégique & Engagement'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2, color: AppColors.secondary))]),
        const SizedBox(height: 12),
        Text('« Construire le Gabon n\'est pas un simple métier, c\'est une responsabilité patriotique. »', style: GoogleFonts.plusJakartaSans(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.primary, height: 1.25)),
        const SizedBox(height: 16),
        Text('Le Consortium International de Travaux Publics a gravi chaque échelon de la complexité technique pour devenir le bras armé opérationnel des grands défis de modernisation du Gabon. Notre adhésion à la FEG en février 2023 illustre notre volonté d\'ancrer le privé national dans la transparence et le patriotisme économique.', style: GoogleFonts.inter(fontSize: 14, color: AppColors.onSurfaceVariant, height: 1.7)),
        const SizedBox(height: 12),
        Text('Nous coopérons aux côtés de l\'État gabonais, de la BAD et des institutions sous-régionales pour garantir des chantiers à fort impact social. Notre force repose sur les femmes et hommes de notre pays : ingénieurs, géomètres, conducteurs d\'engins.', style: GoogleFonts.inter(fontSize: 14, color: AppColors.onSurfaceVariant, height: 1.7)),
      ]);

  Widget _histoire() => Container(
        color: const Color(0xFFF2F3FF),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(children: [
              Text('L\'Épopée Technique du CITP', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 24),
              LayoutBuilder(builder: (ctx, c) {
                final cols = c.maxWidth > 900 ? 4 : c.maxWidth > 600 ? 2 : 1;
                return GridView.count(crossAxisCount: cols, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.85, children: [
                  _jalon('2006', 'Fondation & Premiers Ouvrages', 'Création du Consortium avec flotte initiale de terrassement.', Icons.foundation),
                  _jalon('2014', 'Modernisation du Parc', 'Centrale d\'enrobage 160 T/h et ateliers de concassage.', Icons.engineering),
                  _jalon('2019', 'Voiries du Grand Libreville', 'Rocades, axes interurbains, ouvrages d\'art antisismiques.', Icons.route),
                  _jalonDark('2023-2026', 'Adhésion FEG & Cap Panafricain', 'Triplement des capacités, certification QSE.', Icons.workspace_premium),
                ]);
              }),
            ]),
          ),
        ),
      );

  Widget _jalon(String year, String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(year, style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.secondaryContainer)), Icon(icon, color: AppColors.primaryContainer)]),
          const SizedBox(height: 12),
          Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)),
        ],
      ),
    );
  }

  Widget _jalonDark(String year, String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(year, style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.secondaryContainer)), Icon(icon, color: Colors.white70)]),
          const SizedBox(height: 12),
          Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 12, color: Colors.white70, height: 1.5)),
        ],
      ),
    );
  }

  Widget _valeurs() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(children: [
              Text('Les 4 Piliers de l\'Excellence CITP', textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 24),
              LayoutBuilder(builder: (ctx, c) {
                final cols = c.maxWidth > 900 ? 4 : 2;
                final w = (c.maxWidth - 16 * (cols - 1)) / cols;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(width: w, child: _valeur(Icons.precision_manufacturing, 'Excellence Technique', 'Application stricte des Eurocodes et normes routières internationales.')),
                    SizedBox(width: w, child: _valeur(Icons.shield_outlined, 'Sécurité Absolue', 'Politique Zéro Accident, EPI obligatoire sur chaque front.')),
                    SizedBox(width: w, child: _valeur(Icons.school_outlined, 'Capital Humain', '87% d\'encadrement national, académies de conduite d\'engins.')),
                    SizedBox(width: w, child: _valeur(Icons.nature_people, 'Intégrité & RSE', 'Respect de l\'écosystème équatorial, replantation compensatoire.')),
                  ],
                );
              }),
            ]),
          ),
        ),
      );

  Widget _valeur(IconData i, String t, String d) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)), child: Icon(i, color: Colors.white, size: 22)),
          const SizedBox(height: 10),
          Text(t, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary)),
          const SizedBox(height: 6),
          Text(d, style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant, height: 1.5)),
        ]),
      );
  Widget _certifs() => Container(
        color: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isNarrow = c.maxWidth < 750;
              final left = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Garantie de Conformité Internationale'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer, letterSpacing: 1)),
                const SizedBox(height: 6),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text('Accréditations & Agréments d\'État', maxLines: 1, style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)),
                ),
                const SizedBox(height: 6),
                Text('Système de management répondant aux critères Banque Mondiale, BAD, AFD.', style: GoogleFonts.inter(fontSize: 13, color: Colors.white70)),
              ]);
              final right = Wrap(spacing: 12, runSpacing: 12, children: [
                _cert('Agrément BTP A+', 'Ministère des Travaux Publics'),
                _cert('ISO 9001:2015', 'Management Qualité'),
                _cert('ISO 14001:2015', 'Management Environnemental'),
                _cert('ISO 45001', 'Santé & Sécurité'),
              ]);
              if (isNarrow) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [left, const SizedBox(height: 20), right]);
              }
              return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [Expanded(child: left), const SizedBox(width: 24), Expanded(child: right)]);
            }),
          ),
        ),
      );

  Widget _cert(String t, String d) => Container(
        width: 220,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Text(t, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 12)),
          const SizedBox(height: 2),
          Text(d, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, color: Colors.white70)),
        ]),
      );

  Widget _gouvernance() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(children: [
              Text('Gouvernance & Pôles Stratégiques', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 24),
              Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)), child: Column(children: [Text('Présidence Direction Générale'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer, letterSpacing: 1)), Text('Seydou Kane — Pilotage exécutif, Marchés Stratégiques & Relations FEG / État', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: Colors.white))])),
              const SizedBox(height: 24),
              LayoutBuilder(builder: (ctx, c) {
                final cols = c.maxWidth > 900 ? 4 : c.maxWidth > 600 ? 2 : 1;
                return GridView.count(crossAxisCount: cols, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.1, children: [
                  _pole(Icons.architecture, 'Pôle Ingénierie', 'Direction Technique & Études', 'BIM routière, drones LiDAR, géotechnique.'),
                  _pole(Icons.commute, 'Pôle Déploiement', 'Direction Chantiers & Matériel', 'Logistique lourde, maintenance parcs machines.'),
                  _pole(Icons.verified_user, 'Pôle Conformité', 'Direction QHSE & Normes', 'Sécurité chantier, audits ISO.'),
                  _pole(Icons.volunteer_activism, 'Pôle Impact', 'RSE & Fondation', 'Insertion jeunes, écoles, bourses.'),
                ]);
              }),
            ]),
          ),
        ),
      );

  Widget _pole(IconData i, String s, String t, String d) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(i, color: AppColors.primary, size: 20), const SizedBox(width: 8), Text(s.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondary))]), const SizedBox(height: 8), Text(t, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary, fontSize: 13)), const SizedBox(height: 6), Text(d, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))]));
}
