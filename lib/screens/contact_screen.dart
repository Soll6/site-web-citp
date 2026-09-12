import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // CITP — 9CMX+XM7 → 6FGF9CMX+XM7 (récupéré avec Libreville 0.3924,9.4536)
  // Centre OSM : 0.3849125, 9.44917188 — Owendé / Libreville
  static const LatLng _citpLatLng = LatLng(0.3849125, 9.449171875);
  static const String _plusCode = '9CMX+XM7, Libreville';
  static const String _osmUrl = 'https://www.openstreetmap.org/?mlat=0.3849125&mlon=9.449171875#map=17/0.3849125/9.449171875';

  Future<void> _openOsm() async {
    final uri = Uri.parse(_osmUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [_header(), _formAndInfo(context)]),
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
              Text('Siège • 9CMX+XM7, Libreville'.toUpperCase(), style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2, color: AppColors.secondaryContainer)),
              Text('Contact & Siège Social', style: GoogleFonts.plusJakartaSans(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
              Text('Bailleurs, ministères, partenaires : la Direction Générale vous répond sous 24h.', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E7FF))),
            ]),
          ),
        ),
      );

  Widget _formAndInfo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: LayoutBuilder(builder: (ctx, c) {
              final isDesktop = c.maxWidth > 900;
              return isDesktop
                  ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _form()), const SizedBox(width: 32), SizedBox(width: 380, child: _info(context))])
                  : Column(children: [_form(), const SizedBox(height: 24), _info(context)]);
            }),
          ),
        ),
      );

  Widget _form() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xFFF2F3FF), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Demande de Cotation / Partenariat', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 16),
          _field('Nom complet *', 'Seydou Kane'),
          const SizedBox(height: 12),
          _field('Email professionnel *', 'contact@exemple.ga'),
          const SizedBox(height: 12),
          _field('Organisation', 'Ministère / BAD / Entreprise'),
          const SizedBox(height: 12),
          _field('Objet', 'Voiries / Hydraulique / Bâtiment'),
          const SizedBox(height: 12),
          Text('Message *', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)),
          const SizedBox(height: 6),
          TextField(maxLines: 4, decoration: InputDecoration(hintText: 'Décrivez votre projet, linéaire, localisation, budget prévisionnel...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)))),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: AppColors.secondaryContainer, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)), child: Text('Envoyer la demande', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700)))),
          const SizedBox(height: 8),
          Text('Réponse garantie sous 24h ouvrées • Données confidentielles', style: GoogleFonts.inter(fontSize: 11, color: AppColors.onSurfaceVariant)),
        ]),
      );

  Widget _field(String label, String hint) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary)),
        const SizedBox(height: 6),
        TextField(decoration: InputDecoration(hintText: hint, hintStyle: GoogleFonts.inter(fontSize: 13, color: Colors.grey), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), fillColor: Colors.white, filled: true)),
      ]);

  Widget _info(BuildContext context) => Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('CITP Gabon S.A.', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 16)),
            const SizedBox(height: 12),
            _infoRow(Icons.location_on, '9CMX+XM7\nLibreville – Gabon'),
            _infoRow(Icons.phone, '066223075'),
            _infoRow(Icons.mail, 'contact@citp-gabon.com\nmarchés@citp-gabon.com'),
            _infoRow(Icons.schedule, 'Lun – Ven : 07h30 – 17h30\nSam : 08h00 – 12h00'),
          ]),
        ),
        const SizedBox(height: 16),
        // Carte OSM interactive — remplace le placeholder Google Maps
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 280,
            decoration: BoxDecoration(border: Border.all(color: const Color(0xFFC4C6D3))),
            child: Stack(children: [
              FlutterMap(
                options: const MapOptions(initialCenter: _citpLatLng, initialZoom: 16.0, interactionOptions: InteractionOptions(flags: InteractiveFlag.all)),
                children: [
                  TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.citp.citp_1', maxZoom: 19),
                  RichAttributionWidget(attributions: [TextSourceAttribution('© OpenStreetMap contributors', onTap: () async => launchUrl(Uri.parse('https://www.openstreetmap.org/copyright')))]),
                  MarkerLayer(markers: [
                    Marker(point: _citpLatLng, width: 44, height: 44, child: Container(decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 8)]), child: const Icon(Icons.apartment, color: Colors.white, size: 22))),
                  ]),
                ],
              ),
              Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 6)]), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.location_on, size: 14, color: AppColors.primary), const SizedBox(width: 4), Text(_plusCode, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary))]))),
              Positioned(bottom: 12, left: 12, right: 12, child: Row(children: [
                Expanded(child: ElevatedButton.icon(onPressed: _openOsm, icon: const Icon(Icons.map_outlined, size: 16), label: Text('Itinéraire OSM', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 12)), style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryContainer, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))))),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () async {
                  final uri = Uri.parse('tel:+241066223075');
                  if (await canLaunchUrl(uri)) await launchUrl(uri);
                }, style: OutlinedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Icon(Icons.phone, size: 18)),
              ])),
            ]),
          ),
        ),
        const SizedBox(height: 8),
        Text('© OpenStreetMap contributors • Plus Code 9CMX+XM7', style: GoogleFonts.inter(fontSize: 10, color: AppColors.onSurfaceVariant)),
      ]);

  Widget _infoRow(IconData i, String t) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(i, size: 18, color: AppColors.secondaryContainer), const SizedBox(width: 10), Expanded(child: Text(t, style: GoogleFonts.inter(fontSize: 13, color: Colors.white, height: 1.5)))]),
      );
}
