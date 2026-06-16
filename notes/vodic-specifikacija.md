# Specifikacija vodiča

Radni dokument za koautore. Definira kako se sadržaj knjige preslikava u vodič, kako vodič izgleda, kako se tehnički gradi i kojim redom nastaje. Vodič je vizualna slikovnica knjige. Svako poglavlje dobiva jednu stranicu koja funkcionira kao mentalna mapa, a na početku stoji pregled svih poglavlja.

## 1. Što je vodič, a što nije

Vodič je samostalan proizvod za širu javnost. Čitatelj koji nikad neće otvoriti knjigu treba iz vodiča razumjeti glavne ideje svakog poglavlja za dvije minute po stranici. Studentima služi kao ponavljanje prije ispita, ali to je sekundarna namjena i ne smije oblikovati ton.

Vodič nije sažetak teksta, nije skripta, nije popis definicija i formula.

Tri pravila iznad svih ostalih.

1. Slika prije teksta. Ako se ideja može pokazati prostornim rasporedom, ikonom ili brojkom, ne piše se rečenica.
2. Nijedna tvrdnja koje nema u knjizi. Svaki element vodiča mora biti sljediv do konkretne sekcije poglavlja i na nju linkati.
3. Nula neprevedenog žargona. Stručni pojam smije postojati samo ako je u istom dahu objašnjen svakodnevnim jezikom.

## 2. Arhitektura

Hub stranica plus 19 podstranica, imena zrcale chapters/.

```
vodic.qmd                       hub, pregled svih poglavlja
vodic/01-uloga-drzave.qmd
...
vodic/19-reforme.qmd
```

Hub koristi puni format stranice (page-layout: full). Pet dijelova knjige prikazano je kao pet vizualnih blokova s ukupno 19 kartica. Svaka kartica nosi broj, naslov i središnje pitanje poglavlja te vodi na podstranicu. Kartica vodiča na naslovnici već ima gumb Otvori vodič.

Navigacija. Quarto page-navigation daje listanje redom, a svaka podstranica ima link natrag na hub, indikator napretka (Mapa 7 od 19) te vlastite linkove na prethodnu i sljedeću mapu.

## 3. Anatomija podstranice

Identičan raspored na svim stranicama. Redoslijed zona odozgo prema dolje.

**Folio, gore lijevo.** Dio knjige, broj i naslov poglavlja, na primjer Dio II · Poglavlje 7 · Stranke i izbori. Uz folio procjena čitanja (2 min) i napredak. Monospace, mala veličina, boja dijela knjige.

**Središnje pitanje.** Jedno pitanje iz svakodnevice, ne pojam. Newsreader, najveći element na stranici, ujedno središnji čvor mape. Najviše 12 riječi.

**Mentalna mapa.** Kralježnica izlazi iz pitanja, 4 do 6 grana lijevo i desno. Svaka grana ima naslov do 6 riječi, ikonu i mikroobjašnjenje do 18 riječi te linka na odgovarajuću sekciju poglavlja. Na mobitelu okomiti popis s uvučenim granama.

**Pojas kartica.** Tri kartice u redu, na mobitelu jedna ispod druge.

| Kartica | Sadržaj | Izvor u knjizi | Limit |
|---|---|---|---|
| Politika u praksi | jedan stvaran slučaj, domaći gdje postoji | callout-praksa | 40 riječi |
| Jedna brojka | upečatljiv podatak, velika znamenka | callout-empirija | 25 riječi |
| Mit i stvarnost | uvjerenje iz javne rasprave nasuprot nalazu poglavlja | autori, utemeljeno u tekstu | 40 riječi |

**Pojam za razgovor.** Jedan pojam iz poglavlja objašnjen jednom rečenicom.

**Kamo dalje.** Prethodna mapa, otvaranje poglavlja u knjizi, sljedeća mapa.

Proračun riječi za cijelu stranicu bez folija i navigacije iznosi najviše 200 riječi. Pojedinačni limiti su stropovi, a ukupni proračun ima prednost.

## 4. Pravila mapiranja iz poglavlja

Knjiga u svakom poglavlju već ima sekcije *Vodič kroz poglavlje* i *Sažetak* te callout-praksa i callout-empirija, pa je mapiranje izravno.

| Element knjige | Element vodiča | Pravilo transformacije |
|---|---|---|
| naslov poglavlja | folio | skraćeno |
| Vodič kroz poglavlje i Sažetak | središnje pitanje i mikroobjašnjenja | preformulirati u jezik građanina, jedna tvrdnja po grani |
| H2 sekcije | grane mape | spojiti srodne dok ih ne ostane najviše 6 |
| callout-praksa | kartica Politika u praksi | zadržati slučaj, izbaciti kontekst, ostaviti poantu |
| callout-empirija | kartica Jedna brojka | izdvojiti jednu znamenku |
| def okruženja i ključni pojmovi | pojam za razgovor | prevesti u svakodnevni jezik |
| callout-vjezba, formule, citati | izostavljaju se | studentski i citatni aparat nije za javnost |

Pravila kompresije. Jedna ideja, jedna rečenica. Konkretne brojke umjesto priloga. Pitanja kao naslovi gdje god mogu. Niti jedna rečenica dulja od 20 riječi.

## 5. Sadržajni plan svih 19 stranica

