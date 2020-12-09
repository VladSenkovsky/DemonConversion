import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/blocs/main_bloc/main_cubit.dart';

class ThirdScreen extends StatefulWidget {
  GVars gVars;

  ThirdScreen(this.gVars);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  GVars get gVars => widget.gVars;

  int finalIndex = 0;

  List _controller = [];

  //controllers for default values for each text from field on 3rd screen
  @override
  void initState() {
    super.initState();
    if (finalIndex == 0) {
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
      _controller.add(new TextEditingController(text: '0'));
    }
  }

  //possible and optimal amount of meat for conversion
  int minAmountForConversion(String unit, bool ring1, bool ring2, bool vial,
      bool elixir, int meatAmount, int meatHp, int pitLordsAmount) {
    int minAmount = 0;
    if (elixir == true) {
      meatHp = (meatHp * 1.25).floor();
    }
    if (ring1 == true) {
      meatHp++;
    }
    if (ring2 == true) {
      meatHp++;
    }
    if (vial == true) {
      meatHp += 2;
    }
    int fullMeatHp = meatAmount * meatHp;
    int maxHpForRessurection = 50 * pitLordsAmount;
    if (fullMeatHp > maxHpForRessurection) {
      minAmount = (maxHpForRessurection / meatHp).floor();
      minAmount = (minAmount * meatHp / 35).floor();
      minAmount *= 35;
      if (minAmount / meatHp != (minAmount / meatHp).floor()) {
        minAmount = (minAmount / meatHp).floor() + 1;
      } else {
        minAmount = (minAmount / meatHp).floor();
      }
    } else {
      minAmount = (fullMeatHp / meatHp).floor();
      minAmount = (minAmount * meatHp / 35).floor();
      minAmount *= 35;
      if (double.parse((minAmount).toString()) / double.parse((meatHp).toString()) != (minAmount / meatHp).floor()) {
        minAmount = (minAmount / meatHp).floor() + 1;
      } else {
        minAmount = (minAmount / meatHp).floor();
      }
    }
    gVars.unitsInfo[unit] = minAmount;
    return minAmount;
  }

  //amount of demons after conversion
  int finalAmountAfterConversion(bool ring1, bool ring2, bool vial, bool elixir,
      int meatAmount, int meatHp, int pitLordsAmount) {
    if (elixir == true) {
      meatHp = (meatHp * 1.25).floor();
    }
    if (ring1 == true) {
      meatHp++;
    }
    if (ring2 == true) {
      meatHp++;
    }
    if (vial == true) {
      meatHp += 2;
    }
    if (meatHp >= 35) {
      return meatAmount;
    }
    int fullMeatHp = meatAmount * meatHp;
    return (fullMeatHp / 35).floor();
  }

