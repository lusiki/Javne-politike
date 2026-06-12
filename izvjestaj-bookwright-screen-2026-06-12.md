# Izvještaj — BookWright screening knjige (stanje + put do "cutting edge")

**Datum:** 12. lipnja 2026.
**Metoda:** Prilagođeni BookWright panel na razini cijele knjige — četiri paralelna read-only prolaza: (1) rekoncilijacija chapter-ledgera s živim datotekama, (2) tehnička revizija infrastrukture i rendera, (3) benchmark prema stanju tehnike interaktivnih udžbenika 2025./26. (web-verificirano), (4) provjera sadržajnih rupa iz smjernica protiv stvarnog repozitorija.
**Prethodni dokumenti:** nadovezuje se na `izvjestaj-strukturna-revizija-2026-06-10.md`, `smjernice-razvoj-knjige.md` (9. 6.) i `notes/platform-vision.md` (svibanj); ne ponavlja njihov sadržaj nego ga verificira i prioritizira.

---

## 1. Sažetak

Knjiga je sadržajno u znatno boljem stanju nego što njezini vlastiti evidencijski dokumenti tvrde. Chapter-ledger (10. 6.) zastario je u dva dana — od 20-ak otvorenih "self" stavki, **velika većina je u međuvremenu odrađena**: formalne definicije sada postoje u svih 19 sadržajnih poglavlja (84 def-bloka), empirija-callouti u pogl. 6 i 8 su dodani, pogl. 19 ima sintetski završetak koji zatvara petodijelni luk ("Pogled unatrag, kroz cijelu knjigu"), r−g dinamika u pogl. 13 ima prozno uporište, Le Grand i Brender/Shi citati su na mjestu, a tri staze čitanja — koje smjernice navode kao neiskorištenu priliku — **već stoje na landing stranici**.

Ono što knjigu danas dijeli od "cutting edge" statusa nije rukopis nego tri druge stvari:

1. **Nevidljivost prema van** — nula Open Graph / meta-description / canonical oznaka, nema llms.txt, nema CITATION.cff ni DOI-ja, nema 404 stranice. Knjiga je tehnički izvrsna iznutra, a dijeljenje poveznice na društvenim mrežama ne pokazuje ništa.
2. **PDF gubi trećinu pedagoškog aparata** — svih ~110 OJS grafova i SVG infografike jednostavno se brišu iz PDF-a bez statične zamjene.
3. **Obećana platforma je stub** — Alat (8 najavljenih alata, 0 implementiranih), Atlas djelomično onesposobljen, 4 skinuta dataseta u `data/atlas` ne koristi nijedno poglavlje, nema kvizova, pojmovnika ni nastavničkih materijala.

Preostali pravi sadržajni posao koncentriran je u koautorskom redu čekanja (~40 otvorenih domaćih ovjera, ponajviše Milanovih poreznih stopa u pogl. 14 i ERM II/euro/NPOO tvrdnji u pogl. 19) te u četiri-pet potvrđenih tematskih rupa (fiskalni federalizam, socijalno osiguranje, javni dug, EU kao država).

---

## 2. Verificirani snimak stanja (12. 6. 2026.)

### 2.1 Strukturni popis po poglavljima

| Pogl. | Linija | Praksa | Empirija | Vježba | Def | OJS | #fig- | fig-alt |
|---|---|---|---|---|---|---|---|---|
| 00 uvod | 69 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 01 uloga države | 318 | 1 | 1 | 1 | 2 | 7 | 1 | 2 |
| 02 alokacijska | 1002 | 1 | 1 | 1 | 5 | 30 | 0 | 6 |
| 03 distribucijska | 226 | 1 | 1 | 1 | 4 | 4 | 0 | 1 |
| 04 stabilizacijska | 316 | 1 | 1 | 1 | 5 | 5 | 1 | 1 |
| 05 javni izbor | 180 | 1 | 2 | 1 | 2 | 5 | 1 | 2 |
| 06 kolektivni izbor | 251 | 3 | 1 | 1 | 5 | 5 | 0 | 1 |
| 07 stranke i izbori | 155 | 3 | 2 | 1 | 5 | **0** | 0 | 0 |
| 08 interesne skupine | 125 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 09 birokracija | 221 | 1 | 1 | 1 | 5 | 4 | 0 | 1 |
| 10 institucionalna | 153 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 11 konstitucionalna | 147 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 12 instrumenti | 148 | 1 | 1 | 1 | 5 | **0** | 1 | 1 |
| 13 javna potrošnja | 207 | 1 | 1 | 1 | 3 | 3 | 0 | 1 |
| 14 porezi | 1520 | 2 | 3 | 2 | 4 | 36 | 1 | 9 |
| 15 državni neuspjesi | 257 | 1 | 1 | 1 | 6 | 3 | 0 | 1 |
| 16 NPM | 131 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 17 novo upravljanje | 129 | 1 | 1 | 1 | 4 | **0** | 0 | 0 |
| 18 CBA | 219 | 1 | 1 | 1 | 4 | 4 | 0 | 1 |
| 19 reforme | 209 | 1 | 1 | 1 | 5 | 4 | 0 | 1 |
| **Ukupno** | **9 114** | **24** | **22** | **20** | **84** | **110** | **~5** | **28** |

