# Smjernice za daljnji razvoj knjige

Radni brainstorm, 9. lipnja 2026. Nije popis obveza nego karta smjerova u kojima knjiga može rasti nakon što se zatvori postojeći backlog. Pisano nakon potpune revizije rukopisa, s pogledom na to što usporedivi udžbenici pokrivaju, a ova knjiga još ne.

## 1. Pozicioniranje koje već imate, a ne koristite ga izrijekom

Na hrvatskom jeziku ne postoji moderan udžbenik koji spaja javne financije, javni izbor i analizu javnih politika, a pogotovo ne interaktivan i besplatan na webu. Klasični domaći udžbenici pokrivaju javne financije tradicionalno, bez javnoizborne perspektive. To znači da knjiga može opsluživati tri različita kolegija, a ne jedan. Javne financije (DIO I + IV), politička ekonomija ili javni izbor (DIO II + III), analiza i evaluacija javnih politika (DIO V). Vrijedilo bi na landing stranici i u uvodu ponuditi tri eksplicitne staze čitanja s redoslijedom poglavlja za svaki tip kolegija. Trošak je jedna tablica, a širina primjene knjige se utrostručuje.

Druga neiskorištena pozicija je otvorenost. Hypothesis anotacije su već uključene u config. Svaki semestar može postati ciklus recenzije u kojem studenti anotiraju nejasna mjesta, a vi jednom godišnje preradite poglavlja s najviše komentara. Knjiga koja vidljivo raste iz nastave bila bi jedinstvena u regiji.

## 2. Sadržajne rupe koje sada ne vidite jer ih nijedno poglavlje ne najavljuje

Poredano po procijenjenoj vrijednosti za knjigu.

**Fiskalni federalizam i lokalne financije.** Najveća tiha rupa. Musgraveov okvir bez Oatesa i Tiebouta je nepotpun, a knjiga nigdje ne obrađuje višerazinsku državu, decentralizaciju, lokalne proračune ni fiskalno izravnanje. Za Hrvatsku, s 555 jedinica lokalne samouprave i trajnom debatom o županijama, ovo je tema s ogromnim domaćim potencijalom koji koautori mogu usidriti. Prirodno mjesto je novo poglavlje u DIO IV, iza poreza. Oates 1972 i Tiebout 1956 trenutno nisu ni u bibliografiji.

**Socijalno osiguranje, mirovine i zdravstvo.** Uvodno poglavlje najavljuje da DIO IV pokriva dug, mirovine, zdravstvo i lokalne financije, a poglavlja 12 do 14 to ne isporučuju. Tu najavu ionako treba ili ispuniti ili povući (otvoren koautorski upit 00-verify-dio4). Starenje stanovništva je središnji fiskalni problem Hrvatske i savršen poligon za sve alate knjige, od međugeneracijske preraspodjele preko političke ekonomije reformi do vremenske nedosljednosti. Jedno poglavlje o socijalnom osiguranju zatvorilo bi najveći raskorak između obećanog i isporučenog.

**Javni dug kao samostalna tema.** Odnos r minus g sada živi u dvije rečenice i jednoj vježbi u pogl. 13. Održivost duga, struktura ročnosti, tko drži dug, fiskalna pravila EU nakon reforme 2024, eurizacija. Ili proširiti 13 ili spojiti s mirovinskim poglavljem u blok o dugoročnoj održivosti.

**Proces nastanka politika.** Knjiga je jaka na pitanju zašto politike nastaju kakve nastaju (javni izbor), a tanka na pitanju kako konkretno nastaju. Kingdon je već u bibu i citiran, ali agenda setting, policy streams, punktuirana ravnoteža, koalicije zagovaranja i difuzija politika nemaju svoj dom. Politolozi koji bi knjigu mogli usvojiti kao udžbenik to će prvo primijetiti. Opcija je novo poglavlje na početku DIO V ili proširenje pogl. 12.

