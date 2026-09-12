import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'theme/app_colors.dart';
import 'widgets/app_header.dart';
import 'widgets/app_footer.dart';
import 'screens/home_screen.dart';
import 'screens/apropos_screen.dart';
import 'screens/activites_screen.dart';
import 'screens/realisations_screen.dart';
import 'screens/actualites_screen.dart';
import 'screens/carrieres_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/other_screens.dart';

void main() {
  runApp(const CitpApp());
}

class CitpApp extends StatelessWidget {
  const CitpApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CITP Gabon - Consortium International de Travaux Publics',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const CitpShell(),
    );
  }
}

class CitpShell extends StatefulWidget {
  const CitpShell({super.key});
  @override
  State<CitpShell> createState() => _CitpShellState();
}

class _CitpShellState extends State<CitpShell> {
  String _route = 'home';
  final _scrollController = ScrollController();

  Widget _buildScreen() {
    switch (_route) {
      case 'apropos':
        return const AproposScreen();
      case 'activites':
        return const ActivitesScreen();
      case 'realisations':
        return const RealisationsScreen();
      case 'actualites':
        return const ActualitesScreen();
      case 'carrieres':
        return const CarrieresScreen();
      case 'contact':
        return const ContactScreen();
      case 'rse':
        return const RseScreen();
      case 'marches':
        return const MarchesScreen();
      case 'mentions':
        return const MentionsScreen();
      default:
        return const HomeScreen();
    }
  }

  void _navigate(String route) {
    setState(() => _route = route);
    // scroll to top
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
    // close drawer if open
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  // Wrapper to provide Scaffold context for drawer
  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        drawer: _buildDrawer(),
        body: Column(
          children: [
            // Barre d'état fixe — évite le débordement edge-to-edge (Android 15+)
            if (topInset > 0)
              Container(
                color: AppColors.primaryContainer,
                height: topInset,
                width: double.infinity,
              ),
            // AppBar détachée — reste visible en tout temps (ne défile pas)
            AppHeader(
              activeRoute: _route,
              onNavigate: (r) {
                setState(() => _route = r);
                _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
              },
            ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(child: _buildScreen()),
                  SliverToBoxAdapter(
                    child: AppFooter(onNavigate: (r) {
                      setState(() => _route = r);
                      _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 9 entrées synchronisées avec AppHeader (Stitch originel) + Mentions en footer drawer
  Widget _buildDrawer() {
    final items = [
      ('home', 'Accueil', Icons.home_outlined),
      ('apropos', 'À propos', Icons.info_outline),
      ('activites', 'Nos Métiers & Activités', Icons.architecture_outlined),
      ('realisations', 'Réalisations', Icons.construction_outlined),
      ('rse', 'Engagements RSE', Icons.eco_outlined),
      ('actualites', 'Actualités & Presse', Icons.newspaper_outlined),
      ('carrieres', 'Carrières', Icons.work_outline),
      ('marches', 'Espace Marchés', Icons.gavel_outlined),
      ('contact', 'Nous contacter', Icons.mail_outline),
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF001851)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white70)), padding: const EdgeInsets.all(4), child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset('assets/icon/citp-logo.png', fit: BoxFit.contain, errorBuilder: (c,e,s) => const Icon(Icons.apartment, color: Color(0xFF001851))))),
              const SizedBox(height: 12),
              const Text('CITP GABON', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
              const Text('Consortium International de Travaux Publics', style: TextStyle(color: Colors.white70, fontSize: 11)),
            ]),
          ),
          ...items.map((e) => ListTile(
                leading: Icon(e.$3, color: _route == e.$1 ? const Color(0xFF002B7F) : Colors.grey),
                title: Text(e.$2, style: TextStyle(fontWeight: _route == e.$1 ? FontWeight.w700 : FontWeight.w500, color: _route == e.$1 ? const Color(0xFF002B7F) : Colors.black87)),
                selected: _route == e.$1,
                selectedTileColor: const Color(0xFFE2E7FF),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _route = e.$1);
                  _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                },
              )),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.shield_outlined, color: _route == 'mentions' ? const Color(0xFF002B7F) : Colors.grey),
            title: Text('Mentions Légales', style: TextStyle(fontWeight: _route == 'mentions' ? FontWeight.w700 : FontWeight.w500, color: _route == 'mentions' ? const Color(0xFF002B7F) : Colors.black54, fontSize: 13)),
            selected: _route == 'mentions',
            onTap: () {
              Navigator.pop(context);
              setState(() => _route = 'mentions');
              _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
            },
          ),
        ],
      ),
    );
  }
}