Uz to: 48 working-paper fusnota (`[^wp-…]`), 166 bib-zapisa, vježbe u svim poglavljima ispravno pozicionirane iza Sažetka.

### 2.2 Ledger-stavke koje su POTVRĐENO GOTOVE (ledger ih vodi kao otvorene)

- definicije: 02, 03, 04, 06, 07, 08, 09, 10, 12, 13, 15, 16, 17, 19 — sve imaju 3–6 def-blokova
- 06-empirija i 08-empirija calloute — prisutni
- 04-fig-keynes (`fig-keynesian-cross` label), 04-cite-imf (`@blanchard2013`, `@blyth2013`)
- 11-cite-empirics (`@brender2005; @shi2006`)
- 13-rg-prose (r > g razrađen u prozi), placeholder za domaću sekciju više nije na navedenome mjestu
- 14-korinek sekcija "Digitalizacija i umjetna inteligencija" s citatima
- 16-cite-legrand (`@legrand1991`)
- 19-synthesis — "Pogled unatrag, kroz cijelu knjigu" prolazi svih pet dijelova i vraća se na uvodno pitanje
- tri staze čitanja (A/B/C) na landing stranici — smjernice §1 su time već ispunjene

**Ledger treba ažurirati** — preporučujem da se gornje stavke prebace na `done` da konduktorov dashboard opet bude pouzdan.

### 2.3 Stavke koje su POTVRĐENO JOŠ OTVORENE (vlastiti posao, bez koautora)

| # | Stavka | Trošak |
|---|---|---|
| 1 | **pogl. 00:** "politika bez romantike" (linija 63) i dalje bez `[@buchanan…]` citata | 10 min |
| 2 | **pogl. 02:** 30 OJS grafova bez ijednog `#fig-` labela; knjiga ukupno ima ~5 labela na 110 grafova → grafovi se ne mogu križno referencirati | sustavan prolaz |
| 3 | **fig-alt pokrivenost:** 28 alt-tekstova na 110 OJS grafova; poglavlja 07, 08, 10, 11, 16, 17 nemaju nijedan | ide uz #2 |
| 4 | **pogl. 03:** nordijski materijal i tipologija režima bez Esping-Andersena (nema ga ni u bib) | 30 min + bib |
| 5 | **pogl. 07:** i dalje bez interaktivnog grafa (Hotelling/medijanski glasač); uz pogl. 08 i dalje najtanje u DIO II | srednje |
| 6 | **pogl. 08:** bez figure (logika kolektivnog djelovanja) | srednje |
| 7 | **pogl. 02, linija ~232:** formulacija "premašenu količinu Q~M~ po prenisko postavljenoj cijeni" — provjeriti je li "premašenu" željeni izraz (vjerojatno "prekomjernu/preveliku") | 5 min |
| 8 | **pogl. 14:** potvrdni style sweep (lint lažni pozitivi) | 30 min |

### 2.4 Koautorsko usko grlo (nepromijenjeno)

~40 otvorenih koautorskih ovjera. Kritične za vjerodostojnost:
- **pogl. 19, linija 173:** ERM II 2020 / euro 2023 / NPOO tvrdnje stoje **bez izvora** — jedino mjesto u knjizi gdje nosive činjenične tvrdnje nemaju citat (Milan)
- **pogl. 14:** sve hrvatske porezne stope i agregati čekaju Milanovu ovjeru s datumom stanja
- **pogl. 13:** sekcija "Javna potrošnja u Hrvatskoj i EU" (Milan)

