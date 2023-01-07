import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Conta',
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }

    if (location.startsWith('/search')) {
      return 1;
    }

    if (location.startsWith('/orders')) {
      return 2;
    }

    if (location.startsWith('/account')) {
      return 3;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    log('tap');
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/search');
        break;
      case 2:
        GoRouter.of(context).go('/orders');
        break;
      case 3:
        GoRouter.of(context).go('/account');
        break;
    }
  }
}
