import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppFooter extends StatelessWidget {
  final void Function(String route) onNavigate;
  const AppFooter({super.key, required this.onNavigate});

  // Mapping des liens footer → routes (synchronisé avec AppHeader / Drawer)
  static const Map<String, String> _polesRoutes = {
    'Voiries Urbaines & Rocades': 'activites',
    'Bitumage & Revêtements': 'activites',
    'Ouvrages d\'Art & Ponts': 'realisations',
    'Drainage Hydraulique': 'activites',
    'Bâtiments Structurants': 'activites',
  };
  static const Map<String, String> _societeRoutes = {
    'À propos & Gouvernance': 'apropos',
    'Engagements RSE': 'rse',
    'Carrières & Recrutement': 'carrieres',
    'Actualités & Presse': 'actualites',
    'Contact & Siège': 'contact',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F3FF),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              LayoutBuilder(builder: (context, c) {
                final isDesktop = c.maxWidth > 900;
                return Wrap(
                  spacing: 48,
                  runSpacing: 32,
                  children: [
                    SizedBox(
                      width: isDesktop ? 300 : double.infinity,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFE2E8F0))), padding: const EdgeInsets.all(3), child: ClipRRect(borderRadius: BorderRadius.circular(3), child: Image.asset('assets/icon/citp-logo.png', fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.apartment, color: Color(0xFF001851), size: 18)))),
                          const SizedBox(width: 8),
                          Text('CITP GABON', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: AppColors.primary)),
                        ]),
                        const SizedBox(height: 12),
                        Text('Acteur de référence des grands travaux d\'infrastructures, de génie civil et de voiries au Gabon et en Afrique Centrale. Partenaire durable de la transformation nationale.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.6)),
                        const SizedBox(height: 16),
                        Text('CERTIFICATIONS & AGRÉMENTS', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.1, color: AppColors.secondary)),
                        const SizedBox(height: 4),
                        Text('ISO 9001 • ISO 14001 • ISO 45001 • Agrément Catégorie A+ BTP', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant)),
                      ]),
                    ),
                    _footerCol('Pôles de Compétences', ['Voiries Urbaines & Rocades', 'Bitumage & Revêtements', 'Ouvrages d\'Art & Ponts', 'Drainage Hydraulique', 'Bâtiments Structurants'], _polesRoutes),
                    _footerCol('Société', ['À propos & Gouvernance', 'Engagements RSE', 'Carrières & Recrutement', 'Actualités & Presse', 'Contact & Siège'], _societeRoutes),
                    SizedBox(
                      width: 280,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Siège - Libreville', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary)),
                        const SizedBox(height: 8),
                        _contactRow(Icons.location_on_outlined, '9CMX+XM7, Libreville', 'contact'),
                        _contactRow(Icons.phone_outlined, '066223075', 'contact'),
                        _contactRow(Icons.mail_outlined, 'contact@citp-gabon.com', 'contact'),
                        const SizedBox(height: 12),
                        Row(children: [
                          _social(Icons.language, 'home'),
                          const SizedBox(width: 8),
                          _social(Icons.share, 'actualites'),
                          const SizedBox(width: 8),
                          _socialCta(Icons.mail_outline, 'contact'),
                        ]),
                      ]),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFFC4C6D3)),
              const SizedBox(height: 16),
              LayoutBuilder(builder: (ctx, c) {
                final isNarrow = c.maxWidth < 600;
                if (isNarrow) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('© 2025 CITP Gabon S.A. • Tous droits réservés • Seydou Kane, Président Directeur Général', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Wrap(spacing: 8, children: [
                      _legalLink('Mentions légales', 'mentions'),
                      Text('•', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)),
                      _legalLink('Confidentialité', 'mentions'),
                    ]),
                  ]);
                }
                return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(child: Text('© 2025 CITP Gabon S.A. • Tous droits réservés • Seydou Kane, Président Directeur Général', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant))),
                  const SizedBox(width: 16),
                  Wrap(spacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
                    _legalLink('Mentions légales', 'mentions'),
                    Text('•', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)),
                    _legalLink('Confidentialité', 'mentions'),
                  ]),
                ]);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerCol(String title, List<String> items, Map<String, String> routes) {
    return SizedBox(
      width: 180,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title.toUpperCase(), style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary, letterSpacing: 0.5)),
        const SizedBox(height: 12),
        ...items.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _footerLink(e, routes[e] ?? 'home'),
            )),
      ]),
    );
  }

  Widget _footerLink(String label, String route) {
    return InkWell(
      onTap: () => onNavigate(route),
      borderRadius: BorderRadius.circular(4),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(label, style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.4)),
      ),
    );
  }

  Widget _legalLink(String label, String route) {
    return InkWell(
      onTap: () => onNavigate(route),
      borderRadius: BorderRadius.circular(4),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(label, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.primary, decoration: TextDecoration.underline, decorationColor: AppColors.primary.withValues(alpha: 0.4))),
      ),
    );
  }

  Widget _contactRow(IconData icon, String text, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: () => onNavigate(route),
        borderRadius: BorderRadius.circular(4),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(children: [
            Icon(icon, size: 16, color: AppColors.secondary),
            const SizedBox(width: 8),
            Expanded(child: Text(text, style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant))),
          ]),
        ),
      ),
    );
  }

  Widget _social(IconData icon, String route) {
    return InkWell(
      onTap: () => onNavigate(route),
      borderRadius: BorderRadius.circular(8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFC4C6D3))), child: Icon(icon, size: 16, color: AppColors.primary)),
      ),
    );
  }

  Widget _socialCta(IconData icon, String route) {
    return InkWell(
      onTap: () => onNavigate(route),
      borderRadius: BorderRadius.circular(8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: AppColors.secondaryContainer, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: AppColors.secondaryContainer.withValues(alpha: 0.3), blurRadius: 6, offset: const Offset(0, 2))]),
          child: Icon(icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}
