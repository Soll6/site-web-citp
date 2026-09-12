import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  final String activeRoute;
  final Function(String) onNavigate;
  const AppHeader({super.key, required this.activeRoute, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    return Container(
      color: AppColors.surfaceContainerLowest,
      width: double.infinity,
      child: Column(
        children: [
          // Flash banner
          Container(
            color: AppColors.primaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: [
                        Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                        const SizedBox(width: 6),
                        Text('Direct Chantier', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 0.8)),
                      ]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: GoogleFonts.inter(fontSize: 13, color: AppColors.surfaceContainerHigh),
                          children: [
                            TextSpan(text: 'Programme Grand Libreville : ', style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: const Color(0xFFFFDCBD), fontSize: 12)),
                            const TextSpan(text: 'Tronçon Alénakiri finalisé à 98% • Basculement fluide sur l\'Axe Bifoun–Lambaréné (PK 24).'),
                          ],
                        ),
                      ),
                    ),
                    if (isDesktop)
                      TextButton(
                        onPressed: () => onNavigate('realisations'),
                        child: Row(children: [
                          Text('Suivi des axes en direct', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFFFFDCBD))),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward, size: 14, color: Color(0xFFFFDCBD)),
                        ]),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Main header
          Container(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 12, vertical: 12),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: isDesktop
                    ? Row(
                        children: [
                          // Logo — taille fixe, ne s'étire pas
                          Row(children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6)]),
                              padding: const EdgeInsets.all(4),
                              child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset('assets/icon/citp-logo.png', fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.apartment_rounded, color: Color(0xFF001851), size: 22))),
                            ),
                            const SizedBox(width: 10),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('CITP GABON', style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary, letterSpacing: -0.2)),
                              Text('Consortium International de Travaux Publics', overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.onSurfaceVariant, letterSpacing: 0.4)),
                            ]),
                          ]),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ..._navItems.map((e) {
                                      final active = activeRoute == e.$1;
                                      final isContact = e.$1 == 'contact';
                                      if (isContact) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: FilledButton(
                                            onPressed: () => onNavigate(e.$1),
                                            style: FilledButton.styleFrom(
                                              backgroundColor: active ? AppColors.primary : AppColors.secondaryContainer,
                                              foregroundColor: Colors.white,
                                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                            ),
                                            child: Text(e.$2, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 11)),
                                          ),
                                        );
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                        child: TextButton(
                                          onPressed: () => onNavigate(e.$1),
                                          style: TextButton.styleFrom(
                                            backgroundColor: active ? AppColors.primary : Colors.transparent,
                                            foregroundColor: active ? Colors.white : AppColors.primary,
                                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                            minimumSize: const Size(0, 36),
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                          child: Text(e.$2, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600)),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          // Logo extensible — ne pousse plus le bouton hors écran
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6)]),
                                  padding: const EdgeInsets.all(3),
                                  child: ClipRRect(borderRadius: BorderRadius.circular(3), child: Image.asset('assets/icon/citp-logo.png', fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.apartment_rounded, color: Color(0xFF001851), size: 20))),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                                    Text('CITP GABON', maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.primary, letterSpacing: -0.2)),
                                    Text('Consortium International de Travaux Publics', maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.onSurfaceVariant, letterSpacing: 0.3)),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          FilledButton(
                            onPressed: () => onNavigate('contact'),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.secondaryContainer,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              minimumSize: const Size(0, 36),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text('Devis', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 12)),
                          ),
                          const SizedBox(width: 4),
                          // Bouton menu — zone tactile garantie 48x48, jamais rognée
                          Builder(
                            builder: (ctx) => Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Scaffold.of(ctx).openDrawer(),
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.menu, color: AppColors.primary, size: 26),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 9 entrées issues du Stitch originel "Site Web CITP Gabon" — Accueil (db6b825...)
  // Ordre exact Stitch: Accueil, À propos, Nos Métiers & Activités, Réalisations, Engagements RSE, Actualités & Presse, Carrières, Espace Marchés, Nous contacter
  static const _navItems = [
    ('home', 'Accueil'),
    ('apropos', 'À propos'),
    ('activites', 'Nos Métiers & Activités'),
    ('realisations', 'Réalisations'),
    ('rse', 'Engagements RSE'),
    ('actualites', 'Actualités & Presse'),
    ('carrieres', 'Carrières'),
    ('marches', 'Espace Marchés'),
    ('contact', 'Nous contacter'),
  ];
}