Preporuka: konduktorov "ask" mod — tri kratka, omeđena zahtjeva (Milanu dva, Petri jedan skupni), jer je sav okolni tekst već napisan.

---

## 3. Što TREBA popraviti (should)

Rangirana lista — sve su to stvari koje knjigu danas aktivno koštaju čitatelja, vidljivosti ili vjerodostojnosti.

### 3.1 Vidljivost i akademska higijena (≈1 dan posla ukupno)

| Stavka | Stanje | Učinak popravka |
|---|---|---|
| Open Graph + Twitter card meta | **nema ih** | dijeljenje poveznice napokon pokazuje naslovnicu i opis; Quarto ima ugrađeno (`open-graph: true` + `image:`) |
| meta description + canonical | **nema** | Google snippet pod kontrolom autora |
| **llms.txt** | **nema** | Quarto to sada generira nativno (`llms-txt: true`) — jedna YAML linija; za knjigu na hrvatskom nadproporcionalno vrijedno jer AI asistenti citiraju čisti markdown umjesto da haluciniraju preko HTML-a |
| **CITATION.cff + Zenodo DOI** | **nema** | GitHub "Cite this repository" gumb + verzionirani DOI po izdanju (koncept-DOI u podnožje knjige); pola dana posla, formalna citatnost za sva tri autora |
| 404.html | **nema** | mrtve poveznice vode natrag u knjigu |
| Verzija/changelog vidljiv čitatelju | **nema** | čitatelj zna čita li stabilno izdanje ili radnu verziju |

### 3.2 Pristupačnost (2026. standard, ne zakonska obveza)

EU Accessibility Act (na snazi od 28. 6. 2025.) **ne obvezuje** besplatnu akademsku knjigu, ali je WCAG 2.1 AA de facto ljestvica kvalitete, a Quarto 1.8 ima ugrađene a11y provjere pri renderu:

- alt/aria tekst za ~110 OJS grafova — trenutno najveća rupa (canvas/SVG grafovi nevidljivi čitačima ekrana); spaja se s posлом #fig-labela iz §2.3
- provjeriti kontrast verdigris `#4A6B5C` na papiru `#F2EDE3` — blizu AA granice 4,5:1
- tipkovnička operabilnost OJS slidera

### 3.3 PDF — najveća pojedinačna tehnička investicija

`strip-ojs.lua` i `strip-svg.lua` brišu interaktivni sadržaj **bez zamjene**: PDF čitatelj (druga polovica publike, kako kažu smjernice) gubi svih 110 grafova i infografike. Rješenje: statični snapshot svakog grafa s default parametrima (ggplot2 rekreacija ili headless render), uvjetno uključen samo u PDF profil. Smjernice ovo točno identificiraju kao tehnički najvrjedniju investiciju — nalaz revizije to potvrđuje.

### 3.4 Performanse

- `02-alokacijska-funkcija.html` (693 KB) i `14-porezi.html` (838 KB) — dvostruko-trostruko iznad ostalih; mobilni čitatelji to osjete. Dijeljenje pogl. 14 (teorija / sustav u praksi), koje smjernice ionako predlažu, rješava i ovo.

---

## 4. Što knjigu MOŽE učiniti "cutting edge" (could)

Benchmark prema stanju tehnike (sve verificirano web-istraživanjem, lipanj 2026.): CORE Econ (born-interactive standard), R4DS 2e, Telling Stories with Data, The Effect, OWID teaching hub. Ključni nalaz: **nijedan udžbenik javnih politika još nije isporučio in-browser izvršne, automatski ocijenjene vježbe — knjiga koja to napravi na hrvatskom bila bi rana, ne kasna.**

### Razina 1 — brze pobjede (tjedan dana, sve zajedno)

