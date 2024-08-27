
import 'package:poke/domain/models/pokemon.dart';

class EvolvesTo {
  List<EvolvesTo> evolvesTo;
  Pokemon pokemon;

  EvolvesTo(this.evolvesTo, this.pokemon);
}