| Pogl. | Središnje pitanje | Grane mape |
|---|---|---|
| 1 | Zašto tržištu uopće treba država? | tržište i njegove granice; Musgraveov okvir; Paretovo mjerilo; dva teorema blagostanja; koliko je ideal blizu |
| 2 | Zašto tržište samo ne rješava sve? | javna dobra i švercer; eksternalije; asimetrične informacije; monopolska moć; zajednički resursi; meritorna dobra |
| 3 | Što je uopće pravedna raspodjela? | učinkovito a neprihvatljivo; utilitarizam; Rawlsova zavjesa; paternalizam i granice; cijena preraspodjele |
| 4 | Tko pegla krize? | zašto se gospodarstvo trese; fiskalni multiplikator; automatski stabilizatori; diskrecija i zamke; stabilnost kao javno dobro |
| 5 | Što vidimo kad političare gledamo kao obične ljude? | politika bez romantike; paradoks glasanja; glas kao poruka; tržište politika; predvidljivo neintuitivno |
| 6 | Može li skupina uopće imati dosljednu volju? | vrtnja većina u krug; Arrowljev rezultat; iznimka koja smiruje; moć dnevnog reda; posljedice za politike |
| 7 | Zašto pred izbore sve stranke zvuče slično? | vlak prema centru; odakle polarizacija; racionalna neinformiranost; cijena brzih odluka; zašto je to važno |
| 8 | Kako mali često pobijede velike? | logika kolektivnog djelovanja; glasna manjina i tiha većina; lov na rentu; regulatorno zarobljavanje; nisu nužno štetne |
| 9 | Je li birokrat sluga ili igrač? | Weberov stroj; pogled javnog izbora; tko što zna; birokracija u mreži; bolja a ne manja |
| 10 | Zašto ista politika negdje uspije, a negdje propadne? | pravila igre; skriveni troškovi razmjene; nalogodavac i agent; institucije i razvoj; pisana i nepisana pravila |
| 11 | Tko čuva čuvare? | dvije razine igre; obećanja kroz vrijeme; proračun po kalendaru; pravila grade povjerenje; ekonomika dobrih pravila |
| 12 | Koje alate država ima u rukama? | od cilja do alata; novac kao poluga; pravila i standardi; država kao proizvođač; gurkanje umjesto prisile; pravi miks |
| 13 | Kamo ide svaki drugi euro koji zaradimo? | stoljeće rasta; korist i rizik; pegla ciklusa; svjetske razlike; Hrvatska u EU |
| 14 | Zašto porezi izgledaju baš ovako? | vrste na jednoj slici; načela dobrog poreza; tko stvarno snosi teret; optimalan porez; Hrvatska u EU kontekstu; porezi u doba AI |
| 15 | Zašto i država zna zakazati? | što je neuspjeh države; država ne zna sve; poticaji iskrivljuju; provedba iznevjeri; test prije intervencije; bolja ne veća ni manja |
| 16 | Može li država raditi kao firma? | odakle NJM; marketizacija; agencifikacija; građanin kao korisnik; dosezi i granice |
| 17 | Tko sve danas kroji javne politike? | tvrdokorni problemi; povezana vlada; mreže i partnerstva; glas građana; tri logike u ravnoteži |
| 18 | Kako izmjeriti isplati li se neka politika? | logika troškova i koristi; cijena necjenjivog; granice računa; mjerenje stvarnog učinka; nakon provedbe |
| 19 | Zašto reforme svi žele dok ne počnu? | zašto su nužne; gubitnici viču, dobitnici šute; pouke istočne Europe; ključevi uspjeha; pogled kroz cijelu knjigu |

Pitanja i grane su provedena verzija, otvorena za doradu koautora.

## 6. Vizualni sustav

Sve iz postojećeg brand sustava (Statecraft tokeni u styles/custom.scss), bez novih boja i fontova. Newsreader za pitanja i naslove grana, Public Sans za mikrotekst, IBM Plex Mono za folio i brojke.

Pet dijelova knjige dijeli tri pigmenta palete, bez ponavljanja susjednih dijelova. Dio I verdigris, Dio II ochre, Dio III oxblood, Dio IV verdigris, Dio V ochre. Akcent nosi folio, kralježnicu mape, rubove kartica i hub.

Ikone grana su linijske SVG ikone ujednačenog stila, inline uz stroke preko currentColor. Mapa se gradi HTML om i CSS om, bez JavaScripta i vanjskih biblioteka. Dark mode preko blokova u styles/_dark.scss, ispis svake stranice stane na A4.

Svi stilovi žive u styles/_vodic.scss s prefiksom klasa vd, uključeno u custom.scss.

## 7. Tehnička izvedba

Podstranice su čisti qmd s HTML blokovima, bez R koda, pa ne diraju freeze. Podstranice su upisane u appendices u _quarto.yml iza vodic.qmd. Stranice vodiča skrivaju sidebar preko body klase vd-page definirane u _vodic.scss.

## 8. QA kontrolna lista

1. Ukupno najviše 200 riječi, pitanje do 12, naslov grane do 6, mikroobjašnjenje do 18 riječi.
2. Svaka tvrdnja postoji u poglavlju i linka na svoju sekciju.
3. Laički test. Osoba izvan struke prepriča mapu nakon dvije minute bez otvaranja knjige.
4. Mobilni prikaz na 360 px, dark mode, ispis na A4.
5. Pristupačnost. Dekorativne ikone nose aria-hidden, fokus tipkovnice vidljiv, kontrast prolazi u obje teme.
6. Svi linkovi valjani, listanje radi, folio i napredak točni.
7. Niti jedan stručni pojam bez prijevoda u svakodnevni jezik.

## Napomena uz provedbu

Kartica primjera zove se *Politika u praksi*, po istoimenom calloutu u knjizi, jer primjeri u poglavljima nisu uvijek hrvatski. Gdje hrvatski primjer postoji (stranke, porezi, interesne skupine), kartica ga koristi. Mape su izgrađene iz sekcija *Vodič kroz poglavlje*, *Sažetak* te praksa i empirija calloutova svakog poglavlja, a sva sidra provjerena su prema renderiranom HTML u u docs/.