  //row before conversion
  Row getInitialRow(
      String imgPath, String unit, Key fKey, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(imgPath),
        new Flexible(
            child: Form(
                key: fKey,
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'amount',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(250, 228, 150, 1),
                          fontSize: 20),
                    ),
                    keyboardType: TextInputType.number,
                    controller: controller,
                    onSaved: (String value) {
                      gVars.unitsInfo[unit] = int.parse(value);
                    },
                    validator: (String value) {
                      if (int.parse(value) < 0) {
                        print('you entered value < 0');
                        return ('amount cannot be negative');
                      } else {
                        print('all gucci');
                        return null;
                      }
                    }))),
      ],
    );
  }

  //row after conversion
  Row getFinalRow(String imgPath, int min, int amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(imgPath),
        Text(min.toString(),
            style: TextStyle(
                color: Color.fromRGBO(250, 228, 150, 1), fontSize: 20)),
        Text('into',
            style: TextStyle(
                color: Color.fromRGBO(250, 228, 150, 0.5), fontSize: 20)),
        Text(amount.toString(),
            style: TextStyle(
                color: Color.fromRGBO(250, 228, 150, 1), fontSize: 20)),
        Image.asset('images/units/inferno/demon.gif')
      ],
    );
  }

  //generating all initial rows
  List<Widget> generateInitialCastleRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/castle/pikeman.gif', 'pikeman',
        gVars.formPikemanKey, _controller[0]));
    rows.add(getInitialRow('images/units/castle/archer.gif', 'archer',
        gVars.formArcherKey, _controller[1]));
    rows.add(getInitialRow('images/units/castle/griffin.gif', 'griffin',
        gVars.formGriffinKey, _controller[2]));
    rows.add(getInitialRow('images/units/castle/swordsman.gif', 'swordsman',
        gVars.formSwordsmanKey, _controller[3]));
    rows.add(getInitialRow('images/units/castle/monk.gif', 'monk',
        gVars.formMonkKey, _controller[4]));
    return rows;
  }

  List<Widget> generateInitialRampartRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/rampart/centaur.gif', 'centaur',
        gVars.formCentaurKey, _controller[0]));
    rows.add(getInitialRow('images/units/rampart/centaur_captain.gif',
        'centaur_captain', gVars.formCentaurCaptainKey, _controller[1]));
    rows.add(getInitialRow('images/units/rampart/dwarf.gif', 'dwarf',
        gVars.formDwarfKey, _controller[2]));
    rows.add(getInitialRow('images/units/rampart/wood_elf.gif', 'wood_elf',
        gVars.formWoodElfKey, _controller[3]));
    rows.add(getInitialRow('images/units/rampart/pegasus.gif', 'pegasus',
        gVars.formPegasusKey, _controller[4]));
    rows.add(getInitialRow('images/units/rampart/dendroid.gif', 'dendroid',
        gVars.formDendroidKey, _controller[5]));
    return rows;
  }

  List<Widget> generateInitialTowerRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/tower/gremlin.gif', 'gremlin',
        gVars.formGremlinKey, _controller[0]));
    rows.add(getInitialRow('images/units/tower/mage.gif', 'mage',
        gVars.formMageKey, _controller[2]));
    rows.add(getInitialRow('images/units/tower/arch_mage.gif', 'arch_mage',
        gVars.formArchMageKey, _controller[3]));
    rows.add(getInitialRow('images/units/tower/genie.gif', 'genie',
        gVars.formGenieKey, _controller[4]));
    return rows;
  }

  List<Widget> generateInitialInfernoRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/inferno/imp.gif', 'imp',
        gVars.formImpKey, _controller[0]));
    rows.add(getInitialRow('images/units/inferno/gog.gif', 'gog',
        gVars.formGogKey, _controller[1]));
    rows.add(getInitialRow('images/units/inferno/hell_hound.gif', 'hell_hound',
        gVars.formHellHoundKey, _controller[2]));
    return rows;
  }

  List<Widget> generateInitialDungeonRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/dungeon/troglodyte.gif', 'troglodyte',
        gVars.formTroglodyteKey, _controller[0]));
    rows.add(getInitialRow(
        'images/units/dungeon/infernal_troglodyte.gif',
        'infernal_troglodyte',
        gVars.formInfernalTroglodyteKey,
        _controller[1]));
    rows.add(getInitialRow('images/units/dungeon/harpy.gif', 'harpy',
        gVars.formHarpyKey, _controller[2]));
    rows.add(getInitialRow('images/units/dungeon/beholder.gif', 'beholder',
        gVars.formBeholderKey, _controller[3]));
    rows.add(getInitialRow('images/units/dungeon/medusa.gif', 'medusa',
        gVars.formMedusaKey, _controller[4]));
    rows.add(getInitialRow('images/units/dungeon/medusa_queen.gif',
        'medusa_queen', gVars.formMedusaQueenKey, _controller[5]));
    rows.add(getInitialRow('images/units/dungeon/minotaur.gif', 'minotaur',
        gVars.formMinotaurKey, _controller[6]));
    return rows;
  }

  List<Widget> generateInitialStrongholdRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/stronghold/goblin.gif', 'goblin',
        gVars.formGoblinKey, _controller[0]));
    rows.add(getInitialRow('images/units/stronghold/wolf_rider.gif',
        'wolf_rider', gVars.formWolfRiderKey, _controller[1]));
    rows.add(getInitialRow('images/units/stronghold/orc.gif', 'orc',
        gVars.formOrcKey, _controller[2]));
    rows.add(getInitialRow('images/units/stronghold/orc_chieftain.gif',
        'orc_chieftain', gVars.formOrcChieftainKey, _controller[3]));
    rows.add(getInitialRow('images/units/stronghold/ogre.gif', 'ogre',
        gVars.formOgreKey, _controller[4]));
    rows.add(getInitialRow('images/units/stronghold/roc.gif', 'roc',
        gVars.formRocKey, _controller[5]));
    return rows;
  }

  List<Widget> generateInitialFortressRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/fortress/gnoll.gif', 'gnoll',
        gVars.formGnollKey, _controller[0]));
    rows.add(getInitialRow('images/units/fortress/lizzardman.gif', 'lizzardman',
        gVars.formLizzardmanKey, _controller[1]));
    rows.add(getInitialRow('images/units/fortress/lizzard_warrior.gif',
        'lizzard_warrior', gVars.formLizzardWarriorKey, _controller[2]));
    rows.add(getInitialRow('images/units/fortress/serpent_fly.gif',
        'serpent_fly', gVars.formSerpentFlyKey, _controller[3]));
    rows.add(getInitialRow('images/units/fortress/basilisk.gif', 'basilisk',
        gVars.formBasiliskKey, _controller[4]));
    rows.add(getInitialRow('images/units/fortress/gorgon.gif', 'gorgon',
        gVars.formGorgonKey, _controller[5]));
    return rows;
  }

  List<Widget> generateInitialConfluxRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/conflux/pixie.gif', 'pixie',
        gVars.formPixieKey, _controller[0]));
    return rows;
  }

  List<Widget> generateInitialCoveRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/cove/nymph.gif', 'nymph',
        gVars.formNymphKey, _controller[0]));
    rows.add(getInitialRow('images/units/cove/crew_mate.gif', 'crew_mate',
        gVars.formCreMateKey, _controller[1]));
    rows.add(getInitialRow('images/units/cove/pirate.gif', 'pirate',
        gVars.formPirateKey, _controller[2]));
    rows.add(getInitialRow('images/units/cove/stormbird.gif', 'stormbird',
        gVars.formStormbirdKey, _controller[3]));
    rows.add(getInitialRow('images/units/cove/sea_witch.gif', 'sea_witch',
        gVars.formSeaWitchKey, _controller[4]));
    return rows;
  }

  List<Widget> generateInitialNeutralsRows() {
    List<Widget> rows = List();
    rows.add(getInitialRow('images/units/neutrals/peasant.gif', 'peasant',
        gVars.formPeasantKey, _controller[0]));
    rows.add(getInitialRow('images/units/neutrals/halfling.gif', 'halfling',
        gVars.formHalflingKey, _controller[1]));
    rows.add(getInitialRow('images/units/neutrals/boar.gif', 'boar',
        gVars.formBoarKey, _controller[2]));
    rows.add(getInitialRow('images/units/neutrals/leprechaun.gif', 'leprechaun',
        gVars.formLeprechaunKey, _controller[3]));
    rows.add(getInitialRow('images/units/neutrals/rogue.gif', 'rogue',
        gVars.formRogueKey, _controller[4]));
    rows.add(getInitialRow('images/units/neutrals/nomad.gif', 'nomad',
        gVars.formNomadKey, _controller[5]));
    rows.add(getInitialRow('images/units/neutrals/satyr.gif', 'satyr',
        gVars.formSatyrKey, _controller[6]));
    rows.add(getInitialRow('images/units/neutrals/sharpshooter.gif',
        'sharpshooter', gVars.formSharpshooterKey, _controller[7]));
    rows.add(getInitialRow('images/units/neutrals/troll.gif', 'troll',
        gVars.formTrollKey, _controller[8]));
    rows.add(getInitialRow('images/units/neutrals/fangarm.gif', 'fangarm',
        gVars.formFangarmKey, _controller[9]));
    return rows;
  }

  //adding to list of rows after conversion
  void addFinalRow (List<Widget> rows, String path, String unit, int hp) {
    rows.add(getFinalRow(
        path,
        minAmountForConversion(
            unit,
            gVars.ring1,
            gVars.ring2,
            gVars.vial,
            gVars.elixir,
            gVars.unitsInfo[unit],
            hp,
            gVars.unitsInfo['pit_lord']),
        finalAmountAfterConversion(
            gVars.ring1,
            gVars.ring2,
            gVars.vial,
            gVars.elixir,
            gVars.unitsInfo[unit],
            hp,
            gVars.unitsInfo['pit_lord'])));
  }

  //generating all final rows
  List<Widget> generateFinalCastleRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/castle/pikeman.gif', 'pikeman', GVars.pikemanHP);
    addFinalRow(rows,'images/units/castle/archer.gif', 'archer', GVars.archerHP);
    addFinalRow(rows,'images/units/castle/griffin.gif', 'griffin', GVars.griffinHP);
    addFinalRow(rows,'images/units/castle/swordsman.gif', 'swordsman', GVars.swordsmanHP);
    addFinalRow(rows,'images/units/castle/monk.gif', 'monk', GVars.monkHP);
    return rows;
  }

  List<Widget> generateFinalRampartRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/rampart/centaur.gif', 'centaur', GVars.centaurHP);
    addFinalRow(rows,'images/units/rampart/centaur_captain.gif', 'centaur_captain', GVars.centaur_captainHP);
    addFinalRow(rows,'images/units/rampart/dwarf.gif', 'dwarf', GVars.dwarfHP);
    addFinalRow(rows,'images/units/rampart/wood_elf.gif', 'wood_elf', GVars.wood_elfHP);
    addFinalRow(rows,'images/units/rampart/pegasus.gif', 'pegasus', GVars.pegasusHP);
    addFinalRow(rows,'images/units/rampart/dendroid.gif', 'dendroid', GVars.dendroidHP);
    return rows;
  }

  List<Widget> generateFinalTowerRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/tower/gremlin.gif', 'gremlin', GVars.gremlinHP);
    addFinalRow(rows,'images/units/tower/mage.gif', 'mage', GVars.mageHP);
    addFinalRow(rows,'images/units/tower/arch_mage.gif', 'arch_mage', GVars.arch_mageHP);
    addFinalRow(rows,'images/units/tower/genie.gif', 'genie', GVars.genieHP);
    return rows;
  }

  List<Widget> generateFinalInfernoRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/inferno/imp.gif', 'imp', GVars.impHP);
    addFinalRow(rows,'images/units/inferno/gog.gif', 'gog', GVars.gogHP);
    addFinalRow(rows,'images/units/inferno/hell_hound.gif', 'hell_hound', GVars.hell_houndHP);
    return rows;
  }

  List<Widget> generateFinalDungeonRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/dungeon/troglodyte.gif', 'troglodyte', GVars.troglodyteHP);
    addFinalRow(rows,'images/units/dungeon/infernal_troglodyte.gif', 'infernal_troglodyte', GVars.infernal_troglodyteHP);
    addFinalRow(rows,'images/units/dungeon/harpy.gif', 'harpy', GVars.harpyHP);
    addFinalRow(rows,'images/units/dungeon/beholder.gif', 'beholder', GVars.beholderHP);
    addFinalRow(rows,'images/units/dungeon/medusa.gif', 'medusa', GVars.medusaHP);
    addFinalRow(rows,'images/units/dungeon/medusa_queen.gif', 'medusa_queen', GVars.medusa_queenHP);
    addFinalRow(rows,'images/units/dungeon/minotaur.gif', 'minotaur', GVars.minotaurHP);
    return rows;
  }

  List<Widget> generateFinalStrongholdRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/stronghold/goblin.gif', 'goblin', GVars.goblinHP);
    addFinalRow(rows,'images/units/stronghold/wolf_rider.gif', 'wolf_rider', GVars.wolf_riderHP);
    addFinalRow(rows,'images/units/stronghold/orc.gif', 'orc', GVars.orcHP);
    addFinalRow(rows,'images/units/stronghold/orc_chieftain.gif', 'orc_chieftain', GVars.orc_chieftainHP);
    addFinalRow(rows,'images/units/stronghold/ogre.gif', 'ogre', GVars.ogreHP);
    addFinalRow(rows,'images/units/stronghold/roc.gif', 'roc', GVars.rocHP);
    return rows;
  }

  List<Widget> generateFinalFortressRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/fortress/gnoll.gif', 'gnoll', GVars.gnollHP);
    addFinalRow(rows,'images/units/fortress/lizzardman.gif', 'lizzardman', GVars.lizzardmanHP);
    addFinalRow(rows,'images/units/fortress/lizzard_warrior.gif', 'lizzard_warrior', GVars.lizzard_warriorHP);
    addFinalRow(rows,'images/units/fortress/serpent_fly.gif', 'serpent_fly', GVars.serpent_flyHP);
    addFinalRow(rows,'images/units/fortress/basilisk.gif', 'basilisk', GVars.basiliskHP);
    addFinalRow(rows,'images/units/fortress/gorgon.gif', 'gorgon', GVars.gorgonHP);
    return rows;
  }

  List<Widget> generateFinalConfluxRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/conflux/pixie.gif', 'pixie', GVars.pixieHP);
    return rows;
  }

  List<Widget> generateFinalCoveRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/cove/nymph.gif', 'nymph', GVars.nymphHP);
    addFinalRow(rows,'images/units/cove/crew_mate.gif', 'crew_mate', GVars.crew_mateHP);
    addFinalRow(rows,'images/units/cove/pirate.gif', 'pirate', GVars.pirateHP);
    addFinalRow(rows,'images/units/cove/stormbird.gif', 'stormbird', GVars.stormbirdHP);
    addFinalRow(rows,'images/units/cove/sea_witch.gif', 'sea_witch', GVars.sea_witchHP);
    return rows;
  }

  List<Widget> generateFinalNeutralsRows() {
    List<Widget> rows = List();
    addFinalRow(rows,'images/units/neutrals/peasant.gif', 'peasant', GVars.peasantHP);
    addFinalRow(rows,'images/units/neutrals/halfling.gif', 'halfling', GVars.halflingHP);
    addFinalRow(rows,'images/units/neutrals/boar.gif', 'boar', GVars.boarHP);
    addFinalRow(rows,'images/units/neutrals/leprechaun.gif', 'leprechaun', GVars.leprechaunHP);
    addFinalRow(rows,'images/units/neutrals/rogue.gif', 'rogue', GVars.rogueHP);
    addFinalRow(rows,'images/units/neutrals/nomad.gif', 'nomad', GVars.nomadHP);
    addFinalRow(rows,'images/units/neutrals/satyr.gif', 'satyr', GVars.satyrHP);
    addFinalRow(rows,'images/units/neutrals/sharpshooter.gif', 'sharpshooter', GVars.sharpshooterHP);
    addFinalRow(rows,'images/units/neutrals/troll.gif', 'troll', GVars.trollHP);
    addFinalRow(rows,'images/units/neutrals/fangarm.gif', 'fangarm', GVars.fangarmHP);
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/app_style/app_bg.jpg"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(0),
            child: SingleChildScrollView(
            child: Column (
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - (32.0 * 1.5 + 2),
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    width: 140,
                    height: 35,
                    child: Text("Meat converter",
                        style: TextStyle(
                            color: Color.fromRGBO(250, 228, 150, 1),
                            fontSize: 20)),
                  ),
                  //choosing screen content depending on town chosen previously and either initial screen state or after conversion
                  gVars.town == 'castle'
                      ? (finalIndex == 0
                          ? Column(children: [
                              generateInitialCastleRows()[0],
                              generateInitialCastleRows()[1],
                              generateInitialCastleRows()[2],
                              generateInitialCastleRows()[3],
                              generateInitialCastleRows()[4],
                            ])
                          : Column(children: [
                              generateFinalCastleRows()[0],
                              generateFinalCastleRows()[1],
                              generateFinalCastleRows()[2],
                              generateFinalCastleRows()[3],
                              generateFinalCastleRows()[4],
                            ]))
                      : gVars.town == 'rampart' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialRampartRows()[0],
                        generateInitialRampartRows()[1],
                        generateInitialRampartRows()[2],
                        generateInitialRampartRows()[3],
                        generateInitialRampartRows()[4],
                        generateInitialRampartRows()[5],
                      ]) :
                      Column(children: [
                        generateFinalRampartRows()[0],
                        generateFinalRampartRows()[1],
                        generateFinalRampartRows()[2],
                        generateFinalRampartRows()[3],
                        generateFinalRampartRows()[4],
                        generateFinalRampartRows()[5],
                      ])) : gVars.town == 'tower' ?
                      (finalIndex == 0 ? Column(children: [
                        generateInitialTowerRows()[0],
                        generateInitialTowerRows()[1],
                        generateInitialTowerRows()[2],
                        generateInitialTowerRows()[3],
                      ]) :
                      Column(children: [
                        generateFinalTowerRows()[0],
                        generateFinalTowerRows()[1],
                        generateFinalTowerRows()[2],
                        generateFinalTowerRows()[3],
                      ])) : gVars.town == 'inferno' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialInfernoRows()[0],
                        generateInitialInfernoRows()[1],
                        generateInitialInfernoRows()[2],
                      ]) :
                      Column(children: [
                        generateFinalInfernoRows()[0],
                        generateFinalInfernoRows()[1],
                        generateFinalInfernoRows()[2],
                      ])) : gVars.town == 'dungeon' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialDungeonRows()[0],
                        generateInitialDungeonRows()[1],
                        generateInitialDungeonRows()[2],
                        generateInitialDungeonRows()[3],
                        generateInitialDungeonRows()[4],
                        generateInitialDungeonRows()[5],
                        generateInitialDungeonRows()[6],
                      ]) :
                      Column(children: [
                        generateFinalDungeonRows()[0],
                        generateFinalDungeonRows()[1],
                        generateFinalDungeonRows()[2],
                        generateFinalDungeonRows()[3],
                        generateFinalDungeonRows()[4],
                        generateFinalDungeonRows()[5],
                        generateFinalDungeonRows()[6],
                      ])) : gVars.town == 'stronghold' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialStrongholdRows()[0],
                        generateInitialStrongholdRows()[1],
                        generateInitialStrongholdRows()[2],
                        generateInitialStrongholdRows()[3],
                        generateInitialStrongholdRows()[4],
                        generateInitialStrongholdRows()[5],
                      ]) :
                      Column(children: [
                        generateFinalStrongholdRows()[0],
                        generateFinalStrongholdRows()[1],
                        generateFinalStrongholdRows()[2],
                        generateFinalStrongholdRows()[3],
                        generateFinalStrongholdRows()[4],
                        generateFinalStrongholdRows()[5],
                      ])) : gVars.town == 'fortress' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialFortressRows()[0],
                        generateInitialFortressRows()[1],
                        generateInitialFortressRows()[2],
                        generateInitialFortressRows()[3],
                        generateInitialFortressRows()[4],
                        generateInitialFortressRows()[5],
                      ]) :
                      Column(children: [
                        generateFinalFortressRows()[0],
                        generateFinalFortressRows()[1],
                        generateFinalFortressRows()[2],
                        generateFinalFortressRows()[3],
                        generateFinalFortressRows()[4],
                        generateFinalFortressRows()[5],
                      ])) : gVars.town == 'conflux' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialConfluxRows()[0],
                      ]) :
                      Column(children: [
                        generateFinalConfluxRows()[0],
                      ])) : gVars.town == 'cove' ?
                      (finalIndex == 0 ?
                      Column(children: [
                        generateInitialCoveRows()[0],
                        generateInitialCoveRows()[1],
                        generateInitialCoveRows()[2],
                        generateInitialCoveRows()[3],
                        generateInitialCoveRows()[4],
                      ]) :
                      Column(children: [
                        generateFinalCoveRows()[0],
                        generateFinalCoveRows()[1],
                        generateFinalCoveRows()[2],
                        generateFinalCoveRows()[3],
                        generateFinalCoveRows()[4],
                      ])) : gVars.town == 'neutrals' ?
                        (finalIndex == 0 ?
                      Column(children: [
                        generateInitialNeutralsRows()[0],
                        generateInitialNeutralsRows()[1],
                        generateInitialNeutralsRows()[2],
                        generateInitialNeutralsRows()[3],
                        generateInitialNeutralsRows()[4],
                        generateInitialNeutralsRows()[5],
                        generateInitialNeutralsRows()[6],
                        generateInitialNeutralsRows()[7],
                        generateInitialNeutralsRows()[8],
                        generateInitialNeutralsRows()[9],
                      ]) :
                      Column(children: [
                        generateFinalNeutralsRows()[0],
                        generateFinalNeutralsRows()[1],
                        generateFinalNeutralsRows()[2],
                        generateFinalNeutralsRows()[3],
                        generateFinalNeutralsRows()[4],
                        generateFinalNeutralsRows()[5],
                        generateFinalNeutralsRows()[6],
                        generateFinalNeutralsRows()[7],
                        generateFinalNeutralsRows()[8],
                        generateFinalNeutralsRows()[9],
                      ]))
                      : Column(children: []),
                  ])
                  ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide (
                                  color: Color.fromRGBO(250, 228, 150, 1)
                          )
                      )
                  ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(
                          width: 66.0 * 1.5,
                          height: 32.0 * 1.5,
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: RaisedButton(
                                  onPressed: () {
                                    BlocProvider.of<MainCubit>(context)
                                        .toSecondScreen(gVars);
                                  },
                                  padding: EdgeInsets.all(0.0),
                                  child:
                                  Image.asset('images/app_style/cancel.png')))),
                      if (finalIndex == 0) Container(
                          width: 66.0 * 1.5,
                          height: 32.0 * 1.5,
                          child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: RaisedButton(
                                  onPressed: () {
                                    //saving all entered values of units amount (initial screen state)
                                    if (gVars.town == 'castle') {
                                      if (gVars.formPikemanKey.currentState
                                          .validate()) {
                                        gVars.formPikemanKey.currentState.save();
                                      }
                                      if (gVars.formArcherKey.currentState
                                          .validate()) {
                                        gVars.formArcherKey.currentState.save();
                                      }
                                      if (gVars.formGriffinKey.currentState
                                          .validate()) {
                                        gVars.formGriffinKey.currentState.save();
                                      }
                                      if (gVars.formSwordsmanKey.currentState
                                          .validate()) {
                                        gVars.formSwordsmanKey.currentState.save();
                                      }
                                      if (gVars.formMonkKey.currentState
                                          .validate()) {
                                        gVars.formMonkKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'rampart') {
                                      if (gVars.formCentaurKey.currentState
                                          .validate()) {
                                        gVars.formCentaurKey.currentState.save();
                                      }
                                      if (gVars.formCentaurCaptainKey.currentState
                                          .validate()) {
                                        gVars.formCentaurCaptainKey.currentState
                                            .save();
                                      }
                                      if (gVars.formDwarfKey.currentState
                                          .validate()) {
                                        gVars.formDwarfKey.currentState.save();
                                      }
                                      if (gVars.formWoodElfKey.currentState
                                          .validate()) {
                                        gVars.formWoodElfKey.currentState.save();
                                      }
                                      if (gVars.formPegasusKey.currentState
                                          .validate()) {
                                        gVars.formPegasusKey.currentState.save();
                                      }
                                      if (gVars.formDendroidKey.currentState
                                          .validate()) {
                                        gVars.formDendroidKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'tower') {
                                      if (gVars.formGremlinKey.currentState
                                          .validate()) {
                                        gVars.formGremlinKey.currentState.save();
                                      }
                                      if (gVars.formMageKey.currentState
                                          .validate()) {
                                        gVars.formMageKey.currentState.save();
                                      }
                                      if (gVars.formArchMageKey.currentState
                                          .validate()) {
                                        gVars.formArchMageKey.currentState.save();
                                      }
                                      if (gVars.formGenieKey.currentState
                                          .validate()) {
                                        gVars.formGenieKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'inferno') {
                                      if (gVars.formImpKey.currentState
                                          .validate()) {
                                        gVars.formImpKey.currentState.save();
                                      }
                                      if (gVars.formGogKey.currentState
                                          .validate()) {
                                        gVars.formGogKey.currentState.save();
                                      }
                                      if (gVars.formHellHoundKey.currentState
                                          .validate()) {
                                        gVars.formHellHoundKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'dungeon') {
                                      if (gVars.formTroglodyteKey.currentState
                                          .validate()) {
                                        gVars.formTroglodyteKey.currentState.save();
                                      }
                                      if (gVars
                                          .formInfernalTroglodyteKey.currentState
                                          .validate()) {
                                        gVars.formInfernalTroglodyteKey.currentState
                                            .save();
                                      }
                                      if (gVars.formHarpyKey.currentState
                                          .validate()) {
                                        gVars.formHarpyKey.currentState.save();
                                      }
                                      if (gVars.formBeholderKey.currentState
                                          .validate()) {
                                        gVars.formBeholderKey.currentState.save();
                                      }
                                      if (gVars.formMedusaKey.currentState
                                          .validate()) {
                                        gVars.formMedusaKey.currentState.save();
                                      }
                                      if (gVars.formMedusaQueenKey.currentState
                                          .validate()) {
                                        gVars.formMedusaQueenKey.currentState
                                            .save();
                                      }
                                      if (gVars.formMinotaurKey.currentState
                                          .validate()) {
                                        gVars.formMinotaurKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'stronghold') {
                                      if (gVars.formGoblinKey.currentState
                                          .validate()) {
                                        gVars.formGoblinKey.currentState.save();
                                      }
                                      if (gVars.formWolfRiderKey.currentState
                                          .validate()) {
                                        gVars.formWolfRiderKey.currentState.save();
                                      }
                                      if (gVars.formOrcKey.currentState
                                          .validate()) {
                                        gVars.formOrcKey.currentState.save();
                                      }
                                      if (gVars.formOrcChieftainKey.currentState
                                          .validate()) {
                                        gVars.formOrcChieftainKey.currentState
                                            .save();
                                      }
                                      if (gVars.formOgreKey.currentState
                                          .validate()) {
                                        gVars.formOgreKey.currentState.save();
                                      }
                                      if (gVars.formRocKey.currentState
                                          .validate()) {
                                        gVars.formRocKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'fortress') {
                                      if (gVars.formGnollKey.currentState
                                          .validate()) {
                                        gVars.formGnollKey.currentState.save();
                                      }
                                      if (gVars.formLizzardmanKey.currentState
                                          .validate()) {
                                        gVars.formLizzardmanKey.currentState.save();
                                      }
                                      if (gVars.formLizzardWarriorKey.currentState
                                          .validate()) {
                                        gVars.formLizzardWarriorKey.currentState
                                            .save();
                                      }
                                      if (gVars.formSerpentFlyKey.currentState
                                          .validate()) {
                                        gVars.formSerpentFlyKey.currentState.save();
                                      }
                                      if (gVars.formBasiliskKey.currentState
                                          .validate()) {
                                        gVars.formBasiliskKey.currentState.save();
                                      }
                                      if (gVars.formGorgonKey.currentState
                                          .validate()) {
                                        gVars.formGorgonKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'conflux') {
                                      if (gVars.formPixieKey.currentState
                                          .validate()) {
                                        gVars.formPixieKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'cove') {
                                      if (gVars.formNymphKey.currentState
                                          .validate()) {
                                        gVars.formNymphKey.currentState.save();
                                      }
                                      if (gVars.formCreMateKey.currentState
                                          .validate()) {
                                        gVars.formCreMateKey.currentState.save();
                                      }
                                      if (gVars.formPirateKey.currentState
                                          .validate()) {
                                        gVars.formPirateKey.currentState.save();
                                      }
                                      if (gVars.formStormbirdKey.currentState
                                          .validate()) {
                                        gVars.formStormbirdKey.currentState.save();
                                      }
                                      if (gVars.formSeaWitchKey.currentState
                                          .validate()) {
                                        gVars.formSeaWitchKey.currentState.save();
                                      }
                                    }
                                    else if (gVars.town == 'neutrals') {
                                      if (gVars.formPeasantKey.currentState
                                          .validate()) {
                                        gVars.formPeasantKey.currentState.save();
                                      }
                                      if (gVars.formHalflingKey.currentState
                                          .validate()) {
                                        gVars.formHalflingKey.currentState.save();
                                      }
                                      if (gVars.formRogueKey.currentState
                                          .validate()) {
                                        gVars.formRogueKey.currentState.save();
                                      }
                                      if (gVars.formNomadKey.currentState
                                          .validate()) {
                                        gVars.formNomadKey.currentState.save();
                                      }
                                      if (gVars.formTrollKey.currentState
                                          .validate()) {
                                        gVars.formTrollKey.currentState.save();
                                      }
                                      if (gVars.formFangarmKey.currentState
                                          .validate()) {
                                        gVars.formFangarmKey.currentState.save();
                                      }
                                      if (gVars.formSharpshooterKey.currentState
                                          .validate()) {
                                        gVars.formSharpshooterKey.currentState
                                            .save();
                                      }
                                      if (gVars.formLeprechaunKey.currentState
                                          .validate()) {
                                        gVars.formLeprechaunKey.currentState.save();
                                      }
                                      if (gVars.formSatyrKey.currentState
                                          .validate()) {
                                        gVars.formSatyrKey.currentState.save();
                                      }
                                      if (gVars.formBoarKey.currentState
                                          .validate()) {
                                        gVars.formBoarKey.currentState.save();
                                      }
                                    }
                                    //setting index for final screen state
                                    finalIndex = 1;
                                    BlocProvider.of<MainCubit>(context)
                                        .toThirdScreen(gVars);
                                  },
                                  padding: EdgeInsets.all(0.0),
                                  child: Image.asset(
                                      'images/app_style/transform.png')))),
                      ],
                    )
                  )
              ]
            )
            )
        )
    );
  }
}
