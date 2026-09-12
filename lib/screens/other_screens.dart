import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class RseScreen extends StatelessWidget {
  const RseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: AppColors.primary,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Fondation Seydou Kane • RSE'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
                Text('Engagements RSE', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
                Text('Bâtir un modèle éthique, inclusif et durable pour le Gabon.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF))),
              ]),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Wrap(spacing: 16, runSpacing: 16, children: [
                _rseCard(Icons.school, 'Valorisation des Talents Gabonais', '85% d\'équipes locales, académies de conduite, bourses USTM.', const Color(0xFFFFDCBD)),
                _rseCard(Icons.eco, 'Rigueur Écologique', 'Recyclage agrégats, réhabilitation carrières, bilan carbone.', const Color(0xFFDCFCE7)),
                _rseCard(Icons.favorite, 'Solidarité Communautaire', '12 écoles réhabilitées, adduction d\'eau, matériel didactique.', const Color(0xFFE0F2FE)),
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _rseCard(IconData i, String t, String d, Color c) => Container(width: 360, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))), child: Column(children: [Container(width: 48, height: 48, decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)), child: Icon(i, color: AppColors.primary)), const SizedBox(height: 12), Text(t, textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary)), const SizedBox(height: 8), Text(d, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))]));
}

class MarchesScreen extends StatelessWidget {
  const MarchesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          color: AppColors.primary,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Commande Publique • AO'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
                Text('Espace Marchés', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
                Text('Appels d’offres, consultations et marchés publics — conformité Code des Marchés Gabonais.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF))),
              ]),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _marcheCard('AO-2025-012 — Voiries Alénakiri Phase 2', 'Enrobés 0/14 • Bordures T2 • Assainissement', 'Clôture: 30 Sept 2025', const Color(0xFF059669), 'Ouvert'),
                const SizedBox(height: 16),
                _marcheCard('AO-2025-009 — Bifoun–Lambaréné PK24-48', 'Terrassement • Grave-bitume • Signalisation', 'Clôture: 15 Oct 2025', const Color(0xFF0284C7), 'Consultation'),
                const SizedBox(height: 16),
                _marcheCard('AO-2025-007 — Drainage Estuaire', 'Dalots 2x2m • Buses Ø1000 • Enrochement', 'Clôture: 05 Nov 2025', const Color(0xFF8A5100), 'À venir'),
                const SizedBox(height: 24),
                Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.info_outline, color: AppColors.primary), const SizedBox(width: 12), Expanded(child: Text('Dossiers à retirer au Siège 9CMX+XM7, Libreville ou via contact@citp-gabon.com — caution 500 000 FCFA — Tél. 066223075.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.5)))])),
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _marcheCard(String title, String desc, String date, Color badgeColor, String badge) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Flexible(child: Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary))), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6)), child: Text(badge, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)))]),
          const SizedBox(height: 8),
          Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 6),
          Text(date, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondary)),
        ]),
      );
}

class MentionsScreen extends StatelessWidget {
  const MentionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Mentions Légales & Confidentialité', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)),
              const SizedBox(height: 16),
              Text('CITP Gabon S.A. • RCCM 1234 Libreville • Agrément BTP Catégorie A+ • Siège : 9CMX+XM7, Libreville.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.6)),
              const SizedBox(height: 24),
              _section('Éditeur', 'CITP Gabon S.A., société anonyme au capital de 500 000 000 FCFA, présidée par Seydou Kane. Hébergement : Gabon Telecom.'),
              _section('Données Personnelles', 'Conformité Loi Gabonaise n°025/2023. Données collectées uniquement via formulaire de contact, conservées 24 mois, droits d\'accès via contact@citp-gabon.com.'),
              _section('Cookies', 'Cookies strictement nécessaires au fonctionnement. Aucun traceur publicitaire.'),
              _section('Propriété Intellectuelle', 'Contenus (photos chantiers, plans, textes) propriété CITP. Reproduction interdite sans accord écrit.'),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _section(String t, String d) => Padding(padding: const EdgeInsets.only(bottom: 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: AppColors.primary)), const SizedBox(height: 6), Text(d, style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.6))]));
}