**Bihevioralna javna politika.** Thaler i Sunstein su citirani, meki paternalizam postoji u pogl. 03, ali nudge jedinice, sludge, bihevioralni neuspjesi samih regulatora i dizajn izbora u poreznoj suradljivosti nisu obrađeni. Ovo je tema koja studente redovito najviše zaintrigira i koja knjigu čini suvremenom. Može kao poglavlje u DIO V ili kao niz umetaka kroz postojeća poglavlja po ENRICHMENT slotovima.

**EU kao druga država.** Hrvatska politika se velikim dijelom donosi u Bruxellesu, a knjiga EU koristi samo kao povremeno sidro primjera. Javni izbor primijenjen na EU institucije (tko je principal Komisiji, zašto regulacija raste, državne potpore, kohezijska uvjetovanost, NPOO kao mehanizam) bio bi intelektualno najoriginalniji dodatak. Mueller i Vaubel literatura postoji. Može kao poglavlje u DIO III iza konstitucionalne ekonomike, čime bi se ujedno popravila činjenica da DIO III sada ima samo dva poglavlja.

**Kapacitet države.** Besley i Persson, state capacity, kvaliteta uprave kao razvojna varijabla. Knjiga to dotiče u 09, 10 i 15, ali pojam nigdje ne stoji na vlastitim nogama. Mali dodatak pogl. 10 s velikim povratom jer povezuje institucionalnu ekonomiku s NPM dijelom.

**Klimatska i energetska politika kao provodni primjer.** Vidi točku 4.

## 3. Značajke koje bi knjigu digle razinu iznad

**Statične zamjene za OJS grafove u PDF-u.** Trenutno strip-ojs.lua jednostavno briše svih 110 grafova iz PDF izdanja, pa tiskana verzija ostaje bez trećine pedagoškog aparata. Generirati statični snapshot svakog grafa (default parametri) i uvjetno ga uključiti samo u PDF profil. Ovo je po mom sudu tehnički najvrjednija pojedinačna investicija, jer PDF čita druga polovica publike.

**webR za vježbe.** Grana experiment/webr-quarto-live već postoji u repou. Izvršne vježbe u pregledniku (student mijenja stopu poreza i odmah računa DWL) pretvorile bi callout-vjezba iz uputa u iskustvo. Budući da 14 poglavlja ionako tek treba dobiti vježbe, isplati se odlučiti hoće li nove vježbe odmah biti webR, da se posao ne radi dvaput.

**Pojmovnik generiran iz definicija.** Kad se formalne definicije prošire na sva poglavlja, automatski izgraditi dvojezični pojmovnik kao appendix (hrvatski pojam, engleski pojam, poglavlje uvođenja). Time se ujedno elegantno rješava napetost oko engleskih glosa u tekstu jer glose mogu otići u pojmovnik.

**Kvizovi za samoprovjeru.** Pet pitanja na kraju poglavlja s trenutnom povratnom informacijom. Quarto ekstenzije za to postoje, a banka pitanja je ujedno prvi korak prema instruktorskim materijalima.

**Materijali za nastavnike.** Slajdovi po poglavlju (revealjs iz istih qmd izvora), mapiranje poglavlja na tipove kolegija, banka ispitnih pitanja u zasebnom privatnom repou. Ovo je obično presudan faktor hoće li drugi nastavnici usvojiti udžbenik.

**Hrvatska u brojkama.** Podaci u data/atlas (COFOG, rashodi, prihodi, porezi kao postotak BDP-a) su skinuti i neiskorišteni. Stalna rubrika od jednog grafa po praktičnom poglavlju, s RH naspram EU prosjeka, koju Milan jednom godišnje osvježi. Daje knjizi živi domaći puls bez kršenja pravila da hrvatske empirije pišu koautori.

**Vremenska crta hrvatskih javnih politika.** Interaktivna kronologija 1990. do danas na landing stranici (stabilizacijski program 1993, mirovinska reforma 2002, ulazak u EU 2013, euro 2023, NPOO). Svaka točka linka na poglavlje koje ju objašnjava. Efektno, jeftino, izrazito dijeljivo.

