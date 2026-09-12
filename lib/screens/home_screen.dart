import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _hero(context),
          _stats(),
          _domaines(),
          _projetsPhares(),
          _rse(),
          _presse(),
          _ctaFinal(),
        ],
      ),
    );
  }

  Widget _hero(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isDesktop = w >= 900;
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16, vertical: isDesktop ? 56 : 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: isDesktop
              ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(child: _heroLeft()),
                  const SizedBox(width: 40),
                  Expanded(child: _heroRight()),
                ])
              : Column(children: [_heroLeft(), const SizedBox(height: 24), _heroRight()]),
        ),
      ),
    );
  }

  Widget _heroLeft() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Wrap(spacing: 8, runSpacing: 8, children: [
        _badge(Icons.verified_outlined, 'Adhérent FEG'),
        _badge(Icons.handshake_outlined, 'Partenaire BAD • PASIG'),
        _badge(Icons.shield_outlined, 'ISO 9001 / 45001'),
      ]),
      const SizedBox(height: 16),
      Text('Consortium International de Travaux Publics'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: const Color(0xFFFFDCBD))),
      const SizedBox(height: 8),
      RichText(
        text: TextSpan(
          style: GoogleFonts.plusJakartaSans(fontSize: 44, fontWeight: FontWeight.w800, height: 1.08, color: Colors.white, letterSpacing: -0.5),
          children: [
            const TextSpan(text: 'Bâtir l\'Avenir,\n'),
            TextSpan(text: 'Connecter le Gabon.', style: GoogleFonts.plusJakartaSans(color: const Color(0xFFFC9910))),
          ],
        ),
      ),
      const SizedBox(height: 16),
      Text('Acteur souverain et partenaire stratégique de la République Gabonaise et des institutions multilatérales. Sous la direction de Seydou Kane, le CITP modernise le maillage routier, érige des ouvrages de haute technologie et déploie l\'excellence du génie civil africain.', style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFFE2E7FF), height: 1.6)),
      const SizedBox(height: 24),
      Wrap(spacing: 12, runSpacing: 12, children: [
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.construction, size: 18), label: const Text('Découvrir nos réalisations'), style: FilledButton.styleFrom(backgroundColor: AppColors.secondaryContainer, foregroundColor: Colors.white)),
        OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.feed_outlined, size: 18), label: const Text('Espace Marchés & Consultation'), style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white24))),
      ]),
      const SizedBox(height: 24),
      Row(children: [
        Row(children: [
          const CircleAvatar(radius: 14, backgroundColor: Color(0xFFFC9910), child: Text('GA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white))),
          _overlapAvatar('BAD', AppColors.primaryContainer),
          _overlapAvatar('FEG', const Color(0xFF00374F)),
        ]),
        const SizedBox(width: 12),
        Expanded(child: Text('Engagé aux côtés des plus grandes tutelles régaliennes et bailleurs panafricains.', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFE2E7FF)))),
      ]),
    ]);
  }

  static Widget _overlapAvatar(String t, Color c) {
    return Transform.translate(
      offset: const Offset(-6, 0),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(color: c, shape: BoxShape.circle, border: Border.all(color: AppColors.primary, width: 1.5)),
        child: Center(child: Text(t, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: Colors.white))),
      ),
    );
  }

  Widget _badge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(6)),
      child: Row(children: [Icon(icon, size: 14, color: AppColors.secondaryContainer), const SizedBox(width: 6), Text(text, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: const Color(0xFFE2E7FF)))]),
    );
  }

  Widget _heroRight() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(children: [
            Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuD6kP028LcDV8mZmAsFS9Xb3ka26bRNVV6zt8ru1N9OMZ_9F41j-iA3PTr2IQAXW8JnWAPg3QSG0GnCf5ZK79cbQKebJj6sqOxz_8iJnlpwpo1kldbCgNZR0EurnDfceggUTDoH-2P-VVVPRc5p8U_FCct1GKOY6jYORql761MY0JfdRgC8VHqjoXozROSmfleCmo7802JJP7UyDBVSgW5i1t_g4E0fFAhuPqlPFclhDmUH0sy-puJvNA', height: 380, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) ),
            Container(height: 380, decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [AppColors.primary.withOpacity(0.9), Colors.transparent]))),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.95), borderRadius: BorderRadius.circular(10)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Projet National Actif'.toUpperCase(), style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.secondary)),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(4)), child: Row(children: [Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF059669), shape: BoxShape.circle)), const SizedBox(width: 4), Text('En phase terminale', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: const Color(0xFF047857)))])),
                  ]),
                  const SizedBox(height: 6),
                  Text('Axe Stratégique Bifoun – Lambaréné', style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary)),
                  const SizedBox(height: 6),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Financement mixte : État & BAD', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant)),
                    Text('87 km réhabilités', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.primary)),
                  ]),
                ]),
              ),
            ),
          ]),
        ),
      ),
      Transform.translate(
        offset: const Offset(16, -16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16)]),
            child: Row(children: [
              Container(width: 40, height: 40, decoration: BoxDecoration(color: const Color(0xFFFFDCBD), borderRadius: BorderRadius.circular(20)), child: const Icon(Icons.verified_user, color: AppColors.secondary)),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Agrément A+', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, fontSize: 14, color: AppColors.primary)),
                Text('Plus haute classification BTP', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)),
              ]),
            ]),
          ),
        ),
      ),
    ]);
  }

  Widget _stats() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              LayoutBuilder(builder: (ctx, c) {
                final isDesktop = c.maxWidth > 700;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Envergure Industrielle'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
                      const SizedBox(height: 4),
                      Text('L\'Impact CITP en Chiffres Réels', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)),
                    ])),
                    if (isDesktop) SizedBox(width: 320, child: Text('Des métriques certifiées sur le terrain, attestant de notre capacité logistique, financière et humaine.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.5))),
                  ],
                );
              }),
              const SizedBox(height: 32),
              LayoutBuilder(builder: (ctx, c) {
                final cols = c.maxWidth > 1000 ? 4 : c.maxWidth > 600 ? 2 : 1;
                return GridView.count(
                  crossAxisCount: cols,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: cols == 1 ? 2.2 : 0.95,
                  children: [
                    _statCard(Icons.add_road, 'Urbain & Périurbain', '+30', 'km', 'Voiries Urbaines Réhabilitées', 'Axes prioritaires d\'Alénakiri, Nzeng-Ayong, Awoungou.'),
                    _statCard(Icons.alt_route, 'Corridors Panafricains', '2', 'Grands', 'Axes Routiers Nationaux', 'Liaisons vitales Bifoun–Lambaréné et Ntoum–Cocobeach.'),
                    _statCard(Icons.groups, 'Capital Humain', '+1 200', '', 'Emplois Locaux & Cadres', 'Ingénieurs, géomètres, conducteurs de centrales.'),
                    _statCard(Icons.volunteer_activism, 'Impact Solidaire', '100%', '', 'Engagement RSE Actif', 'Programmes de bourses et soutien communautaire.'),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(IconData icon, String label, String value, String unit, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: Colors.white, size: 20)),
          Text(label.toUpperCase(), style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.secondary)),
        ]),
        const Spacer(),
        RichText(text: TextSpan(style: GoogleFonts.plusJakartaSans(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.primary, height: 1), children: [TextSpan(text: value), if (unit.isNotEmpty) TextSpan(text: ' $unit', style: GoogleFonts.plusJakartaSans(color: AppColors.secondaryContainer, fontSize: 18))])),
        const SizedBox(height: 8),
        Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.primary)),
        const SizedBox(height: 4),
        Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.4)),
      ]),
    );
  }

  Widget _domaines() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(children: [
            Text('Pôles d\'Excellence Technique'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
            const SizedBox(height: 8),
            Text('Maîtrise Complète de la Chaîne des Travaux Publics', textAlign: TextAlign.center, style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primary)),
            const SizedBox(height: 12),
            ConstrainedBox(constraints: const BoxConstraints(maxWidth: 700), child: Text('De l\'étude géotechnique préliminaire à l\'application des enrobés spéciaux sous contrainte équatoriale, le CITP dispose de parcs matériels intégrés.', textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 15, color: AppColors.onSurfaceVariant, height: 1.6))),
            const SizedBox(height: 32),
            LayoutBuilder(builder: (ctx, c) {
              final cols = c.maxWidth > 1000 ? 4 : c.maxWidth > 600 ? 2 : 1;
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.72,
                children: [
                  _domaineCard('Urbanisme Républicain', 'Aménagement Urbain & Pavage Haute Résistance', 'Pavage carrossable renforcé pour zones à fort trafic, trottoirs drainants.', Icons.architecture, ['Pavés autobloquants 10cm', 'Caniveaux préfabriqués & dalots'], 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfS23aCuXC-m5EU6g3qX-kIAeiCQA2JyprZisFHD59Wo8xis0cdnYbreudtKc75FRes1BHHxwbj19YlQNl-pdq_1LrEcP-Zn68CQFZr3M_7pOgxhWe8hQhblJZJyMBiP-LLAu3ri3Zi9_DFWBF6OFWnO1NiO5PR2PONhY3Ja7aByFaQyTdmOaKk01MsdELGS341tvIrWFPo3JsPH1zXZ5by8AM5DI2XjFXX1IRpMARtB_pOAx0IYX5XA'),
                  _domaineCard('Réseaux Structurants', 'Routes & Béton Bitumineux Haute Densité', 'Terrassements de masse, couches de forme stabilisées et formules d\'enrobé à chaud adaptées aux amplitudes thermiques et à la pluviométrie tropicale.', Icons.directions_car, ['Centrales d\'enrobage mobile de 160 T/h', 'Formulations anti-orniérage certifiées'], 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80'),
                  _domaineCard('Résilience Climatique', 'Drainage & Ouvrages Hydrauliques Majeurs', 'Collecteurs primaires, bassins de rétention et régulation.', Icons.water_damage, ['Dalots cadres multiples', 'Enrochements et berges'], 'https://lh3.googleusercontent.com/aida-public/AB6AXuCKO7x_2ZNkqowB92FaWdZH1l0TRnu1RdB6aB1ZHDQnurZnpO4fA_mgHT37G6zCBmU5Bo6abFcv-j4FmmjfdeGxxhVAw35QFAp3nMM3S9X-GP6cHOq7OAlbrxZn9Myy174N_paCqoeIp0aVRqjx0fJnnwrY5C7o33t02YHTryeeEDB-6gv0SJd1TMvhYktKLriLAqdwlbek1Hencj8hc00CetO0MzEpIaGr_tP8qJ7hoQ7kjA_jE2ZLoA'),
                  _domaineCard('Grands Complexes', 'Bâtiments & Équipements Structurants', 'Édification de complexes sportifs, plateformes aéroportuaires.', Icons.stadium, ['Gymnases et stades omnisports', 'Terminaux logistiques'], 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3dRluy-snOHSC6vuCMtlpUCOqI4qsXV1i11tYdI3sonGm7exwpLz28GUqlS1CJXiU1MUiLhqWl5xIt4suQrY3qZy2bUS6_3RfEcZaJgspm6u4zW5JDIH6kWjbfMfDzNb5z0HVfJfgC0z7Vdwxvg_pH2yrfm-rpt3PrZiqTYyyxfle0Hgdhhf6zUUMbM-f47joyiRPElQDHENTft3WeUjDbHq8mNvYBtIQzOkDTZ1Yfpdo0mzCcx5_2A'),
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }

  Widget _domaineCard(String surtitle, String title, String desc, IconData icon, List<String> bullets, String img) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), child: Image.network(img, height: 160, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Icon(icon, size: 16, color: AppColors.secondaryContainer), const SizedBox(width: 6), Text(surtitle.toUpperCase(), style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.onSurfaceVariant))]),
            const SizedBox(height: 8),
            Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary, height: 1.2)),
            const SizedBox(height: 8),
            Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)),
            const SizedBox(height: 12),
            ...bullets.map((b) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Row(children: [Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle)), const SizedBox(width: 8), Expanded(child: Text(b, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)))]))),
          ]),
        ),
      ]),
    );
  }

  Widget _projetsPhares() {
    return Container(
      color: const Color(0xFFF2F3FF),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(children: [
            LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 700;
              if (isDesktop) {
                return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Chantiers Emblématiques'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
                    Text('Les Réalisations Qui Façonnent la Nation', style: GoogleFonts.plusJakartaSans(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.primary)),
                  ]),
                  Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Row(children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(6)), child: Text('Tous les Ouvrages', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white))),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('Grand Libreville', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))),
                  ])),
                ]);
              } else {
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Chantiers Emblématiques'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
                  Text('Les Réalisations Qui Façonnent la Nation', style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary)),
                  const SizedBox(height: 12),
                  Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Row(children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(6)), child: Text('Tous les Ouvrages', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white))),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('Grand Libreville', style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant))),
                  ])),
                ]);
              }
            }),
            const SizedBox(height: 24),
            LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 900;
              return Wrap(spacing: 16, runSpacing: 16, children: [
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.58 : c.maxWidth, child: _projetCardHero()),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.39 : c.maxWidth, child: _projetCardSmall('Axe Structurant Bifoun – Lambaréné', 'Modernisation et recalibrage géométrique de la dorsale économique.', 'Moyen-Ogooué • RN1', const Color(0xFF059669), 'Réceptionné & Circulé', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAG614SFko3Oh4UWN_fXfkchU9RfUgiIFDzBNsLjP9wvyTjM89RtL_PyLZkQ4AiC2Su5r-H1ky8iaSLuQ7mTnz1WFLpkMNi4dXyTqa2Jk7oW7J3v7G0kyfmh93U9eeiFiWybxWshARiif45PCTyGHrV2EIVl2Khfrc_T1bSu6XfvgcjpaWafcptQsSWL8m9XWOVxrwqtbE4ET6BB8cJheadN1obQLO-iIJcclT0oUyRWvQUh197I9urnw')),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.49 : c.maxWidth, child: _projetCardSmall('Route Intégratrice Ntoum – Cocobeach', 'Désenclavement du littoral nord et facilitation des échanges.', 'Estuaire • Transfrontalier', const Color(0xFF0284C7), 'Tranche 1 en cours', 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-T2dM8TtbHmgVJJwAZx27rCQmyWvHlOFbY9_JOvSj12NG7VFWJHRkRaSoKb0Ef3lTXPBqtdfywDFjduBN-Am1joEGToaRtdmORJHe1aghklzG1f7cVohbQpVOvHUDBXP7TvwyqV2LqVcl1MBcFDuJIrdUPTPvhcYbvgQ7UFpA4lQ7V9qFZMwZ-OjFJV6z0LWMZbXmioF-2ZTY5VfFM0QAHkwkdoe4vIYZjv2J26fSL86zzGCjHvP2XA')),
                SizedBox(width: isDesktop ? (c.maxWidth - 16) * 0.49 : c.maxWidth, child: _projetCardSmall('Infrastructures Sportives & Gymnases', 'Complexes polyvalents dédiés à la jeunesse et compétitions africaines.', 'Infrastructures Nationales', const Color(0xFF059669), 'Inauguré & Homologué', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkmjOlHbYuGlMoYK_PXptb6UcVTmW_ATjPPHc3SqF9j4YK8leF_12tphin9oQaOuu5CenaI2Txk490x0LQIPDTrp585XIP8KtkofG2LqDZvX0pI9U_RdEEIOs45JaIvIn9LxXHH8Cz0mGq1mq1sMFKzjjEe-Jg0OjU2hb-4Ia9NW6wUSW6M3AW9bKZAURPMOJQShJJM2DEY3kSQ3RhwolebEubxrqc-7i6I6WMH3qBDDke_Tx1sjDWrg')),
              ]);
            }),
          ]),
        ),
      ),
    );
  }

  Widget _projetCardHero() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      child: Column(children: [
        Stack(children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuBl1fAGVBBevtkXEL2h1pDqqP3CV_igQpN9fDQYH_GDMIpbLkRBxIzRHvDVuPa3NKeDnw5VWdPG25HZZVGFVY_V00x7m_RALGS2DBaecGQvUbpXQXhnOde8hyMtYAbDHYjT0l6tV623gFJ_yuYw5DREXDAkbuBoM1OeaWQmzVbBUMEhmmjnTagLh1OCKGg1jfT6IXfdMGrU3mkAtY3_wdhJQABHLwVFhRWPDK5YvVJg6Syt-lUnTVJW_w', height: 260, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
          Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFF59E0B), borderRadius: BorderRadius.circular(20)), child: Text('Chantier en finition • 98%', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.white)))),
          Positioned(bottom: 12, right: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.85), borderRadius: BorderRadius.circular(6)), child: Row(children: [const Icon(Icons.location_on, size: 12, color: Colors.white), const SizedBox(width: 4), Text('Libreville • Alénakiri & Nzeng-Ayong', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white))]))),
        ]),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(child: Text('Réhabilitation Complète des Voiries du Grand Libreville', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.primary))),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.secondaryContainer.withOpacity(0.12), borderRadius: BorderRadius.circular(6)), child: Text('Phase 2 / Fin 2025', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer))),
            ]),
            const SizedBox(height: 10),
            Text('Programme prioritaire d\'urgence pour fluidifier la circulation métropolitaine, comprenant terrassement, enrobé haute durabilité et éclairage photovoltaïque.', style: GoogleFonts.inter(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.5)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _miniStat('Linéaire Traité', '32,4 km'),
                _miniStat('Maître d\'Ouvrage', 'État Gabonais'),
                _miniStat('Taux d\'Exécution', '98,2%'),
              ]),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: 0.98, backgroundColor: const Color(0xFFE2E7FF), color: AppColors.secondaryContainer, minHeight: 6),
          ]),
        ),
      ]),
    );
  }

  Widget _miniStat(String label, String value) => Column(children: [Text(label.toUpperCase(), style: GoogleFonts.inter(fontSize: 10, color: AppColors.onSurfaceVariant, letterSpacing: 0.5)), const SizedBox(height: 2), Text(value, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: AppColors.primary, fontSize: 13))]);

  Widget _projetCardSmall(String title, String desc, String loc, Color badgeColor, String badge, String img) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: Image.network(img, height: 180, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
          Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6)), child: Text(badge, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)))),
          Positioned(bottom: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.85), borderRadius: BorderRadius.circular(6)), child: Text(loc, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)))),
        ]),
        Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.primary)), const SizedBox(height: 8), Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)), const SizedBox(height: 12), SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.visibility_outlined, size: 16), label: const Text('Voir la fiche technique'), style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 10))))])),
      ]),
    );
  }

  Widget _rse() {
    return Container(
      color: const Color(0xFFDAE2FD).withOpacity(0.35),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: LayoutBuilder(builder: (ctx, c) {
            final isDesktop = c.maxWidth > 900;
            return isDesktop
                ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _rseLeft()), const SizedBox(width: 32), Expanded(child: _rseRight())])
                : Column(children: [_rseLeft(), const SizedBox(height: 24), _rseRight()]);
          }),
        ),
      ),
    );
  }

  Widget _rseLeft() {
    return Column(children: [
      ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCLhuR7vo0bQOTK1NcpZrVDWCnvCT-Kgo97a3sdG2aUQuVMYOgY9mdB7-lNolQqcT0iaDixvMzjZzWVOalOomwQQO-3Kcr7otqgxuUJUmE0Rsq9ldcKHWARSKw5l9mok16fJMmhfXXhw4DoJ-0sYwVfMqP31ATd3P3Cj0ry1CBIuPevNtimX4qjHU0VgZ4a2ouA2XSPfK0UQoIJaJ5ZQPaw7ljT4RyfMO-7wO6osXUydNJJjbTBMh2drQ', height: 280, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: const Color(0xFFE2E7FF), height: 160, child: const Center(child: Icon(Icons.image_outlined, color: Color(0xFF002B7F)))) )),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)]),
        child: Column(children: [
          Row(children: [const Icon(Icons.format_quote, color: AppColors.secondaryContainer), const SizedBox(width: 8), Text('Vision de la Direction Générale'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.secondary))]),
          const SizedBox(height: 8),
          Text('« En tant qu\'entreprise citoyenne affiliée à la FEG, notre devoir est de réinvestir durablement sur notre territoire national. »', style: GoogleFonts.inter(fontSize: 13, fontStyle: FontStyle.italic, color: AppColors.onSurface, height: 1.5)),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Seydou Kane', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: AppColors.primary)), Text('Président Directeur Général', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant))]),
        ]),
      ),
    ]);
  }

  Widget _rseRight() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Responsabilité Sociétale des Entreprises'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
      const SizedBox(height: 6),
      Text('Bâtir un Modèle Éthique, Inclusif et Pénétré du Territoire', style: GoogleFonts.plusJakartaSans(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.primary, height: 1.2)),
      const SizedBox(height: 12),
      Text('Le CITP déploie une politique RSE articulée autour de la promotion des compétences nationales, de l\'exigence écologique et du mécénat actif.', style: GoogleFonts.inter(fontSize: 14, color: AppColors.onSurfaceVariant, height: 1.6)),
      const SizedBox(height: 20),
      LayoutBuilder(builder: (ctx, c) {
        return Wrap(spacing: 12, runSpacing: 12, children: [
          SizedBox(width: (c.maxWidth - 12) / 2 > 180 ? (c.maxWidth - 12) / 3 : c.maxWidth, child: _pilier(Icons.school_outlined, 'Valorisation des Talents', 'Plus de 85% d\'équipes issues des filières gabonaises.', const Color(0xFFFFDCBD))),
          SizedBox(width: (c.maxWidth - 12) / 2 > 180 ? (c.maxWidth - 12) / 3 : c.maxWidth, child: _pilier(Icons.eco_outlined, 'Rigueur Écologique', 'Recyclage des agrégats et réhabilitation des carrières.', const Color(0xFFDCFCE7))),
          SizedBox(width: (c.maxWidth - 12) / 2 > 180 ? (c.maxWidth - 12) / 3 : c.maxWidth, child: _pilier(Icons.favorite_border, 'Fondation Seydou Kane', 'Réfection d\'écoles et bourses pour ingénieurs méritants.', const Color(0xFFE0F2FE))),
        ]);
      }),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          const Icon(Icons.workspace_premium, color: AppColors.secondaryContainer, size: 32),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Charte QSE certifiée Zéro Accident Majeur', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 13)), Text('Protocoles stricts 24h/24 sur tous les chantiers.', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFE2E7FF)))])),
          FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary), child: const Text('Télécharger', style: TextStyle(fontSize: 12))),
        ]),
      ),
    ]);
  }

  Widget _pilier(IconData icon, String title, String desc, Color bg) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 40, height: 40, decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)), child: Icon(icon, size: 20, color: AppColors.primary)),
        const SizedBox(height: 10),
        Text(title, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primary)),
        const SizedBox(height: 6),
        Text(desc, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.4)),
      ]),
    );
  }

  Widget _presse() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(children: [
            LayoutBuilder(builder: (ctx, c) {
              final isNarrow = c.maxWidth < 600;
              if (isNarrow) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Couverture Médiatique & Communiqués'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
                  Text('Le CITP à la Une', style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primary)),
                  const SizedBox(height: 8),
                  Align(alignment: Alignment.centerLeft, child: TextButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 16), label: Text('Revue de presse', style: GoogleFonts.inter(fontWeight: FontWeight.w700)))),
                ]);
              }
              return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Couverture Médiatique & Communiqués'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondary)),
                  Text('Le CITP à la Une', style: GoogleFonts.plusJakartaSans(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.primary)),
                ])),
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 16), label: Text('Revue de presse', style: GoogleFonts.inter(fontWeight: FontWeight.w700))),
              ]);
            }),
            const SizedBox(height: 24),
            LayoutBuilder(builder: (ctx, c) {
              final cols = c.maxWidth > 900 ? 3 : c.maxWidth > 600 ? 2 : 1;
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.15,
                children: [
                  _article('Gabon Review', '12 Février 2025', 'Voiries du Grand Libreville : le CITP accélère la cadence', '« Les usagers saluent la métamorphose rapide du réseau d\'assainissement... »'),
                  _article('Forbes Afrique', 'Janvier 2025', 'Infrastructures en Afrique Centrale : La méthode CITP', 'Décryptage du modèle d\'ingénierie intégré, partenaire de référence FEG.'),
                  _article('L\'Union Quotidien', '28 Déc 2024', 'Moyen-Ogooué : Réception technique réussie', 'Le ministre salue la rigueur technique observée par le CITP.'),
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }

  Widget _article(String source, String date, String title, String excerpt) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Flexible(child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)), child: Text(source, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primary)))), const SizedBox(width: 8), Text(date, style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant))]),
        const SizedBox(height: 14),
        Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary, height: 1.3)),
        const SizedBox(height: 8),
        Text(excerpt, style: GoogleFonts.inter(fontSize: 12, color: AppColors.onSurfaceVariant, height: 1.5)),
        const Spacer(),
        Row(children: [Text('Lire l\'article', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.secondaryContainer)), const SizedBox(width: 4), const Icon(Icons.north_east, size: 12, color: AppColors.secondaryContainer)]),
      ]),
    );
  }

  Widget _ctaFinal() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: LayoutBuilder(builder: (ctx, c) {
            final isDesktop = c.maxWidth > 800;
            return Container(
              padding: EdgeInsets.all(isDesktop ? 40 : 24),
              decoration: BoxDecoration(color: AppColors.primaryContainer.withOpacity(0.5), borderRadius: BorderRadius.circular(16)),
              child: isDesktop
                  ? Row(children: [Expanded(child: _ctaLeft()), const SizedBox(width: 24), _ctaRight()])
                  : Column(children: [_ctaLeft(), const SizedBox(height: 20), _ctaRight()]),
            );
          }),
        ),
      ),
    );
  }

  Widget _ctaLeft() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Partenariats & Carrières'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.4, color: AppColors.secondaryContainer)),
      const SizedBox(height: 8),
      Text('Vous Avez un Projet d\'Infrastructure ou Souhaitez Rejoindre Nos Équipes ?', style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white, height: 1.25)),
      const SizedBox(height: 12),
      Text('Bailleurs de fonds, collectivités, ministères ou ingénieurs : la direction générale vous répond avec la plus haute réactivité.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF), height: 1.6)),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Container(width: 36, height: 36, decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle), child: const Icon(Icons.engineering, color: Colors.white, size: 18)),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Portail Recrutement Ouvert', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 13)), Text('12 postes d\'ingénieurs & conducteurs', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFE2E7FF)))]),
        ]),
      ),
    ]);
  }

  Widget _ctaRight() {
    return Column(children: [
      SizedBox(width: 320, child: TextField(decoration: InputDecoration(hintText: 'Votre email professionnel', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)))),
      const SizedBox(height: 12),
      SizedBox(width: 320, child: FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: AppColors.secondaryContainer, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)), child: Text('Être recontacté sous 24h', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700)))),
      const SizedBox(height: 8),
      Text('Réponse garantie sous 24h ouvrées • Données confidentielles', style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFFE2E7FF))),
    ]);
  }
}
