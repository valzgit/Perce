import 'package:flutter/material.dart';
import 'package:perce/Hive/boxes.dart';
import 'package:perce/Routing/route_generator.dart';
import "package:hive_flutter/hive_flutter.dart";

import 'Hive/transaction.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LoggedUserAdapter());
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(UserBookRelationAdapter());
  Hive.registerAdapter(StoredBookAdapter());
  await Hive.openBox<User>("users");
  await Hive.openBox<LoggedUser>("loggedUser");
  await Hive.openBox<Book>("books");
  await Hive.openBox<UserBookRelation>("userbookrelations");
  await Hive.openBox<StoredBook>("storedbooks");
  final usersBox = Boxes.getUsers();
  final shelf = Boxes.getBooks();
  final buyer = User()
    ..name = "user"
    ..password = "Password123!"
    ..lastName = "user"
    ..userName = "user"
    ..phoneNumber = "64245624624"
    ..email = "user@user.com"
    ..buyer = true;
  final seller = User()
    ..name = "prod"
    ..password = "Password123!"
    ..lastName = "prod"
    ..userName = "prod"
    ..phoneNumber = "46265262356"
    ..email = "prod@prod.com"
    ..buyer = false;
  List<Book> bookList = new List<Book>();
  bookList.add(Book()
    ..name = "Zlocin i kazna"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "crimeandpunishment.png"
    ..promoted = true
    ..placeYear = "Beograd, 2016."
    ..pageNumber = 654
    ..details =
        '"Zlocin i kazna" predstavlja sintezu raznih osobina romanesknog zanra. Ovo je kriminalni roman, jer govori o junaku ubici i o traganju policije za njim. Takodje je i psiholoski roman, jer se likovi u romanu razotkrivaju analizom psihickih stanja i njihovih ponasanja i to uz pomoc unutrasnjih monologa, diskusija i snova. Ima elemente i filozofskog romana, jer nosi ideju glavnog junaka objasnjenu u clanku „O zlocinu“. Obuhvata zivot u sirotinjskim cetvrtima, prostituciju, alkoholizam i socijalnu obespravljenost, pa je ovo i socijalni roman.');
  bookList.add(Book()
    ..name = "Ana Karenjina"
    ..writer = "Lav Tolstoj"
    ..bookUrl = "anakarenjina.jpg"
    ..promoted = false
    ..placeYear = "Beograd, 2018."
    ..pageNumber = 890
    ..details =
        'Sve srecne porodice lice jedna na drugu, svaka nesrecna porodica nesrecna je na svoj nacin. Roman koji je Fjodor Dostojevski smatrao besprekornim, a Vilijam Fokner nazvao najboljim romanom koji je ikada napisan, Ana Karenjina je monumentalno delo Lava Tolstoja koji daje sveobuhvatan prikaz ruskog drustva devetnaestog veka, od aristokratskih salona do seoskih gazdinstava. Uvodeci dva narativna toka, prvi koji prati ljubavnu pricu izmedju Ane i Vronskog i drugi koji prati odnos izmedju Kiti i Ljevina, Lav Tolstoj ispisuje svevremene stranice o porodici, gubitku, ljubavi, izdaji, veri i prijateljstvu.');
  bookList.add(Book()
    ..name = "Betmen"
    ..writer = "Bob Kejn"
    ..bookUrl = "batman.png"
    ..promoted = true
    ..placeYear = "Beograd, 2016."
    ..pageNumber = 34
    ..details = 'Napeta saga u kojoj se novi Betmenom protivnik "Bejn" pojavljuje se nastavlja...');
  bookList.add(Book()
    ..name = "Braca Karamazovi"
    ..writer = "Fjodor Dostojevski"
    ..bookUrl = "bracakaramazovi.jpg"
    ..promoted = true
    ..placeYear = "Beograd, 2016."
    ..pageNumber = 1100
    ..details =
        "Roman Braca Karamazovi Fjodora Dostojevskog po misljenju mnogih kriticara i proucavalaca njegovog dela smatra se krunom autorove spisateljske karijere. Prica o porodici Karamazov Dostojevskom je posluzila kao okosnica za izuzetan filozofski roman koji istrazuje hriscansku etiku, slobodnu volju, otudjenost, suparnistvo i moral. Vecita borba dobra i zla svevremeno je otelotvorena u likovima Fjodora Pavlovica i njegovih sinova Mitje, Ivana, Aljose i vanbracnog sina Smerdjakova. Nakon vise od jednog veka od objavljivanja ovog romana, autenticnost i psiholoska rafiniranost njihovih karaktera ne prestaju da nas intrigiraju i fasciniraju. „Porodica Karamazov predocava se kao jedan mikrokosmos, u kojem se reflektuju najvaznije protivrecnosti covekovog bica.“ Maksimilijan Braun");
  bookList.add(Book()
    ..name = "Cica Gorio"
    ..writer = "Onore de Balzak"
    ..bookUrl = "cicagorio.jpg"
    ..promoted = false
    ..placeYear = "Beograd, 2016."
    ..pageNumber = 342
    ..details =
        "Cica Gorio je remek-delo Balzakova stvaralastva i njegov najpoznatiji i najcitaniji roman. Istorija romana pocinje u malogradjanskom pansionu, u kvartu cije su zbijene ulice puste, kuce sumorne, a zidovi podsecaju na tamnicu. Sopstvenica, udovica Voker, ziva je slika tog pansiona u kom se ogleda nevolja. Tu gde vlada beda bez poezije obitava siromasni svet na cijem se dotrajalom odelu ponavlja ocajni unutrasnji izgled ove tuzne i prljave kuce, svet koji je doziveo mnoga zivotna iskusenja i svet koji tek ulazi u zivot. U takvu sredinu upao je mladi student prava Ezen de Rastinjak...");
  bookList.add(Book()
    ..name = "Na Drini cuprija"
    ..writer = "Ivo Andric"
    ..bookUrl = "cuprija.png"
    ..promoted = false
    ..placeYear = "Beograd, 2014."
    ..pageNumber = 334
    ..details =
        'Najpoznatiji roman Ive Andrica, "Na Drini curpija" (1945), hronoloski prati cetiri veka zbivanja oko velikog mosta preko reke Drine u Visegradu, koji je izgradio veliki vezir Mehmed pasa Sokolovic, poreklom iz tih krajeva. ');
  bookList.add(Book()
    ..name = "Divergence"
    ..writer = "S. J. Serih"
    ..bookUrl = "divergence.png"
    ..promoted = false
    ..placeYear = "Beograd, 2013."
    ..pageNumber = 212
    ..details = "The twenty-first book in the beloved Foreigner saga continues the adventures of diplomat Bren Cameron, advisor to the atevi head of state.");
  bookList.add(Book()
    ..name = "Hari Poter i kamen mudrosti"
    ..writer = "J.K. Rouling"
    ..bookUrl = "hariputer.png"
    ..promoted = false
    ..placeYear = "Beograd, 2012."
    ..pageNumber = 354
    ..details =
        'Ostavljen kao beba na pragu kuce u Simsirovoj ulici broj 4, Hari Poter odrasta u ostavi ispod stepenista, kao meta stalnih maltretiranja tetke, tece i njihovog Dadlija. Ali kada sove pocnu da opsedaju njihov dom, noseci na njega adresirana pisma, zivot mu se iz korena menja. Od poludzina Hagrida saznaje za svoje carobnjacko nasledje i magijski svet skriven iza kulisa svakidasnjice, poput perona devet i tri cetvrtine, pocetne stanice carobnog voza koji Harija void do Hogvortsa, skole za vesticarenje i carobnjastvo, srca sveta magije! ');
  bookList.add(Book()
    ..name = "Hari Poter i relikvije smrti"
    ..writer = "J. K. Rouling"
    ..bookUrl = "harrypotter.png"
    ..promoted = false
    ..placeYear = "Beograd, 2011."
    ..pageNumber = 654
    ..details =
        "Hari Poter i relikvije Smrti je konacno razresenje drame, toliko zeljeno cekani odgovor na pitanje ko ce preziveti i ko je konacni pobednik u epskoj borbi dobra i zla. U toj borbi Hari Poter nije ni najmanje usamljen, ali i mracni gospodar Voldemor ima silu jacu nego ikad pre. Dambldor je Hariju poverio kljucni zadatak za opstanak i prevagu dobra, ali je tolike tajne poneo sa sobom, u svet s one strane zivota. Naseg junaka stoga razdiru sumnje i izneverena ocekivanja, koja samo rastu sa priblizavanjem zavrsnog sukoba – rata oko Hogvortsa i svih tajni koje su u njemu pohranjene.");
  bookList.add(Book()
    ..name = "Hobit"
    ..writer = "Dz. R. R. Tolkin"
    ..bookUrl = "hobbit.png"
    ..promoted = false
    ..placeYear = "Beograd, 2017."
    ..pageNumber = 371
    ..details =
        'Hobit je jedan u nizu Tolkinovih romana o Srednjoj zemlji koji je zavrsen 1936. godine, a cije se prvo izdanje pojavilo 1937. godine. Prvobitno je bio napisan kao decja knjiga, koja je sadrzala elemente mitologije iz Silmariliona koji su kasnije iskoristeni da povezu Hobita sa Gospodarom Prstenova. Radnja romana se odigrava u Trecem dobu (po Tolkinovom racunanju vremena), nakon radnje zbirke prica Silmarilion, a pre Gospodara Prstenova i govori o hobitu Bilbu Baginsu i njegovim saputnicima na putovanju do Samotne planine, sukobu sa zmajem Smaugom, i povratku kuci.');
  bookList.add(Book()
    ..name = "Mali princ"
    ..writer = "Sant de Sent Egziperi"
    ..bookUrl = "littleprince.jpg"
    ..promoted = false
    ..placeYear = "Beograd, 2016."
    ..pageNumber = 155
    ..details =
        '...Kazete li im: „Dokaz da je mali princ postojao jeste to sto je bio divan, sto se smejao, sto je zeleo ovcu. Kad covek zeli ovcu, to je dokaz da postoji“, oni ce slegnuti ramenima i smatrace vas detetom! Medjutim, ukoliko im saopstite: „Planeta s koje je dosao mali princ jeste asteroid B612“, bice zadovoljni i nece vam vise dosadjivati pitanjima. Takvi su oni. Ne valja se zato na njih ljutiti. Deca moraju mnogo toga da prastaju odraslima.');
  bookList.add(Book()
    ..name = "Tri musketara"
    ..writer = "Aleksandar Dima"
    ..bookUrl = "musketari.png"
    ..promoted = false
    ..placeYear = "Beograd, 2015."
    ..pageNumber = 450
    ..details =
        'Uvek u potrazi za dobrom avanturom, siromasni plemic D’Artanjan, bez mane i straha, iz provincije stize u Pariz da ostricom maca stekne slavu i bogatstvo. Hrabar, okretan i spreman na sve, ubrzo postaje zapazen, ali zbog svog neobuzdanog karaktera upada u razne nevolje. Kroz neocekivani splet okolnosti, mladi D’Artanjan nailazi na tri elitna ratnika u sluzbi kralja Francuske.');
  bookList.add(Book()
    ..name = "Starac i more"
    ..writer = "Ernest Hemingvej"
    ..bookUrl = "staracimore.jpg"
    ..promoted = false
    ..placeYear = "Beograd, 2020."
    ..pageNumber = 287
    ..details =
        "Knjiga “Starac i more” predstavlja pricu o epskoj borbi izmedju starog prekaljenog ribara i najveceg ulova njegovog zivota. Citavih osamdeset i cetiri dana, Santijago, ostareli kubanski ribar, otisnuo se na more i vratio se praznih saka. Njegov neuspeh u ribarenju je toliko ocit da su roditelji njegovog mladog, posvecenog segrta i prijatelja, Manolina, primorali decaka da napusti starca kako bi ribario na unosnijem brodu.");
  bookList.add(Book()
    ..name = "Teorija svega"
    ..writer = "Stiven Hoking"
    ..bookUrl = "stivenhoking.jpg"
    ..promoted = false
    ..placeYear = "Beograd, 2015."
    ..pageNumber = 654
  ..details = 'Seven lectures by the brilliant theoretical physicist have been compiled into this book to try to explain to the common man, the complex problems of mathematics and the question that has been gripped everyone all for centuries, the theory of existence. Undeniably intelligent, witty and childlike in his explanations, the narrator describes every detail about the beginning of the universe. He describes what a theory that can state the initiation of everything would encompass.'
  );
  bookList.add(Book()
    ..name = "Prasko groblje"
    ..writer = "Umberto Eko"
    ..bookUrl = "umbertoeco.png"
    ..promoted = false
    ..placeYear = "Beograd, 2013."
    ..pageNumber = 462
      ..details = 'Istrazujuci prirodu lazi, neponovljivi Umberto Eko vodi nas u Evropu XIX veka, prepunu misterija i zavera. Jednog jutra, kapetan Simone Simonini budi se sa amnezijom, sve mu je mutno u glavi i ne može da sagleda proslost. Osetivsi neobicno zadovoljstvo dok pusta pero da klizi po hartiji, on pocinje da pise dnevnik, a mi na taj nacin otkrivamo kompleksnu prirodu njegovog identiteta'

  );
  usersBox.put("user", buyer);
  usersBox.put("prod", seller);
  bookList.forEach((element) {
    shelf.put(element.bookUrl, element);
  });
  final relations = Boxes.getUserBookRelations();
  relations.put(
      "user",
      UserBookRelation()
        ..username = "user"
        ..bookUrls = ["umbertoeco.png", "littleprince.jpg"]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