1. **llms.txt + OG meta + CITATION.cff/DOI + 404** (§3.1) — knjiga postaje vidljiva ljudima, tražilicama i AI asistentima.
2. **Hover-pojmovnik iz postojećih def-blokova.** 84 `{#def-}` divova su gotova infrastruktura; `debruine/quarto-glossary` (Lua filter, malen, forkabilan) pretvara ih u hover-definicije kroz cijelu knjigu + centralnu `pojmovnik.qmd` stranicu. Dvojezični pojmovnik elegantno rješava i napetost oko engleskih glosa.
3. **"Hrvatska u brojkama" iz mrtvog kapitala.** 4 dataseta u `data/atlas` (COFOG, rashodi, prihodi, porezi % BDP-a) ne koristi nijedno poglavlje — jedan ggplot RH-vs-EU graf po praktičnom poglavlju (12–14), Milan osvježava jednom godišnje.

### Razina 2 — transformativne investicije (1–3 mjeseca, biraju se 2–3)

4. **quarto-live pilot (webR) u jednom poglavlju.** Grana `experiment/webr-quarto-live` već postoji na remoteu. quarto-live v0.2.0 (svibanj 2026., Posit) daje izvršne R ćelije + vježbe s prazninama, hintovima i automatskim ocjenjivanjem — na statičnom hostingu, bez servera. To je jedina stavka koja mijenja *kakva je ovo knjiga*: callout-vjezba postaje iskustvo umjesto upute. Pilot u pogl. 13 ili 18; oprez na payload (deseci MB pri prvom učitavanju) i PDF-strip plumbing (isti obrazac kao strip-ojs.lua).
5. **Statični PDF fallbackovi za OJS/SVG** (§3.3).
6. **Kvizovi za samoprovjeru.** Standard 2026. za R-temeljen Quarto udžbenik: `exams2forms` (dinamična pitanja, R/exams ekosustav) ili jednostavniji `webexercises`. Pet pitanja po poglavlju; banka pitanja ujedno je prvi korak prema nastavničkim materijalima. (naquiz je mrtav — izbjeći.)
7. **Nastavnički slajdovi (revealjs) po poglavlju.** Po benchmarku (Mankiw/CORE/OWID) presudan faktor usvajanja kolegija. Iz istih qmd izvora.
8. **Interaktivna vremenska crta hrvatskih javnih politika 1990.–danas** na landing stranici — efektno, jeftino, dijeljivo (smjernice §3).

### Razina 3 — strateški smjerovi (nakon zatvaranja backloga, uz koautore)

9. **Sadržajne rupe — potvrđene grep-om, ne dojmom:**
   - *Fiskalni federalizam:* 0 spominjanja Oatesa/Tiebouta/izravnanja u 9 114 linija; Tiebout i Oates (samostalno) nisu ni u bibliografiji. Najveća tiha rupa; novo poglavlje u DIO IV.
   - *Socijalno osiguranje/demografija:* uvod obećava mirovine-zdravstvo-obrazovanje, isporuka raspršena; `notes/frontier-expansion.md` već ima razrađen nacrt poglavlja.
   - *Javni dug:* "održivost duga" 0 pogodaka; ili proširiti pogl. 13 ili blok o dugoročnoj održivosti.
   - *EU kao država:* EU postoji samo kao sidro primjera; poglavlje u DIO III (koji s 2 poglavlja ostaje strukturno najtanji dio) — intelektualno najoriginalniji dodatak. Mueller je u bib; Vaubel, Besley/Persson, Mazzucato nisu.
   - *Bihevioralna politika:* djelomično pokrivena (nudge sekcija u pogl. 12, meki paternalizam u pogl. 03) — rupa je manja nego što smjernice tvrde; nedostaju sludge i bihevioralni neuspjesi regulatora, što su ENRICHMENT umetci, ne poglavlje.
   - *Proces nastanka politika:* Kingdon citiran jednom (pogl. 19), agenda-setting u pogl. 06 — tri potoka, punktuirana ravnoteža i koalicije zagovaranja nemaju dom.
10. **Provodni slučaj kroz pet dijelova** (euro ili klimatska politika; smjernice §4) — pogl. 19 sada ima retrospektivni zaključak, ali kumulativna nit kroz dijelove i dalje ne postoji.
11. **Atlas kao citatabilni izvor:** dovršiti onesposobljene indikatore u `podaci.qmd`, embed-gumb po grafu, DOI za datasete — pretvara Atlas u distribucijski kanal.
12. **Alat:** 8 najavljenih kalkulatora / 0 isporučenih — ili isporučiti prva 2 (porezni klin, Laffer — OJS već postoji u pogl. 14 kao osnova) ili skinuti stranicu s navbara dok ne postoji.

