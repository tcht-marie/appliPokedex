import 'package:poke/domain/models/pokemon.dart';
import 'package:poke/infrastructure/models/pokemon_infra.dart';

import '../../../domain/models/evolution_chain.dart';
import '../../../domain/models/evolves_to.dart';
import '../../../domain/models/pokemon_types.dart';
import '../../../domain/models/stat_name.dart';
import '../../models/evolution_chain_infra.dart';
import '../../models/evolves_to_infra.dart';
import '../../models/pokemon_types_infra.dart';
import '../../models/stat_name_infra.dart';

class PokemonMapper {
  // transforme EvolutionChainInfra en EvolutionChain
  EvolutionChain evoChainInfraToEvoChain(EvolutionChainInfra evoChainInfra) {
    return (evolvesTo: evolvesToInfraToEvolvesTo(evoChainInfra.evolvesTo));
  }

  // transforme EvolvesToInfra en EvolvesTo
  EvolvesTo evolvesToInfraToEvolvesTo(EvolvesToInfra evolvesToInfra) {
    return EvolvesTo(
        // conversion récursive des évo en rappelant la même méthode
        evolvesToInfra.evolvesTo
            .map((element) => evolvesToInfraToEvolvesTo(element))
            .toList(growable: false),
        // transformation du pokémon
        (
          id: evolvesToInfra.pokemon.id,
          idLabel: evolvesToInfra.pokemon.idLabel,
          name: evolvesToInfra.pokemon.name,
          imageUrl: evolvesToInfra.pokemon.imageUrl
        ));
  }

  // transformation StatNameInfra en StatName
  StatName statNameInfraToStatName(StatNameInfra statNameInfra) {
    // utilisation d'un switch pour mapper chaque valeur d'une enum à l'autre
    return switch (statNameInfra) {
      StatNameInfra.hp => StatName.hp,
      StatNameInfra.atk => StatName.atk,
      StatNameInfra.def => StatName.def,
      StatNameInfra.satk => StatName.satk,
      StatNameInfra.sdef => StatName.sdef,
      StatNameInfra.spd => StatName.spd,
      StatNameInfra.acc => StatName.acc,
      StatNameInfra.eva => StatName.eva
    };
  }

  // transformation pokemonTypesInfra en PokemonTypes
  PokemonTypes pokemonTypesInfraToPokemonTypes(
      PokemonTypesInfra pokemonTypesInfra) {
    // utilisation d'un switch pour mapper chaque valeur d'une enum à l'autre
    return switch (pokemonTypesInfra) {
      PokemonTypesInfra.normal => PokemonTypes.normal,
      PokemonTypesInfra.fighting => PokemonTypes.fighting,
      PokemonTypesInfra.flying => PokemonTypes.flying,
      PokemonTypesInfra.poison => PokemonTypes.poison,
      PokemonTypesInfra.ground => PokemonTypes.ground,
      PokemonTypesInfra.rock => PokemonTypes.rock,
      PokemonTypesInfra.bug => PokemonTypes.bug,
      PokemonTypesInfra.ghost => PokemonTypes.ghost,
      PokemonTypesInfra.steel => PokemonTypes.steel,
      PokemonTypesInfra.fire => PokemonTypes.fire,
      PokemonTypesInfra.water => PokemonTypes.water,
      PokemonTypesInfra.grass => PokemonTypes.grass,
      PokemonTypesInfra.electric => PokemonTypes.electric,
      PokemonTypesInfra.psychic => PokemonTypes.psychic,
      PokemonTypesInfra.ice => PokemonTypes.ice,
      PokemonTypesInfra.dragon => PokemonTypes.dragon,
      PokemonTypesInfra.dark => PokemonTypes.dark,
      PokemonTypesInfra.fairy => PokemonTypes.fairy,
      PokemonTypesInfra.stellar => PokemonTypes.stellar,
      PokemonTypesInfra.shadow => PokemonTypes.shadow
    };
  }

  // transformation PokemonInfra en Pokemon
  Pokemon pokemonInfraToPokemon(PokemonInfra pokemonInfra) {
    return (
      id: pokemonInfra.id,
      idLabel: pokemonInfra.idLabel,
      name: pokemonInfra.name,
      imageUrl: pokemonInfra.imageUrl
    );
  }
}
