# Izvještaj: sweep kontrola (osnova za jedan krug korekcija)

**Datum:** 2026-06-12
**Opseg:** svih 21 aktivnih poglavlja iz `_quarto.yml` (00–20)
**Metoda:** kvantitativni analizator (`tmp/sweep_controls.py`) nad strukturom svakog `.qmd` + četiri paralelna čitateljska prolaza za prosudbene kontrole
**Status:** samo dijagnostika — nijedan tekst nije mijenjan. Ovo je osnova za sljedeći krug korekcija.

---

## Kako čitati izvještaj

Tvojih jedanaest primjedbi pretočeno je u jedanaest **kontrola** (C1–C11). Za svaku: što se mjerilo, koliko je nalaza, gdje su koncentrirani, i preporuka. Na kraju je **karta prioriteta** i **predložene odluke** koje trebaš potvrditi prije korekcija.

Brojevi su provjereni dvostruko (skripta + čitanje). Gdje se metode ne slažu, navedeno je.

---

## Sažetak — što je stvarno problem

Dvije stvari dominiraju i nose najveći dio tvog dojma o knjizi:

1. **Poglavlje 15 (EU javne financije) je teški iznimak po duljini odlomaka.** Prosjek 111 riječi/odlomak naspram knjižnog mediana ~69; devet odlomaka preko 160 riječi, najdulji 247. Ostatak knjige je znatno zbijeniji. Ovo je izravna potvrda tvoje slutnje da „veličina i tok odlomaka nisu jedinstveni kroz knjigu".
2. **Poglavlje 14 (Porezi) je strukturno preopterećeno.** Dva golema bloka (~544 i ~659 redaka) stoje pod jednim jedinim `##` naslovom, bez ijednog `###` pod-naslova. To je glavni izvor tvog osjećaja „gdje je tekst predug, slobodno uvedi naslove".

Sve ostalo (hladni krajevi, slaganje callouta, jednorečenični odlomci, tablice) raspršeno je u manjim, popravljivim količinama, s jasnim žarištima u **DIO I (poglavlja 1–4)** — točno gdje si i sam primijetio probleme (Musgrave, javna dobra, Edgeworth, klizači).

Knjiga **nije** ravnomjerno problematična. Žarišta su uska. To je dobra vijest za jedan ciljani krug korekcija.

---

## Knjižna statistika odlomaka (kontrola C3)

| Mjera | Vrijednost |
|---|---|
| Ukupno odlomaka | 894 |
| Prosjek | 72,8 riječi |
| Medijan | 69 riječi |
| p25 / p75 | 53 / 90 |
| p90 | 112 |
| Maksimum | 247 (pogl. 15) |

**Tumačenje:** zdrava sredina knjige je 53–90 riječi po odlomku. To je dobar, ujednačen ritam. Problem nije sredina nego **repovi** — i jedan rep (predugi odlomci) gotovo je u cijelosti poglavlje 15.

### Po poglavljima (samo iznimci istaknuti)

| Poglavlje | n | prosjek | medijan | p90 | maks | kratki <25w | dugi >160w |
|---|---|---|---|---|---|---|---|
| **15-eu-javne-financije** | 58 | **111,6** | **108,5** | **184** | **247** | 3 | **9** |
| 10-institucionalna | 38 | 80,5 | 81,5 | 112 | 126 | 0 | 0 |
| 00-uvod | 22 | 88,4 | 87,5 | 119 | 127 | 0 | 0 |
| *ostatak knjige* | — | 61–73 | 56–72 | 86–119 | 96–168 | 0–7 | 0 |

Samo poglavlje 15 izlazi iz sustava. Poglavlja 10 i 00 su blago iznad prosjeka ali unutar razumnog (uvod i teorijsko poglavlje prirodno nose gušći odlomak). **Akcija je potrebna samo za 15.**

---

## C1 — Tanka pod-poglavlja (Musgrave-tip)

**Što se mjerilo:** `##` sekcije s <120 riječi proze, `###` s <80.

**Nalazi (5 tvrdih + nekoliko mekih iz čitanja):**

| Poglavlje | Redak | Razina | Riječi | Naslov |
|---|---|---|---|---|
| 14-porezi | 49 | ## | 50 | Vrste poreza (uvodni dio prije pod-naslova) |
| 14-porezi | 79 | ### | 64 | Specifični i ad valorem porezi |
| 14-porezi | 1348 | ## | 0 | Porezni sustavi u EU i Hrvatskoj (prazan most-naslov) |
| 12-instrumenti | 92 | ## | 119 | Informacijski instrumenti |
| 16-neuspjesi | 144 | ## | 110 | Kako neuspjehe ugraditi u dizajn |