### Svjesno PRESKOČITI (verificirano protiv tržišta)

- **Shinylive** — svaki applet nosi vlastiti webR runtime; postojећих 110 OJS grafova daje istu pedagogiju uz ~1 % težine.
- **Ugrađeni RAG chat ("pitaj knjigu")** — kapa.ai cjenovno za dev-tools tvrtke; Cloudflare AI Search još u beti bez cijene. llms.txt rješava 80 % vrijednosti besplatno: čitatelj pita vlastiti ChatGPT/Claude. Revidirati kad se beta-cijene stabiliziraju.
- **TTS audio** — hrvatski je tek 2026. dosegao audioknjižnu kvalitetu (ElevenLabs v3, Azure hr-HR), ali trošak je tekući, a potražnja nedokazana; eventualno pilot s jednim poglavljem.
- **Automatski generirane OG slike po poglavlju** — ugrađena metadata s naslovnicom dovoljna.
- **Prijevod na engleski** — smjernice §6 ostaju točne: na engleskom konkurencija postoji, na hrvatskom ne.

---

## 5. Predloženi redoslijed (90 dana)

| Faza | Sadržaj | Ovisi o |
|---|---|---|
| **Tjedan 1** | Razina 1 u cijelosti: llms.txt, OG/meta/canonical, CITATION.cff + Zenodo, 404, Buchanan citat (pogl. 00), Esping-Andersen (pogl. 03), typo pogl. 02; ažurirati ledger | — |
| **Tjedan 2–3** | Sustavan #fig-label + fig-alt prolaz kroz svih 110 OJS grafova (rješava i a11y i križno referenciranje); kontrast-provjera teme | — |
| **Tjedan 4–6** | PDF statični fallbackovi (najvrjednija tehnička investicija); pojmovnik iz def-blokova | fig-labeli olakšavaju |
| **Tjedan 7–10** | quarto-live pilot u jednom poglavlju + odluka hoće li nove vježbe ići webR; kvizovi u 3 poglavlja kao proba | pilot prije rollouta |
| **Paralelno** | 3 omeđena koautorska zahtjeva (pogl. 14 stope, pogl. 19 ERM II/NPOO izvori, pogl. 13 HR sekcija); OJS graf za pogl. 07, figura za pogl. 08 | Milan, Petra |
| **Nakon toga** | Strateška odluka o DIO IV proširenju (federalizam → socijalno osiguranje → dug) i DIO III (EU poglavlje); provodni slučaj | koautorski potpis |

---

## 6. Korekcije za chapter-ledger (administrativno)

Prebaciti na `done`: 02-defs, 03-defs, 03-verify-oecd (citat prisutan), 04-fig-keynes, 04-defs, 04-cite-imf, 06-empirija, 06-defs, 07-defs, 08-empirija, 09-def, 10-defs, 11-cite-empirics, 12-defs, 13-defs, 13-rg-prose, 16-defs, 16-cite-legrand, 17-def, 19-defs, 19-synthesis (sekcija postoji — eventualno ostaviti otvorenu užu ideju "protokol u 10 koraka").

Ostaju otvorene: 00-cite-romance, 02-fig-labels, 02-typo (preformulirati opis), 03-cite-nordic, 07-expand (155 linija — ublaženo, ne zatvoreno), 07-ojs, 08-defs-fig (figura), 09-arc-narrow, 11-arc-canonical, 13-stub-draft (provjeriti gdje je placeholder završio), 14-style-confirm, 15-defs (ima ih 6 — vjerojatno done, provjeriti je li riječ o specifičnim pojmovima), 18-defs (4 — isto).

---

*Izvještaj sastavljen BookWright metodologijom (panel + konduktor + benchmark), 4 paralelna agenta, svi nalazi provjereni na živim datotekama repozitorija ili web-izvorima s URL-ovima u podlozi. Benchmark izvori: quarto-live v0.2.0, Closeread v1.0.1, exams2forms, debruine/quarto-glossary, Quarto native llms.txt, Zenodo/CITATION.cff, EAA/WCAG 2026 baseline, CORE Econ / R4DS / Mixtape / The Effect / OWID.*
