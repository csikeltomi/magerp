
var kerdesek = {
  'B_0_ALOHOMORA_1':{//kesz
    text: `Zárak feltörésére szolgáló bűbáj. Minden zár különböző erősségű és ettől függ a varázslat hatásfoka és ideje. Természetesen az ajtókat fel is lehet robbantani, de nem egy igazi varázslóhoz/boszorkányhoz méltó hozzáállás. A másik leghatásosabb bűbáj a Crepitus és ennek sötét megfelelője a Crepito. Az utóbbit csak tapasztalt varázslók használják ugyanis önveszélyes is lehet. A Crepitus/Crepito nagy erejű robbanást idéz elő, amely képes lebontani az ajtót védő varázslatot. Ne állj túl közel a robbanási területhez, ugyanis könnyen halálos is lehet rád nézve. Ennek ellenében a szofisztikáltabb Alohomora különösebb odafigyelés nélkül is képes a zárat feltörni így támadás esetén résnél tudsz lenni. Nagyon sok varázserőt vesz igénybe a használata, így jobb ha van kéznél pár bájital.`,
    label: 'Alohomora - Alapok',
    item: 'm_0_ALOHOMORA_1',
    questions : [
      {
        title: "Milyen hatása van a bübájnak?",
        multiChoice: ["Halálos","Zárfeltörő","Lefegyverző"],
        answer: "Zárfeltörő"
      },
      {
        title: "Milyen egyéb lehetőség létezik a zárak kinyitására?",
        multiChoice: ["Robbantás", "Befolyásolás", "Lebegtetés"],
        answer: "Robbantás"
      },
      {
        title: "Milyen zárakat lehet feltörni az Alohomora bűbájjal?",
        multiChoice: ["Bármilyen zárat", "Mágia által védett zárat", "Csak mugli zárat"],
        answer: "Bármilyen zárat"
      },
    ]
  },
  'B_0_BLOWAROUND-SMOKE_1':{//kesz
    text: 'A pálcáddal egy füstkört idézel meg. Ez nem ártalmas senkire, viszont az ellenfél megzavarására nincs jobb varázslat. Több köralakú varázslat létezik például a Circulus Crepitus, a Murus Ignis és a Murum Aquarum',
    label: '"Fumus Murum" - Alapok',
    item: 'm_0_BLOWAROUND-SMOKE_1',
    questions : [
      {
        title: "Milyen hatása van a varázslatnak?",
        multiChoice: ["Füstkört hoz létre", "Tűzkört hoz létre", "Füstöl a pálca"],
        answer: "Füstkört hoz létre"
      },
      {
        title: "Milyen hátrányai vannak?",
        multiChoice: ["Romolhat a látás", "Mérgező a füst", "Nincs hátrányos hatása"],
        answer: "Nincs hátrányos hatása"
      },
      {
        title: "Miért éppen kör alakú a füst?",
        multiChoice: ["Így tervezték", "A pálca csak kör alakú területi várázslatokat tud megidézni", "Középen álló személyek látásviszonyai ne változzanak"],
        answer: "Középen álló személyek látásviszonyai ne változzanak"
      },
    ]
  },
  'B_0_INVITO_1':{//kesz
    text: `Egy repülő seprűt idézel meg. Minnél jobban használod a varázslatot, annál jobb seprűt tudsz megidézni. Az első szinten csak egy Nimbus 1000-est tudsz megidézni, a legmagasabb szinten egy Nibus 8000-est. 
    Minden varázsló egy seprű gazdája lehet.`,
    label: '"Invito Nimbus" - Alapok',
    item: 'm_0_INVITO_1',
    questions : [
      {
        title: "Mennyi seprű gazdája lehetsz egy időben?",
        multiChoice: ["Egy", "Kettő", "Három"],
        answer: "Egy"
      },
      {
        title: "Milyen seprűt idézhetsz meg?",
        multiChoice: ["Bármilyet", "A varázslatsz szintjével megegyező típust", "A leglassabbat"],
        answer: "A varázslatsz szintjével megegyező típust"
      },
      {
        title: "Melyik a leggyorsabb Nibus?",
        multiChoice: ["Nimbus 7000", "Nimbus 8000", "Nimbus 8500"],
        answer: "Nimbus 8000"
      },
    ]
  },
  'B_0_LUMOS_1':{//kesz
    text: 'Mikor a sötétség körülvesz akkor hívhatod segítségül a Lumos varázslatot, mely fényt hoz a sötétségbe.',
    label: '"Lumos" - Alapok',
    item: 'm_0_LUMOS_1',
    questions : [
      {
        title: "Mire tudjuk használni a Lumos varázslatot?",
        multiChoice: ["Tábortűz gyújtásra", "Láthatatlanná válásra", "Fényforrásként használható"],
        answer: "Fényforrásként használható"
      },
      {
        title: "Mi történik ha túl sokszor használom a Lumos varázslatot?",
        multiChoice: ["Semmi", "Eltörik a pálcám", "Felfog keresni a Mágiaügyi minisztérium"],
        answer: "Semmi"
      },
      {
        title: "Veszélyes-e a Lumos varázslat az idézőre?",
        multiChoice: ["Ez egy ártalmatlan varázslat", "Igen ha egy tűzveszélyes tárgy közelében használom", "Minden varázslat lehet veszélyes"],
        answer: "Ez egy ártalmatlan varázslat"
      },
    ]
  },
  'B_0_TELEPORT2_1':{
    text: 'A célszemély néhány másodpercre elájul. A latin „stupor" kábultság szóból. Az átok hatása alatt a célszemély védett minden fizikai támadás és serülés ellen.',
    label: '"Stupor" - Alapok',
    item: 'm_0_TELEPORT2_1',
    questions : [
      {
        title: "Milyen hatása van az átoknak",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Kábító"
      },
    ]
  },
  'B_0_TELEPORT_1':{
    text: 'A célszemély néhány másodpercre elájul. A latin „stupor" kábultság szóból. Az átok hatása alatt a célszemély védett minden fizikai támadás és serülés ellen.',
    label: '"Stupor" - Alapok',
    item: 'm_0_TELEPORT_1',
    questions : [
      {
        title: "Milyen hatása van az átoknak",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Kábító"
      },
    ]
  },
  'B_10_BLOWAROUND-EXPLOSION_1':{//kesz
    text: 'Megidézel egy kört magadkörül ami robbanásokat idéz elő. Veszélyes és magas koncentrációt igénylő varázslat!',
    label: '"Circulus Crepitus" - Alapok',
    item: 'm_10_BLOWAROUND-EXPLOSION_1',
    questions : [
      {
        title: "Milyen hatása van az átoknak?",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Halálos"
      },
      {
        title: "Mikor érdemes használni a varázslatot?",
        multiChoice: ["Ha támadás ér", "Ha valakit megtámadok", "Bármikor, hisz jól néz ki"],
        answer: "Ha támadás ér"
      },
      {
        title: "Veszélyes-e a varázslat az idézőre?",
        multiChoice: ["Igen, halálos az idézőre", "Az idézőre nincs hatással", "Ki kell próbálni"],
        answer: "Igen, halálos az idézőre"
      },
    ]
  },
  'B_10_BLOWAROUND-FIRE_1':{//kesz
    text: 'Megidézel egy lángoló kört, ami tökéletes a támadók visszatartására és a menekülésre is egyaránt! Vigyázz nehogy megégesd magad.',
    label: '"Murus Ignis" - Alapok',
    item: 'm_10_BLOWAROUND-FIRE_1',
    questions : [
      {
        title: "Hol tanulhatod meg ezt a varázslatot?",
        multiChoice: ["A varázsló iskolában", "Ez sötétmágia nem tanulható", "Varázsló könyvekből"],
        answer: "Varázsló könyvekből"
      },
      {
        title: "Mi történik ha használom a varázslatot?",
        multiChoice: ["Tűzcsóvát lövök ki", "Füstkört hozok létre", "Tűzkört hozok létre"],
        answer: "Tűzkört hozok létre"
      },
      {
        title: "Mi történik ha használom a Permoveo varázslatot a körben?",
        multiChoice: ["Sérülés nélkül kiteleportálok", "Megégek ha megpróbálok teleportálni", "Nem tudom használni a Permoveot"],
        answer: "Sérülés nélkül kiteleportálok"
      },
    ]
  },
  'B_10_BLOW_1':{//kesz
    text: 'Egy robbanó varázslat amely a becsapdáskor felrobban és megsemmisül minden körülötte. Halálos varázslat amely veszélyes a használójára is. ',
    label: '"Crepitus" - Alapok',
    item: 'm_10_BLOW_1',
    questions : [
      {
        title: "Milyen kategórába tartozik a varázslat?",
        multiChoice: ["Támadó", "Segédvarázslat", "Védekező"],
        answer: "Támadó"
      },
      {
        title: "Mi történik, ha rendelkezem kék kristállyal és úgy használom a varázslatot?",
        multiChoice: ["Erősebb lesz a varázslat", "Nincs rá hatással", "Kevesebb energiára lesz szükségem hozzá"],
        answer: "Kevesebb energiára lesz szükségem hozzá"
      },
      {
        title: "Ha véletlenül eltalálom vele a Nimbusomat akkor...",
        multiChoice: ["Felrobban és nemtudom többé használni", "Nem ártalmas a Nimbusra", "Visszapattan a varázslat rám"],
        answer: "Felrobban és nemtudom többé használni"
      },
    ]
  },
  'B_1_STUN_1':{//kesz
    text: 'A célszemély néhány másodpercre elájul. A latin „stupor" kábultság szóból. Az átok hatása alatt a célszemély védett minden fizikai támadás és serülés ellen. A varázslat halált is okozhat, ammenyiben a célpontot sérülés éri közvetlenül a hatás elmúlása utana.',
    label: '"Stupor" - Alapok',
    item: 'm_1_STUN_1',
    questions : [
      {
        title: "Milyen hatása van az átoknak",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Kábító"
      },
      {
        title: "Halálos is lehet a varázslat?",
        multiChoice: ["Igen", "Nem"],
        answer: "Igen"
      },
    ]
  },
  'B_1_WATER_1':{//kesz
    text: 'Megidézel egy vízoszlopot ami hátralök bárkit aki belemegy. Olyan varázslat ami nem okoz nagy sérülést viszont időt tudsz vele nyerni, hogy eldőljön miképp folytatódik a szituáció.',
    label: '"Aqua" - Alapok',
    item: 'm_1_WATER_1',
    questions : [
      {
        title: "Ha van nálad sárga kristály, hogy befolyásolja a varázslatot?",
        multiChoice: ["Gyorsabban tudom újra használni a varázslatot", "Magasabbra löki az ellenfelet", "Tovább marad a földön az ellenfél"],
        answer: "Gyorsabban tudom újra használni a varázslatot"
      },
      {
        title: "Ha tüzet látok ellehet-e oltani a varázslattal?",
        multiChoice: ["Igen", "Minek oltanám el", "Nem lehet vele tüzet oltani"],
        answer: "Igen"
      },
      {
        title: "Ha van nálad piros kristály, hogy befolyásolja a varázslatot?",
        multiChoice: ["Gyorsabban tudom újra használni a varázslatot", "Kevesebb energiára van szükségem a varázslathoz", "Sehogy, mert a piros kristály az életerő regenerálódáshoz kell"],
        answer: "Sehogy, mert a piros kristály az életerő regenerálódáshoz kell"
      },
    ]
  },
  'B_2_REVIVE_1':{//kesz
    text: 'A testi épségednek egy részét a célpont feltámasztására használod. Ez a varázslat nagyon veszélyes, ugyanis az életed egyharmadát felemészti és így hálált is okozhat. Ajánlott felgyógyulni használata után "Élet esszencia" segítségével.',
    label: '"Resurrectio" - Alapok',
    item: 'm_2_REVIVE_1',
    questions : [
      {
        title: "Milyen hatása van a varázslatnak?",
        multiChoice: ["Gyógyító", "Feltámatszás", "Halálos"],
        answer: "Feltámatszás"
      },
      {
        title: "Mennyi újraélesztést lehet végrehajtani gyógyulás nélkül?",
        multiChoice: ["Egy", "Kettő", "Három"],
        answer: "Kettő"
      },
      {
        title: "Milyen varazserő igénye van?",
        multiChoice: ["Kicsi", "Nagy", "Átlagos"],
        answer: "Nagy"
      },
      {
        title: "Ki számára lehet halálos?",
        multiChoice: ["Önmagam", "Más varázslók", "Muglik"],
        answer: "Önmagam"
      },
    ]
  },
  //NINCS ITEM
  'B_11_PORTAL1_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL1_10',
    questions : [
      {
        title: "???",
        multiChoice: ["???", "??", "????"],
        answer: "??",
      },
      {
        title: "???",
        multiChoice: [",,,,", ",,,,,", ",,,"],
        answer: ",,,"
      },
    ]
  },
  'B_11_PORTAL2_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL2_10',
    questions : [
      {
        title: "???",
        multiChoice: ["???", "??", "????"],
        answer: "????",
      },
      {
        title: "???",
        multiChoice: [",,,,", ",,,,,", ",,,"],
        answer: ",,,,,"
      },
    ]
  },
  'B_11_PORTAL3_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL3_10',
    questions : [
      {
        title: "???",
        multiChoice: ["???", "??", "????"],
        answer: "??",
      },
      {
        title: "???",
        multiChoice: [",,,,,,,", ",,,,,", ","],
        answer: ","
      },
    ]
  },
  'B_11_PORTAL4_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL4_10',
    questions : [
      {
        title: "???",
        multiChoice: ["???", "?", "????"],
        answer: "?",
      },
      {
        title: "???",
        multiChoice: [",,,,,,,", ",,,,", ","],
        answer: ",,,,",
      },
    ]
  },
  'B_11_PORTAL5_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL5_10',
    questions : [
      {
        title: "???",
        multiChoice: ["??", "?", "????"],
        answer: "??",
      },
      {
        title: "???",
        multiChoice: [",,,,,,,", ",,,,", ",,,"],
        answer: ",,,",
      },
    ]
  },
  'B_11_PORTAL6_10':{
    text: '???.',
    label: 'Átjáró',
    item: 'm_11_PORTAL6_10',
    questions : [
      {
        title: "!!!!",
        multiChoice: [",,,,", "!!!!!!!!", "????"],
        answer: "????",
      },
      {
        title: "...",
        multiChoice: [",,,,,,,", ",,,,", ",,"],
        answer: ",,",
      },
    ]
  },
  'B_11_IMPERIO_1':{//kesz
    text: 'A méltán híres kényszerítő bűbáj amely használatával egy időre minden parancsodat teljesíti az akit elvarázsoltál. Nagyon veszélyes és nagyon erős koncentrációt igénylő varázslat.',
    label: '"Imperio" - Alapok',
    item: 'm_11_IMPERIO_1',
    questions : [
      {
        title: "Mire kell figyelnem a varázslat használatakor?",
        multiChoice: ["Nem távolodhatok el messzire az áldozattól", "Akár ölni is tudok vele", "Nagyon rossz dolgokra is lehet használni"],
        answer: "Nem távolodhatok el messzire az áldozattól"
      },
      {
        title: "Mi jelöli a távolságot amin belül kell maradjak?",
        multiChoice: ["Egy lila buborék ami körül vesz minket", "Egy sugárnyaláb ami összeköt minket", "A távolság mindig változó"],
        answer: "Egy lila buborék ami körül vesz minket"
      },
      {
        title: "Mi történik ha távol kerülök az áldozattól?",
        multiChoice: ["Semmi", "Semmi, ha közelebb megyek minden folytatódik", "Megszűnik a varázslat"],
        answer: "Megszűnik a varázslat"
      },
    ]
  },
  'B_0_WALL_10':{//kesz
    text: 'Egy védőfalat hoz létre amely megvéd a legtöbb varázslattól. Vigyázz, mert vannak varázslatok amik áthatolnak rajta! ( Stupor, Avadakedabra )',
    label: '"Defendo" - Alapok',
    item: 'm_0_WALL_10',
    questions : [
      {
        title: "Mi törénik a varázslat használatakor",
        multiChoice: ["Visszapattan a varázslat", "Egy védő falat hoz létre 3mp-ig", "Láthatatlanná válok tőle"],
        answer: "Egy védőfalat hoz létre 3mp-ig"
      },
      {
        title: "Hány másodpercig tart a fal?",
        multiChoice: ["2", "3", "4"],
        answer: "3"
      },
      {
        title: "Milyen átoknak nem áll ellen a varázslat?",
        multiChoice: ["Védekező", "Támadó", "Segédvarázslat", "Néhány támadóvarázslat"],
        answer: "Néhány támadóvarázslat"
      },
    ]
  },
  'B_10_FIRE_1':{//kesz
    text: 'Lángba borul a talaj egy időre. Vigyázz, mert könnyen felgyújthatod az egész környéket! Ha véletlenül belesétálsz akkor könnyen megégetheted magad!',
    label: '"Ignis" - Alapok',
    item: 'm_10_FIRE_1',
    questions : [
      {
        title: "Milyen hatása van a varázslatnak?",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Halálos"
      },
      {
        title: "Mit kell tenned ha égési sérüléseket szenvedsz?",
        multiChoice: ["Keresek egy gyógyítót", "Úgy teszek mintha nem történt volna semmi", "Bemegyek a mágiaügyi minisztériumba"],
        answer: "Keresek egy gyógyítót"
      },
    ]
  },
  'B_11_AVADAKEDABRA_1':{//kesz
    text: 'Sötétmágia? Nem javasoljuk az használatát? Beláthatatlan következményei lehetnek?!',
    label: '"Avada Kedavra" - Alapok',
    item: 'm_11_AVADAKEDABRA_1',
    questions : [
      {
        title: "Milyen hatása van az átoknak,,",
        multiChoice: ["torpentes", "mortiferum", "nihil"],
        answer: "mortiferum"
      },
      {
        title: "Hogyan tanulhatom meg,",
        multiChoice: ["???", "??", "????"],
        answer: "???"
      },
      {
        title: "Biztos, vagyok benne!",
        multiChoice: [",,,,", ",,,,,", ",,,"],
        answer: ",,,,"
      },
    ]
  },
  'B_11_BLACKBLOW_1':{//kesz
    text: 'Egy robbanósávot idézel meg vele! Minden ami az útjába kerül darabokra hullik. Vigyázz, mert nem csak a célpontot robbantod fel vele!',
    label: '"Crepito" - Alapok',
    item: 'm_11_BLACKBLOW_1',
    questions : [
      {
        title: "Hatásos-e a defendoval szemben?",
        multiChoice: ["Nem", "Igen", "Többszöri használat után igen"],
        answer: "Nem"
      },
      {
        title: "Használható-e a levegőben?",
        multiChoice: ["Igen", "Nem", "Igen, de a nagy része a földre esik"],
        answer: "Igen"
      },
      {
        title: "Alakváltás közben lehet használni?",
        multiChoice: ["Nem lehet varázsolni alakváltás közben", "Lehet, de TILOS!", "Bizonyos esetekben igen"],
        answer: "Nem lehet varázsolni alakváltás közben"
      },
    ]
  },
  'B_11_BLACKFIRE_1':{//kesz
    text: 'Egy tűzcsóvát idézel meg amely nagyon látványos és nem kevésbé veszélytelen! Csak saját felelősségre!.',
    label: '"Ignitio" - Alapok',
    item: 'm_11_BLACKFIRE_1',
    questions : [
      {
        title: "Milyen hatása van az varázslatnak",
        multiChoice: ["Kábító", "Halálos", "Lefegyverző"],
        answer: "Halálos"
      },
      {
        title: "Milyen varázslat kategóriába tartozik?",
        multiChoice: ["Sötét", "Hagyományos", "Segédvarázslat"],
        answer: "Sötét"
      },
    ]
  },
}