**Meki nalazi iz čitanja** (ispod praga ali „tanki po dojmu"):
- pogl. 1 — Kaldor-Hicks dio (unutar „Pareto učinkovitost"), vrlo zbijen za pojam koji nosi cijelu CBA kasnije
- pogl. 12 — „Bihevioralni i nudge instrumenti" (~6 rečenica, jedan primjer), „Subvencije"
- pogl. 16 — „Birokratski neuspjesi" (~95 riječi), „Neuspjesi i povjerenje" (~100 riječi)

**O Musgraveu konkretno:** Musgrave se spominje u 8 poglavlja, ali nema zasebnog tankog *pod-poglavlja* posvećenog njegovim trima funkcijama — okvir je raspoređen po poglavljima 1 i 15. Tvoj dojam „premalo teksta o Musgraveu" najvjerojatnije se odnosi na **uvodno mjesto u pogl. 1** (sekcija „Musgraveov okvir", redak 31), koje čitatelj prepoznaje kao mjesto gdje bi okvir trebao biti razrađen, a tek je naznačen. To treba potvrditi (vidi Odluke).

**Preporuka:** tanke sekcije ne rješavati mehanički „dodavanjem teksta". Tri opcije po sekciji: (a) razraditi mehanizmom/primjerom, (b) spojiti s susjednom sekcijom, (c) spustiti s `##` na `###` ako je doista pod-tema. Za svaku tanku sekciju u krugu korekcija odabrati jedno.

---

## C2 — Naslov-pa-tekst otvaranja (nedostaje most)

**Što tražiš:** poglavlje (i veća `##` sekcija) treba otvoriti **kratkim neimenovanim mostom** — proza koja postavlja pozornicu i najavljuje što slijedi i kojim redom — *prije* prvog pod-naslova. `.vodic-panel` na vrhu je sadržaj (TOC), **ne** most.

**Nalaz na razini poglavlja:** 6 poglavlja skripta označava kao „malo proze prije prvog `##`". Ali čitanje pokazuje da **većina tih poglavlja zapravo ima dobar most** — skripta ih lažno hvata jer broji riječi do prvog `##`, a most je kratak. Stvarno stanje:

- **Uzorni mostovi (ne dirati):** pogl. 00 (uvod — ocijenjen „iznimnim"), 16, 17, 18, 19, 20, 02, 05. Ova poglavlja rade točno ono što želiš.
- **Slabiji / vrijedni jačanja:** pogl. 10 i 11 otvaraju se odmah u gustu materiju nakon `.vodic-panel`; pogl. 13 most postoji ali je kratak (4 retka).

**Nalaz na razini sekcije** (važniji): mnoge `##` sekcije **skaču ravno u sadržaj ili u definiciju** bez uvodne rečenice. Najgore u:
- **pogl. 03** — šest normativnih okvira (Utilitarizam → Rawls → Robni egalitarizam → Paternalizam → Efikasnost) niže se kao niz mini-predavanja, svaka sekcija počinje definicijom bez mosta. Ovo je najjači C2/C5 nalaz u knjizi.
- **pogl. 04** — osam sekcija bez uvodne rečenice.
- **pogl. 14** — nedostaju unutarnji mostovi na velikim prijelazima (teorija → praksa, svjetski sustavi → AI).

**Preporuka:** uvesti jednorečenične do dvorečenične mostove (i) ispred prvog `##` ondje gdje ga nema (pogl. 10, 11), (ii) ispred „suhih" `##` sekcija u pogl. 03, 04, 14. Ovo se dobro spaja s C5 (luk) — isti potez rješava oboje.

---

## C3 — Ujednačenost duljine/toka odlomaka

Vidi tablice gore. **Zaključak: knjiga je ujednačena osim poglavlja 15.** Mediani po poglavljima leže u uskom pojasu 56–88 riječi. Poglavlje 15 je jedini iznimak i nosi cijeli „predugi" rep.

**Devet predugih odlomaka u pogl. 15** (s prirodnim mjestima reza koje je čitanje identificiralo):

| Redak | Riječi | Sekcija | Rez |
|---|---|---|---|
| 60–67 | ~340 | Problem fiskalne unije | u tri dijela (elementi 1-2 / 3 / 4-6) |
| 36 | 247 | Što je drukčije | nakon postavke asimetrije, prije posljedica |
| 26 | 220 | uvodni most | nakon tri instrumenta, prije Musgravea |
| 56 | 205 | Problem fiskalne unije | problem / teorija (Mundell-Kenen) |
| 40 | ~195 | Problem fiskalne unije | prije „Treća posebnost" |
| 38 | ~192 | Problem fiskalne unije | posljedice / teorija |
| 42 | ~180 | Što je drukčije | problem / primjeri (PDV) |
| 44 | ~165 | Što je drukčije | granično — može ostati |
| 28 | 162 | Javne financije u nacionalnoj državi | nakon Musgrave citata |

**Preporuka:** podijeliti svaki na logičkoj granici (ne sjeći nasred misli). Sadržaj ostaje, ritam se vraća u knjižni prosjek. Ovo je jedan od dva najveća pojedinačna posla.

---

## C4 / C8 — Slaganje definicija i callouta

**Što se mjerilo:** dva callout-tipa bloka (callout-praksa/empirija/vjezba, ili `#def-`/`#thm-`/`#prp-`) razdvojena s <40 riječi proze.

**Nalazi (5 tvrdih):** najjače u pogl. 02 (javna dobra: `def-javno-dobro` → `callout-praksa` sa samo ~15 riječi između), zatim pogl. 07, 13, 14, 19 (po jedan). Čitanje potvrđuje pogl. 02 kao glavni primjer, i posebno **„javna dobra" blok** koji slaže: definicija → kratka proza → `callout-praksa` → graf → „Što isprobati" → nova sekcija, sve bez prozne pauze.

**Dobra vijest:** poglavlja 16–20 i 10–11 nemaju problem slaganja — razmaci su zdravi. Slaganje je, kao i ostalo, žarišno u DIO I.

**Preporuka:** umetnuti 1–2 rečenice proze između susjednih blokova u označenim mjestima; gdje to nije moguće, razmaknuti blokove tako da barem jedan prozni odlomak nosi prijelaz. Ciljati pogl. 02 prvo.

---

## C5 — Luk od pod-poglavlja do pod-poglavlja

**Što tražiš:** prirodan tok između sekcija; ne hladan skok. Loš primjer koji si naveo (Edgeworth) potvrđen.

**Najjači prekidi luka:**
- **pogl. 01** — ulaz/izlaz iz „Edgeworthova kutija" (redak 73): sekcija prije završava definicijom i skače u mehaniku kutije bez rečenice koja kaže *zašto* taj dijagram ilustrira Pareto; kutija završava na „Što isprobati" i skače u „Teoremi blagostanja". Točno tvoj navedeni slučaj.
- **pogl. 03** — šest okvira bez veziva (vidi C2). Cijelo poglavlje čita se kao niz nepovezanih mini-predavanja.
- **pogl. 04** — automatski → diskrecijski stabilizatori, velike krize — bez prijelaznih rečenica.
- **pogl. 14** — golemi teorijski blok pada u taksonomiju realnih sustava bez mosta.

**Preporuka:** isti potez kao C2 — mostovi i, jednako važno, **rezolucije** (C9) na krajevima sekcija. Most otvara, rezolucija zatvara; zajedno čine luk.

---

## C6 — Callouti s klizačima (prijedlog alternative)

**Stanje na terenu:** ~90 instanci `viewof … Inputs.range` kroz 12 poglavlja, koncentrirano u pogl. 14 (28), 02 (24), 01 (6). Klizači su **već stilizirani** (`styles/custom.scss` 1788–1973) u uokvirenu ploču „Parametri simulacije" u glavnom stupcu (`max-width: min(640px,100%)`) — **ne** bježe u margine.

**Dakle tvoja primjedba nije o marginama nego o estetici/toku:** ploča s klizačima, ponovljena ~90 puta, prekida čitanje i „ne izgleda dobro". Slažem se da je to dizajnerska odluka koju treba odlučiti, ne mehanički popraviti. Predlažem tri smjera (treba odabrati):

| Opcija | Što je | Za | Protiv |
|---|---|---|---|
| **A — Sklopiva ploča (preporuka)** | Klizači idu u `<details>` „Parametri simulacije" zatvoren po defaultu; graf se prikazuje s razumnim početnim vrijednostima, čitatelj otvara ploču samo ako želi mijenjati | Uklanja vizualni šum, čuva interaktivnost, minimalna izmjena (omotač + početna vrijednost) | Interaktivnost je „skrivena" jedan klik dublje |
| **B — Statična slika + „isprobaj uživo" link** | Glavni tok nosi statični graf (PNG/SVG s preporučenim vrijednostima); interaktivna verzija živi na zasebnoj „Alat" stranici, povezana iz teksta | Najčišći tok, najbrže učitavanje, tisak-spreman | Gubi se inline interaktivnost; više održavanja (dvije verzije) |
| **C — Kompaktna traka ispod grafa** | Klizači se stišću u jednu nisku, tihu traku *ispod* grafa (ne ploču iznad), bez okvira i natpisa | Mali zahvat, zadržava inline | I dalje vizualno prisutno; ne rješava „ponavljanje 90×" |

**Moja preporuka: opcija A** za cijelu knjigu (jedan SCSS/HTML potez pokriva svih 90 instanci), uz iznimku da 2–3 najvažnija grafa po poglavlju ostanu otvorena. Treba tvoju odluku prije izvedbe.

---

## C7 — Predugi blokovi teksta (uvesti naslove)

Dvostruko: (a) predugi *odlomci* = poglavlje 15 (vidi C3); (b) predugi *blokovi pod jednim naslovom* = poglavlje 14.

**Poglavlje 14 — dva monolitna bloka bez `###`:**
- redci ~106–650 („Osnove teorije oporezivanja"): ~544 retka, četiri teorijska okvira + četiri grafa, nula pod-naslova. Predloženi rezovi: `### Teorija koristi`, `### Teorija sposobnosti plaćanja`, `### Porezna incidencija`, `### Mrtvi teret`, `### Porezni klin`.
- redci ~651–1310 („Teorija optimalnog oporezivanja"): ~659 redaka. Predloženi rezovi: `### Ramseyevo pravilo`, `### Mirrleesov model`, `### Atkinson–Stiglitz`, `### Progresivno oporezivanje`, `### Lafferova krivulja`.

**Preporuka:** uvesti pod-naslove. Ovo je najveći strukturni zahvat u knjizi i drastično poboljšava skenabilnost pogl. 14. Naslovi su prirodni (sadržaj ih već nudi), pa je rizik nizak.

---

## C9 — Hladni krajevi sekcija

**Što se mjerilo:** sekcija završava na mehanici grafa („Graf koji slijedi…", „Što isprobati."), na kod-bloku/OJS, umjesto na proznoj rezoluciji.

**Nalazi (6 tvrdih iz skripte + dodatni iz čitanja):**

| Poglavlje | Sekcija (redak) | Završava na |
|---|---|---|
| 01 | Edgeworthova kutija (73) | „Što isprobati" |
| 02 | Javna dobra (28) | „Što isprobati" |
| 02 | Eksternalije (221) | „Što isprobati" |
| 02 | Asimetrične informacije (519) | mehanika grafa |
| 03 | Efikasnost i pravednost (112) | graf / „Što isprobati" |
| 13 | Javna potrošnja kroz povijest (19) | bez rezolucije |

Čitanje dodaje pogl. 04 (Fiskalni multiplikator), 05 (Birači i paradoks glasanja), 06 (Condorcetov paradoks), 09 (Niskanen) — sve završavaju na „Što isprobati"/vježbi. **Točno tvoj navedeni loš primjer** („završetak na opisu što možeš s grafom, OJS").

**Važna nijansa:** poglavlja 16–20 koriste isti „Što isprobati" obrazac, ali ondje on **ne** zatvara sekciju nego mu slijedi prozni odlomak — to je dobar obrazac koji treba prenijeti unatrag na DIO I.

**Preporuka:** nakon svakog „Što isprobati" bloka koji trenutno zatvara sekciju, dodati kratku **rezoluciju** (1–3 rečenice): što graf pokazuje kao pouku i kako to vodi u sljedeću sekciju. Ne opis grafa — *zaključak* iz njega.

---

## C10 — Jednorečenični odlomci

**Što se mjerilo:** odlomci s jednom rečenicom (≥6 riječi, isključujući prikaznu matematiku, slike, fusnote).

**Ukupno: 26.** Žarišta:

| Poglavlje | Broj | Napomena |
|---|---|---|
| 14-porezi | 8 | uglavnom prijelazne rečenice koje uvode pod-temu — mnoge će nestati uvođenjem `###` naslova (C7) |
| 07-stranke-izbori | 4 | jedna je prikazna jednadžba (lažni pozitiv) |
| 02, 05, 06, 08, 16 | 1–3 svaki | prave prijelazne rečenice |

**Preporuka:** spojiti svaku s prethodnim ili sljedećim odlomkom, ILI proširiti u dvije rečenice. Dio njih (pogl. 14) riješit će se sam kad ti retci postanu uvodi pod-sekcija. Niska težina, mehanički posao.

---

## C11 — Tablice bježe iz margina

**Što se mjerilo:** pipe-tablice šire od 90 znakova po retku ili s >5 stupaca.

**Nalazi (10), rangirano po riziku:**

| Poglavlje | Redak | Stupci | Maks širina retka | Rizik |
|---|---|---|---|---|
| **05-javni-izbor** | 161 | **5** | 226 zn. | **visok** (5 stupaca, duge prozne ćelije) |
| **15-eu** | 114 | 3 | 199 zn. | visok (duge ćelije) |
| 14-porezi | 1338 | 3 | 190 zn. | visok |
| 07-stranke-izbori | 75 | 4 | 165 zn. | srednji |
| 15-eu | 176 | 3 | 152 zn. | srednji |
| 06-kolektivni | 137 | **6** | 150 zn. | srednji (6 stupaca, kratke ćelije) |
| 15-eu | 144 | 3 | 142 zn. | srednji |
| 14-porezi | 1426 | 3 | 130 zn. | nizak-srednji |
| 06-kolektivni | 164, 226 | 3 | 101–110 zn. | nizak |

**Glavni krivac:** tablica u pogl. 05 (redak 161) — 5 stupaca s proznim ćelijama, uz `reference-location: margin` koji jede vodoravni prostor. Ona stvarno prelazi rub.

**Preporuka (mehanička, sigurna):**
1. Za 5–6-stupčane tablice s proznim ćelijama (pogl. 05 r161, pogl. 06 r137): dati im punu širinu izvan margina-stupca preko `{.column-page}` ili `{.column-screen-inset}`, ili reducirati stupce.
2. Za 3-stupčane široke tablice (pogl. 15, 14): dodati CSS za kontrolirano prelamanje ćelija (`word-break`/`overflow-wrap`) ili stisnuti tekst ćelija.
3. Jedan SCSS blok za `.table-responsive` može pokriti većinu slučajeva odjednom.

---

## Karta prioriteta za krug korekcija

Rangirano po (utjecaj × žarišnost), od najvećeg:

**Razred A — veliki, lokalizirani, visok učinak**
1. **C7 — pogl. 14:** uvesti `###` pod-naslove u dva monolitna bloka. (najveći strukturni dobitak)
2. **C3 — pogl. 15:** podijeliti 9 predugih odlomaka. (vraća ritam knjige)

**Razred B — žarišno u DIO I (1–4), srednji učinak, srodni potezi**
3. **C9 — hladni krajevi:** rezolucije nakon „Što isprobati" u pogl. 01, 02, 03, 04, 05, 06, 09.
4. **C5 + C2 — luk i mostovi:** uvodne + zaključne rečenice, najjače u pogl. 03 (šest okvira), 04, 01 (Edgeworth).
5. **C4/C8 — slaganje:** prozne pauze u pogl. 02 (javna dobra prvo).

**Razred C — mehanički, niska težina, raspršeno**
6. **C11 — tablice:** SCSS + `.column-page` za pogl. 05 (r161) i ostale široke.
7. **C10 — jednorečenični odlomci:** 26 spajanja (dio nestaje s C7).
8. **C1 — tanke sekcije:** odluka razradi/spoji/spusti za 5+ sekcija.

**Razred D — dizajnerska odluka (čeka tebe)**
9. **C6 — klizači:** odabrati opciju A/B/C prije izvedbe.

**Ne dirati (rade dobro):** uvod (00), poglavlja 16–20 (osim 2 tanke sekcije u 16), mostovi u 17–20, razmaci callouta u 10–11 i 16–20.

---

## Odluke koje trebam od tebe prije korekcija

1. **Klizači (C6):** opcija A (sklopiva ploča), B (statična + link na Alat), ili C (kompaktna traka)?
2. **Musgrave (C1):** misliš li na uvodno mjesto u pogl. 1 („Musgraveov okvir", r31), ili na mjesto u pogl. 15? Treba li *zasebno* razrađeno pod-poglavlje o trima funkcijama, ili razradu na postojećem mjestu?
3. **Redoslijed korekcija:** krećemo li po Razredima A→D, ili želiš pilot na jednom poglavlju (npr. cijeli set kontrola na pogl. 02 ili 03) prije šireg zahvata?
4. **Tablice pune širine (C11):** smiju li široke tablice izaći u `.column-page` (preko margina-stupca), ili ih radije držiš unutar tekstualnog stupca uz prelamanje/sažimanje?

---

*Pomoćni artefakti: `tmp/sweep_controls.py` (analizator), `tmp/sweep_raw.json` (svi nalazi po retku), `tmp/sweep_summary.txt` (tablice). Mogu se ponovno pokrenuti nakon korekcija radi mjerenja napretka.*