## 4. Provodni slučaj kroz knjigu

Knjizi nedostaje narativna nit koja se vraća. Razmislite o jednom velikom slučaju koji se otvori u uvodu i zatim ponovno pojavi na kraju svakog dijela, svaki put kroz leću tog dijela. Dva kandidata.

Prvi je uvođenje eura. Stabilizacijska funkcija (DIO I), političko-ekonomska dinamika odluke (DIO II), pravila i vjerodostojnost (DIO III), instrumenti i fiskalni učinci (DIO IV), reforma kao proces s vanjskim sidrom (DIO V). Milan je za ovo idealan autor i dio tvrdnji već postoji u pogl. 19.

Drugi je klimatska i energetska politika. Eksternalije i Pigou (DIO I), lobiranje i zarobljavanje (DIO II), EU pravila (DIO III), izbor instrumenata između poreza, ETS-a i standarda (DIO IV), evaluacija i pravedna tranzicija (DIO V). Prednost joj je što je međunarodna pa je možete pisati sami, bez čekanja koautora.

Pet kratkih sekcija od po stranicu i pol daje knjizi ono što arc kritičar traži, kumulativni osjećaj, a studentima pokazuje da isti problem izgleda drukčije iz svake perspektive.

## 5. Preslagivanja koja vrijedi razmotriti

DIO III s dva poglavlja je strukturno najtanji dio. Tri opcije. Dodati mu EU poglavlje (točka 2), dodati mu kapacitet države, ili ga spojiti s DIO II u jedan dio o pravilima i akterima. Bilo koja od prve dvije je bolja od trenutnog stanja.

Pogl. 14 o porezima je osam puta veće od najtanjeg poglavlja i nosi trećinu svih grafova. Kad Milanova ovjera stopa stigne, razmislite o podjeli na teoriju oporezivanja i porezni sustav u praksi. Alternativno, sekcija o AI i porezima (Korinek) prirodno pripada budućem epilogu jer je jedina otvoreno spekulativna.

Epilog koji zatvara luk već je predložen u revizijskom izvještaju. Ovdje dodajem konkretan oblik. Operativni protokol dizajna politike u deset koraka koji redom poziva svako poglavlje knjige, napisan kao alat koji student nosi sa sobom. Time uvodna obećanja (kakva država, za koje probleme, s kojim instrumentima) dobivaju mjerljiv odgovor na zadnjoj stranici, a knjiga dobiva ono što je sada nema, završetak koji se pamti.

Redoslijed unutar DIO IV sada ide instrumenti, potrošnja, porezi. Logika prihodi pa rashodi sugerirala bi poreze prije potrošnje. Nije nužno, ali ako se dodaju lokalne financije i socijalno osiguranje, prirodan slijed postaje instrumenti, porezi, potrošnja, socijalno osiguranje, lokalne financije, dug.

## 6. Što ne bih radio

Ne bih dodavao nijedan novi smjer prije nego što se zatvori postojećih 59 vlastitih stavki i restrukturira pogl. 05, jer svaka nova fronta povećava trošak tog zahvata. Ne bih išao u puni policy process udžbenik jer bi razvodnio javnoizbornu jezgru koja knjigu čini posebnom. Ne bih prevodio knjigu na engleski u ovoj fazi jer na engleskom konkurencija postoji, a na hrvatskom ne. I ne bih dirao petodijelnu okosnicu, ona je dobra, sve gore navedeno su nadogradnje na nju, ne njezina zamjena.

## Sažetak u jednoj rečenici

Knjiga je već sada najbolji rukopis svoje vrste na hrvatskom, a sljedeća razina leži u četiri poteza. Zatvoriti raskorak između najavljenog i isporučenog u DIO IV (socijalno osiguranje, lokalne financije, dug), dodati EU i bihevioralnu perspektivu, provući jedan veliki slučaj kroz svih pet dijelova i isporučiti PDF čitateljima grafove koje web čitatelji već imaju.
