import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke/core/widget_keys.dart';

import '../../config/colors.dart';

class PokeNavBar extends StatelessWidget {
  final int index;

  const PokeNavBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: PokedexColors.identity.withValues(alpha: 0.5),
      selectedIndex: index,
      backgroundColor: PokedexColors.grayScale[075],
      destinations: [
        NavigationDestination(
          icon: IconButton(
            icon: const Icon(Icons.flash_on_outlined),
            onPressed: () => context.go('/pokedex'),
          ),
          label: 'Pokedex',
        ),
        NavigationDestination(
          icon: IconButton(
              key: WidgetKeys.itemsScreen,
              onPressed: () => context.go('/items'),
              icon: const Icon(Icons.grass)),
          label: 'Items',
        ),
        NavigationDestination(
          icon: IconButton(
              key: WidgetKeys.versionsScreen,
              onPressed: () => context.go('/versions'),
              icon: const Icon(Icons.water_drop_outlined)),
          label: 'Versions',
        ),
        NavigationDestination(
          icon: IconButton(
              key: WidgetKeys.movesScreen,
              onPressed: () => context.go('/moves'),
              icon: const Icon(Icons.local_fire_department_outlined)),
          label: 'Moves',
        ),
        NavigationDestination(
            icon: IconButton(
                key: WidgetKeys.loginScreen,
                onPressed: () => context.go('/mypokedex'),
                icon: const Icon(Icons.home_outlined)),
            label: 'Home')
      ],
    );
  }
}
