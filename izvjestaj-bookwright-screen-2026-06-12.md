# Izvještaj — BookWright screening knjige (ažurirano, stanje + put do "cutting edge")

**Datum:** 12. lipnja 2026. (ažurirana verzija — zamjenjuje raniji istoimeni izvještaj)
**Snimak:** grana `main`, HEAD `9868cee` (21 poglavlje, 00-uvod … 20-reforme). *Napomena: `main` je za vrijeme prolaza odmaknuo za jedan commit (`6f771a6`, `copy(book): ujednači formu prijevoda stručnih pojmova na prvi spomen`) — čisti prozni copy-edit koji ne mijenja nijedan strukturni broj, infra-nalaz ni sadržajnu rupu, pa nalazi vrijede i za `6f771a6`.*
**Metoda:** Prilagođeni BookWright panel na razini cijele knjige — čitanje iz čistog `git worktree`-a grane `main`, sedam paralelnih read-only agenata u četiri prolaza: (1) rekoncilijacija chapter-ledgera sa živim datotekama, (2) tehnička revizija infrastrukture, rendera, performansi, PDF-a i pristupačnosti, (3) benchmark prema stanju tehnike interaktivnih udžbenika 2026. (web-verificirano), (4) provjera sadržajnih rupa protiv stvarnog repozitorija — plus zaseban duboki pregled novog poglavlja 15. Svi nalazi unakrsno provjereni determinističkim `grep`/`wc` brojanjem na živim datotekama; sporne tvrdnje pojedinačno reverificirane.
**Odnos prema ranijoj verziji:** ovaj izvještaj **nije** novi nalaz nego ažuriranje. Knjiga se od prošlog prolaza materijalno promijenila (novo poglavlje EU, dovršena vanjska vidljivost, prenumeracija) pa su mnoge ranije tvrdnje sada zastarjele i ovdje su izrijekom označene kao *riješeno / novo / nepromijenjeno*.

---

## 0. Što se promijenilo od prošlog izvještaja (sažetak delte)

Četiri velike promjene na `main`-u od prošlog prolaza, redom po važnosti.

1. **Novo poglavlje 15 — "Javne financije Europske unije".** Knjiga sada ima **21 poglavlje** (prije 20). Staro poglavlja 15–19 prenumerirana su u 16–20. Poglavlje je dovršeno do faze `enriched`, citatno besprijekorno (23 ključa, svi razrješivi) i **zatvara raniju sadržajnu rupu "EU kao država"** u cijelosti.
2. **Vanjska vidljivost je odrađena.** Open Graph, Twitter card, meta-opis, dijeljenje, branded 404, `robots.txt` i potpuni `sitemap.xml` sada postoje i dobre su kvalitete. Prošli je izvještaj to vodio kao prazninu broj 1 ("nula OG/meta/404"); ta je dijagnoza sada uglavnom **riješena**.
3. **Sadržajne rupe su se smanjile.** Uz EU poglavlje, dinamika javnog duga (r > g) sada je formalizirana u poglavlju 13, a fiskalni federalizam (Oates, OCA teorija) ukotvljen je u poglavlju 15. Oates je ušao u bibliografiju.
4. **Estetski/uvodni zahvati.** Uvod je prepisan, naslov knjige je promijenjen u *"Sve što želite znati o državi i javnim politikama u Hrvatskoj"*, primijenjeni su estetski screen-ovi (Dan 1/2, Tjedan 1, polish), a Vodič-podstranice maknute su iz sidebara.

Ono što knjigu danas dijeli od "cutting edge" statusa **više nije ni rukopis ni vanjska vidljivost**, nego tri preostala sloja: (a) **trajni akademski identitet** (DOI + CITATION.cff + llms.txt još ne postoje), (b) **PDF i pristupačnost** (PDF i dalje briše svih 110 OJS grafova i sve SVG infografike bez statične zamjene; OJS grafovi ostaju nevidljivi čitačima ekrana), i (c) **platforma kao obećanje** (Alat je i dalje 8 najavljenih a 0 isporučenih alata).

---

## 1. Sažetak

Knjiga je u osjetno boljem stanju nego pri prošlom prolazu, a njezini evidencijski dokumenti (chapter-ledger od 10. 6.) sada su **dvostruko zastarjeli** — ne poznaju novo poglavlje 15 i koriste staru numeraciju 15–19. Strukturno je knjiga zrela. Determinističko brojanje na 21 poglavlju daje: **6 243 linije, 110 OJS-blokova, 88 def-blokova, 25 praksa- / 23 empirija- / 21 vježba-callouta, 28 figura s `#fig-` oznakom (svaka s pripadajućim `fig-alt`), 48 working-paper fusnota, 186 bib-zapisa.**

Tri pomaka vrijedi istaknuti jer mijenjaju prioritete iz prošlog izvještaja:

1. **Figura i pristupačnost — djelomičan napredak.** Broj označenih figura skočio je s ~5 na **28, i svaka od njih sada ima `fig-alt`**. Time je riješen dio rupe oko križnog referenciranja. Ali pokrivenost u dvama teškim poglavljima ostaje niska (pogl. 02: 6 oznaka na 30 OJS-a; pogl. 14: 9 na 36), pa **82 od 110 OJS-grafova i dalje nemaju oznaku ni tekstualnu alternativu**. Uz to, `fig-alt` se renderira kao komentirana linija unutar (sklopivog) bloka koda, a ne kao `aria-label` na samom grafu — tehnička pristupačnost grafova je i dalje slaba.
2. **Empirija-regresija u poglavlju 17 (NPM).** Ranije je konvencija bila da empirija-callout postoji svugdje osim u pogl. 06 i 08. Ta su dva poglavlja u međuvremenu popravljena (oba sada imaju empiriju), ali **poglavlje 17 (Novi javni menadžment) sada nema nijedan empirija-callout** — nova, jedina takva praznina u knjizi.
3. **Vidljivost je riješena, ali s nekoliko sitnih kvalitativnih nedostataka** koje grubi "ima/nema" test prošlog izvještaja nije mogao vidjeti: nedostaju `og:url` i `og:type` unutar inače ispravnog OG bloka, nema `rel="canonical"`, `apple-touch-icon` je deklariran kao resurs ali nije ulinkan u `<head>`, nema `theme-color`. Sve su to jeftini popravci kroz `include-in-header`.

Preostali pravi posao koncentriran je u: (a) **akademskoj higijeni** (DOI/CITATION.cff/llms.txt — nepromijenjeno, najveća prilika), (b) **PDF-u i a11y-ju OJS grafova** (nepromijenjeno, tehnički najvrjednija investicija), (c) **koautorskom redu čekanja** (pogl. 14 stope, pogl. 20 ERM II/euro/NPOO izvori, pogl. 13 i 15 hrvatska/EU empirija), i (d) **dvije-tri prave sadržajne rupe** koje su ostale otvorene (socijalno osiguranje, proces nastanka politika, "sludge").

---

## 2. Verificirani snimak stanja (main `9868cee`)

### 2.1 Strukturni popis po poglavljima

| Pogl. | Linija | Praksa | Empirija | Vježba | Def | OJS | #fig | fig-alt |
|---|---|---|---|---|---|---|---|---|
| 00 uvod | 59 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 01 uloga države | 326 | 1 | 1 | 1 | 2 | 7 | 2 | 2 |
| 02 alokacijska | 1008 | 1 | 1 | 1 | 5 | 30 | 6 | 6 |
| 03 distribucijska | 228 | 1 | 1 | 1 | 4 | 4 | 1 | 1 |
| 04 stabilizacijska | 322 | 1 | 1 | 1 | 5 | 5 | 1 | 1 |
| 05 javni izbor | 180 | 1 | 2 | 1 | 2 | 5 | 2 | 2 |
| 06 kolektivni izbor | 251 | 3 | 1 | 1 | 5 | 5 | 1 | 1 |
| 07 stranke i izbori | 153 | 3 | 2 | 1 | 5 | **0** | 0 | 0 |
| 08 interesne skupine | 123 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 09 birokracija | 219 | 1 | 1 | 1 | 5 | 4 | 1 | 1 |
| 10 institucionalna | 153 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 11 konstitucionalna | 145 | 1 | 1 | 1 | 5 | **0** | 0 | 0 |
| 12 instrumenti | 150 | 1 | 1 | 1 | 5 | **0** | 1 | 1 |
| 13 javna potrošnja | 207 | 1 | 1 | 1 | 3 | 3 | 1 | 1 |
| 14 porezi | 1534 | 2 | 3 | 2 | 4 | 36 | 9 | 9 |
| **15 EU javne financije** ⟵ novo | 242 | 1 | 1 | 1 | 4 | **0** | 0 | 0 |
| 16 državni neuspjesi | 257 | 1 | 1 | 1 | 6 | 3 | 1 | 1 |
| 17 NPM | 129 | 1 | **0** | 1 | 5 | **0** | 0 | 0 |
| 18 novo upravljanje | 129 | 1 | 1 | 1 | 4 | **0** | 0 | 0 |
| 19 CBA | 219 | 1 | 1 | 1 | 4 | 4 | 1 | 1 |
| 20 reforme | 209 | 1 | 1 | 1 | 5 | 4 | 1 | 1 |
| **Ukupno (21)** | **6 243** | **25** | **23** | **21** | **88** | **110** | **28** | **28** |

Naslov na `main`-u: *"Sve što želite znati o državi i javnim politikama u Hrvatskoj"* (ledger još vodi stari naslov "…odnosu države i tržišta"). Vježbe ispravno pozicionirane iza Sažetka u svim poglavljima. Vodič-hub + 20 podstranica renderirani; podstranice prunane iz sidebara JS-om u `book-include.html`.

### 2.2 Što je RIJEŠENO od prošlog izvještaja

**Vanjska vidljivost (bila praznina #1, sada uglavnom riješeno):**
- Open Graph (`og:title`/`description`/`image` s apsolutnim URL-om/`site_name` + dimenzije slike) — prisutan na naslovnoj i poglavljima.
- Twitter card (`summary_large_image`) — prisutan.
- Meta-opis — supstancijalan, propagira na sva poglavlja.
- `sitemap.xml` — potpun, ispravno uključuje prenumerirano poglavlje 15 i svih 20 vodič-podstranica.
- `robots.txt` — prisutan, ispravno upućuje na sitemap.
- Branded 404 stranica (`404.qmd` → `docs/404.html`, ~57 KB) s navigacijskim karticama i apsolutnim putanjama.

**Sadržaj i struktura:**
- Novo poglavlje 15 (EU javne financije) — `enriched`, citatno čisto (vidi §7).
- Empirija-callouti u pogl. 06 i 08 — sada prisutni (ranija praznina zatvorena).
- Definicije — `{#def-}` blokovi sada u svim poglavljima osim uvoda (88 ukupno, 3–6 po poglavlju); time su gotovo svi raniji `*-defs` ledger-zadaci odrađeni.
- Dinamika javnog duga (r > g) — formalizirana u `def-javni-dug` (pogl. 13) + vježba.
- Fiskalni federalizam — Oates ušao u bibliografiju (`oates1972`, `oates1999`) i citiran u pogl. 15.
- Figura/`fig-alt` — 28 označenih figura, svaka s alt-tekstom (djelomičan napredak; vidi §2.3).

**Tehnika:**
- Kontrast verdigris `#4A6B5C` na papiru `#F2EDE3` = **5,07:1 — prolazi WCAG AA** (ink 15,0:1, oxblood 9,7:1 prolaze; ochre `#C8985E` 2,22:1 pada, ali je dekorativni timeline-akcent, ne tekst).
- Poglavlje 02 lakše za ~100 KB (592 KB naspram ranijih 693 KB).
- Render-cjevovod zdrav (`search.json` 975 KB / 255 unosa, `_freeze` čist, MathJax samo gdje treba).

### 2.3 Što je POTVRĐENO JOŠ OTVORENO (vlastiti posao, bez koautora)

| # | Stavka | Status / lokacija | Trošak |
|---|---|---|---|
| 1 | **pogl. 17 (NPM): nedostaje empirija-callout** | Novo. Ima praksa (linija 51) + vježba (119), ali 0 empirija — jedina takva praznina u knjizi | nizak |
| 2 | **pogl. 15 (EU): nema nijedan OJS graf ni figuru** | Jedino DIO IV poglavlje bez vizualizacije; tri MD-tablice nose teret | srednje |
| 3 | **fig-label + a11y pokrivenost OJS grafova** | 82 od 110 OJS-a neoznačeno; teška poglavlja 02 (6/30) i 14 (9/36); `fig-alt` nije ožičen kao `aria-label` na grafu | sustavan prolaz |
| 4 | **pogl. 00: "politika bez romantike" bez citata** | Linija 53, i dalje bez `[@buchanan…]` | 10 min |
| 5 | **pogl. 03: Esping-Andersen** | Tipologija režima i nordijski callout bez atribucije; nema ga ni u bib | 30 min + bib |
| 6 | **pogl. 07: pretanko (153 lin.) + bez OJS grafa** | Jezgrena tema DIO II; nema interaktivnog (Hotelling/medijanski glasač) | srednje |
| 7 | **pogl. 08: pretanko (123 lin.) + bez figure** | Najtanje u DIO II; logika kolektivnog djelovanja bez vizuala | srednje |
| 8 | **vidljivost — kvalitativni nedostaci** | Nema `og:url`/`og:type` u OG bloku; nema `rel="canonical"`; `apple-touch-icon` deklariran ali ne ulinkan u `<head>`; nema `theme-color` | 1 sat (include-in-header) |
| 9 | **autorsko ime — dijakritik** | `_quarto.yml` linija 18 ima "Luka Sikić" — nedostaje početno **Š** (treba "Luka Šikić"); suautori imaju pune dijakritike | 2 min |
| 10 | **pogl. 02: formulacija "premašenu količinu"** | Linija 235; "prenisko postavljenoj cijeni" je sada ispravno, ostaje samo izbor riječi "premašenu" (vjerojatno "prekomjernu") | 5 min |
| 11 | **pogl. 14: potvrdni style sweep** | Lint lažni pozitivi iz instruktivnih blokova | 30 min |

### 2.4 Koautorsko usko grlo

Nepromijenjeno po naravi, ali s novim čvorom (pogl. 15). Kritično za vjerodostojnost:
- **pogl. 20 (reforme), ~linija 130:** ERM II 2020 / euro 2023 / NPOO tvrdnje i dalje bez izvora i potpisa (Milan).
- **pogl. 14:** sve hrvatske porezne stope i agregati čekaju Milanovu ovjeru s datumom stanja.
- **pogl. 13:** sekcija "Javna potrošnja u Hrvatskoj i EU" (Milan).
- **pogl. 15 (novo):** hrvatske/EU brojke u NGEU/Hrvatska sekciji i Semester praksa-calloutu + ovjera triju datuma (okvir na snazi 30. 4. 2024.; Vijeće sij. 2025.; preporuke srp. 2025.) — Milan/Petra; tekst je već napisan, treba samo ovjera.

---

## 3. Što TREBA popraviti (should)

### 3.1 Akademska higijena — sada najveća pojedinačna prilika (≈pola dana)

Ovo je dio koji se **nije pomaknuo** od prošlog izvještaja i sada je, kad je vidljivost odrađena, na vrhu liste.

| Stavka | Stanje | Učinak |
|---|---|---|
| **CITATION.cff + Zenodo DOI** | nema | GitHub "Cite this repository" gumb + trajni, verzionirani DOI po izdanju (koncept-DOI u podnožje). Za troje imenovanih autora to je najveći pojedinačni dobitak na akademskoj vjerodostojnosti. Nizak trošak. |
| **llms.txt** | nema | Quarto 1.7+ to generira nativno (`website: → llms-txt: true`, jedna linija) — pише `llms.txt` indeks + `.llms.md` čisti markdown za svaku stranicu. Za knjigu na hrvatskom nadproporcionalno vrijedno jer AI asistenti citiraju čist tekst umjesto da haluciniraju preko HTML-a. |
| **og:url + og:type + rel=canonical** | nema | Dijeljenje se razrješava na kanonsku stranicu; bogatiji rich-preview; SEO higijena. Kroz `include-in-header`. |
| **apple-touch-icon link + theme-color** | resurs postoji, nije ulinkan | iOS bookmark dobiva ikonu umjesto screenshota; mobilni browser-chrome u boji teme. |
| **Vidljiva oznaka izdanja** | nema | Čitatelj zna čita li radnu ili stabilnu verziju (npr. "Radna verzija, lipanj 2026." na naslovnoj). |
| **Ispravak dijakritika autora** | "Luka Sikić" | Ime u meta-podacima i citatnim podacima bit će točno ("Luka Šikić"). |

### 3.2 PDF — tehnički najvrjednija investicija (nepromijenjeno, **visok prioritet**)

`_quarto-pdf.yml` aktivira **oba** filtra — `strip-ojs.lua` i `strip-svg.lua`. Posljedica: svih ~110 OJS grafova **i** sve SVG infografike (pogl. 01/05/12/14) brišu se iz PDF-a **bez statične zamjene**. Sam `strip-svg.lua` u zaglavlju je označen kao privremen ("TODO: ukloniti kad postoji rsvg-convert/PNG fallback"). PDF je tekstualno vjeran, ali slijep za figure. Rješenje: pred-renderirani PNG/PDF snapshotovi za ~4 SVG infografike i ključne OJS figure, uvjetno samo u PDF profilu, pa ukloniti `strip-svg.lua`. Dotad PDF ostaje označen kao "Radna verzija".

### 3.3 Pristupačnost OJS grafova (nepromijenjeno, **visok prioritet**)

Kontrast palete je riješen (§2.2). Prava preostala rupa: OJS grafovi montiraju se u prazan `div` JS-om u browseru i nemaju pristupačno ime. Samo 28 od 110 OJS-blokova ima `fig-alt`, a i taj se renderira kao komentar u bloku koda, ne kao `aria-label`/`role="img"` na grafu. Sliders su (`Inputs.range`, 38 ih je) tipkovnički operabilni po defaultu, ali bez labela vezanog uz graf. Posao: omotati svaki OJS graf u kontejner koji izlaže `fig-alt` kao `aria-label`, podići pokrivenost prema 1:1 (prioritet pogl. 02 i 14), i uz svaki slider dati tekst/tablicu vrijednosti. Ovo se spaja s poslom #fig-oznaka iz §2.3.

### 3.4 Performanse (manja stavka)

- `14-porezi.html` = **868 KB** (najteža stranica, ~nepromijenjeno; 36 OJS-a), `02-alokacijska.html` = **592 KB** (lakše za 100 KB). Novo pogl. 15 = 239 KB, čisto (0 OJS/SVG). Ako je važna mobilna brzina, podijeliti najteže figure u pogl. 14 ili lazy-mount OJS ćelija; inače prihvatljivo kao cijena interaktivne pedagogije.

---

## 4. Što knjigu MOŽE učiniti "cutting edge" (could)

Benchmark prema stanju tehnike, web-verificiran lipanj 2026. **Ključni nalaz iz prošlog izvještaja i dalje vrijedi, ali pooštren:** in-browser izvršne, automatski ocijenjene vježbe i dalje nije isporučio nijedan udžbenik javnih politika — a izvršni + autogradirani udžbenik **na hrvatskom** ostaje rana, ne kasna pozicija. Standard su postavili udžbenici podatkovne znanosti (CORE Econ "The Economy 2.0", R4DS 2e, The Effect 2e, Telling Stories with Data), ali nitko u kombinaciji (jezik = hrvatski) × (domena = javni izbor + primijenjene javne financije).

### Razina 1 — brze pobjede (dani)

1. **llms.txt + CITATION.cff/Zenodo DOI + og:url/canonical/apple-touch/theme-color + oznaka izdanja** (§3.1) — knjiga postaje trajno citatabilna i bolje vidljiva ljudima, tražilicama i AI asistentima. Sve nisko-trošno.
2. **Kvizovi za samoprovjeru — `rquiz` (CRAN).** *Ispravak prošlog izvještaja:* 2026. pobjednik za server-free kvizove je **`rquiz`** (čisti htmlwidget, bez servera, MC + cloze, ARIA/višejezičnost) — radi u HTML knjizi, autorira se inline u qmd. `exams2forms` ostaje teža alternativa (pilot) ako zatreba banka parametriziranih pitanja s exportom u PDF/Moodle. `webexercises` je zamrznut (zadnje izdanje 2023.), `naquiz` mrtav — **izbjeći oba**.
3. **Hover-pojmovnik (`debruine/quarto-glossary`).** *Korekcija prošlog izvještaja:* ovo **nije** "gotova infrastruktura / brza pobjeda". 88 `{#def-}` blokova su teorem-stilske definicije (pojam podebljan u rečenici), **ne** strojno čitljiv `pojam: definicija` rječnik. `quarto-glossary` traži zaseban YAML koji treba jednokratno izvući iz tih 88 definicija (ručno ili skriptom). Kad YAML postoji, ožičenje je trivijalno i sjeda na već uključene `citations-hover`/`footnotes-hover`. Vrijedno, ali **srednji** trošak.

### Razina 2 — transformativne investicije (biraju se 2–3)

4. **Izvršne ćelije — `coatless/quarto-webr`, ne `quarto-live`.** *Važan ispravak:* `quarto-live` (r-wasm) zadnje je na **v0.1.2 (sij. 2025., pre-1.0)** i isporučuje se kao vlastiti `format: live-html` koji **sukobljava** s `type: book` (jedan zajednički `format: html`) — Posit forum potvrđuje da korisnici nisu mogli čisto koristiti `live-html` unutar knjige. Dvije izvedive staze: (a) filter-temeljeni `coatless/quarto-webr` (`filters: [webr]`) na 1–2 podatkovno teška poglavlja (pogl. 02, 14), ili (b) zaseban standalone `live-html` radni list izvan projekta knjige koji reupotrebljava podatke poglavlja. Pilot prije rollouta — payload i WASM-dostupnost paketa su realna ograničenja. Ovo je jedina stavka koja mijenja *kakva je ovo knjiga*: 21 statična `callout-vjezba` postaje izvršno iskustvo.
5. **Statični PDF/SVG fallbackovi** (§3.2).
6. **Nastavnički revealjs slajdovi po poglavlju.** Quarto ne podržava revealjs unutar `type: book`, pa se gradi kao **zaseban build-profil** (`_quarto-slides.yml` + `{{< include >}}`), izvan `chapters:` liste. Stabilna jezgra Quarta, srednji trošak, visoka nastavnička vrijednost.
7. **"Hrvatska u brojkama" iz Atlasa.** 4 CSV-a u `data/atlas` (rashodi, prihodi, porezi, COFOG) već pokreću Atlas, ali ih ne koristi nijedno poglavlje. Jedan ggplot/OJS RH-vs-EU graf po praktičnom poglavlju (12–15) iz istog izvora.

### Razina 3 — strateški smjerovi (uz koautore)

8. **Preostale sadržajne rupe** (vidi §5).
9. **closeread** kao zaseban marquee data-story (npr. "kako nastaje javni dug" ili šetnja kroz fiskalni federalizam) — v1.0.1 (stud. 2025.), zreo, ali je također vlastiti `format` koji se sukobljava s knjigom; **samo standalone**, ne transformacija poglavlja. Watch.
10. **Alat:** 8 najavljenih kalkulatora / 0 isporučenih — ili isporučiti prva 2 (porezni klin, Lafferova krivulja — Atlas dokazuje da OJS+Plot lanac radi) ili stranicu pošteno preimenovati u "plan/roadmap" da se ne čita kao isporučena funkcija (vidi §6).

### Svjesno PRESKOČITI

- **EPUB** — konfiguracija je jedna linija, ali svaki OJS graf i custom callout otpadaju ili degradiraju; za web-first knjigu čija je razlika upravo interaktivnost, EPUB cijepa održavanje za marginalan doseg. PDF već pokriva statičnu distribuciju.
- **Shinylive / ugrađeni RAG / TTS / auto-OG-slike / prijevod na engleski** — kao u prošlom izvještaju (llms.txt rješava 80 % "pitaj knjigu" vrijednosti; na hrvatskom nema konkurencije).

---

## 5. Sadržajne rupe — reocijenjeno protiv `main`-a

Šest rupa iz prošlog izvještaja, provjereno čitanjem živih poglavlja i `references.bib`-a. **Tri su zatvorene/smanjene, tri stoje.**

**Zatvoreno / smanjeno:**
- **EU kao država / EU javne financije — ZATVORENO.** Cijelo novo poglavlje 15 (242 linije, 3 tablice, 2 def-bloka, sva tri callouta, izvori iz 2024./25.). Najveća pojedinačna promjena.
- **Održivost javnog duga — POKRIVENO.** `def-javni-dug` (pogl. 13, lin. 163–165) formalizira r > g "grudvanje"; Reinhart-Rogoff u pogl. 04 (lin. 288); EU-DSA okvir u pogl. 15. Ostaje samo sitni polish (nema eksplicitne jednadžbe/figure dinamike duga).
- **Fiskalni federalizam — DJELOMIČNO → uglavnom zatvoreno na EU razini.** Oates u bib + citiran u pogl. 15 (lin. 30, 104, načelo korespondencije), OCA teorija (Mundell/Kenen), risk-sharing (Sachs-Sala-i-Martin, Sørensen-Yosha). **Rezidual:** Tiebout ("glasanje nogama") nigdje se ne spominje (nema ga u bib), a **domaći** fiskalni federalizam (dodjela poreza nižim razinama, izravnanje — `izravnanje` 0 pogodaka) odsutan je; obrada je EU-kao-razina, ne hrvatske lokalne financije.

**I dalje otvoreno (sve srednja težina):**
- **Socijalno osiguranje (mirovine/zdravstvo/demografija) — DJELOMIČNO.** Ekonomska logika je čvrsta (udruživanje rizika, tržišni neuspjesi, demografija, Baumolova bolest troškova — pogl. 13, lin. 115/123/131–133), ali nema strukturirane obrade dizajna mirovinskog sustava (PAYG vs kapitalizirano, tri stupa), omjera ovisnosti, ni atribuirane tipologije socijalne države. **Esping-Andersen i dalje nije ni u bib ni u tekstu.**
- **Proces nastanka politika — DJELOMIČNO, najmanje popravljeno.** Agenda-setting je rigorozan, ali samo kroz javni/socijalni izbor (McKelvey, Romer-Rosenthal u pogl. 06). Kingdon je jedno spominjanje u pogl. 20 (lin. 21); **punktuirana ravnoteža (Baumgartner-Jones) i koalicije zagovaranja (Sabatier) potpuno odsutne** iz bib i teksta. Za knjigu *javnih politika* ovo je najbranjiviji pojedinačni dodatak — Kingdon je već u bib, pa je proširenje "tri toka" jeftino.
- **Bihevioralna politika — DJELOMIČNO.** Nudge je adekvatno pokriven (pogl. 12, lin. 100–108, Thaler-Sunstein, auto-uključivanje s empirijom). **"Sludge" je odsutan svugdje (0 pogodaka)**, a regulatorni neuspjeh u pogl. 16 uokviren je kao zarobljavanje/birokracija, nikad bihevioralno. Most pogl. 12 ↔ pogl. 16 je jeftin (Sunstein 2017 već u bib).

**Potvrđeno odsutni bib-ključevi:** Tiebout, Esping-Andersen, Mazzucato, Vaubel, Besley, Persson, Sabatier, Baumgartner-Jones.

**Dvije najveće prilike uz najmanji trošak:** proširenje "multiple streams" u pogl. 20 (Kingdon već u bib) i "sludge" odlomak koji premošćuje pogl. 12 i 16 (Sunstein već u bib).

---

## 6. Stanje platforme (Alat / Atlas / Resursi)

- **Alat (`alat.qmd`) — i dalje 8 najavljenih, 0 isporučenih.** Svih 8 kartica je `vd-soon` "Uskoro" placeholder; 0 OJS-blokova, 0 skripti, 0 inputa u cijeloj datoteci. Nedavna izmjena (+110 linija, commit 76c6094) samo je dodala/preuredila placeholder-kartice. Preporuka: isporučiti barem jedan flagship kalkulator (porezni klin ili Laffer — Atlas dokazuje da lanac radi) **ili** stranicu pošteno označiti kao plan, da je se ne čita kao isporučena funkcija.
- **Atlas (`podaci.qmd`) — živ.** Potpuno ožičen OJS dashboard s 4 aktivna indikatora (rashodi, prihodi, porezi, COFOG) iz 4 CSV-a, s prebacivanjem karta/serija/tablica, peer-odabirom i CSV-preuzimanjem. Pošteni nedostaci: search-polje i 4 sidebar-indikatora (porezni klin, struktura poreza, socijalna zaštita) su namjerno onesposobljeni stubovi; gumb "Otvori izvor" se može ožičiti na već prisutne Eurostat URL-ove uz gotovo nula truda.
- **"Mrtvi kapital" — preciznije.** 4 atlas-CSV-a koriste se **isključivo** u `podaci.qmd`; nijedno poglavlje ne čita vanjske podatke (svi grafovi poglavlja koriste inline podatke). Dakle CSV-i **nisu** mrtvi na razini projekta — pokreću Atlas; jedino je `data/` (samo `.gitkeep`) prazan i poglavlja nikad nisu usvojila vanjsko-podatkovni obrazac.
- **Resursi (`resursi.qmd`) — bogat, kuriran direktorij** (~190 anotiranih poveznica u ~20 sekcija). Nije stub.
- **Vodič — koherentno ožičen** (hub + 20 podstranica, prunane iz sidebara timed JS-om; sitni rizik bljeska pri kasnom re-renderu sidebara).

---

## 7. Novo poglavlje 15 — "Javne financije EU" (prva ocjena)

Poglavlje nema ledger-zapis; ovo je njegova prva ocjena. **Faza: `enriched`, spremno za koautorsku reviziju.**

**Snaga:** potpun konceptualni luk koji izrijekom zatvara rupu "EU kao država", provučen jednim organizacijskim pitanjem ("zajednička valuta bez zajedničkog proračuna"). Pokriva svih pet ciljnih područja — EU proračun (vlastiti izvori, VFO, struktura rashoda), teoriju fiskalnog federalizma (Oates, OCA, risk-sharing), povijest fiskalnih pravila (Maastricht → 2024.), Europski semestar (3 stupa) i NextGenerationEU. Jaka javnoizborna okosnica (deficitna pristranost, moralni hazard, eksternalije duga). **Citatna besprijekornost: svih 23 ključa razrješivo, bez visećih.** Tri dobro građene MD-tablice nose vizualni teret. Sva tri callouta prisutna (među ostalim, empirija — američka federalna apsorpcija šokova). Stilski usklađeno.

**Slabosti / posao:**
- **Nema OJS grafa ni figure** (srednje). Jedino DIO IV poglavlje bez vizuala; tvrdnja "EU proračun je malen" (lin. 46/48/180/233) zaslužuje jedan stupčasti graf (EU proračun ~1 % BND-a vs nacionalni ~45–50 % BDP-a) + `fig-alt`; to daje i vježbi vizualno sidro.
- **Balansirani proračun vs NGEU** (nizak). Lin. 52/182 tvrde da proračun "mora biti uravnotežen", pa odmah navode NGEU zaduživanje; pola rečenice neka razjasni da balansirano pravilo veže redovni godišnji proračun, a NGEU zaduživanje ide izvan njega kroz Odluku o vlastitim izvorima/headroom.
- **Tiebout** (nizak, opcionalno). Fiskalni federalizam u lin. 30/104 leži samo na Oatesu; jedna klauzula o Tiebout-sortiranju zaokružila bi mikro-temelj — ali samo ako se doda bib-ključ, bez izmišljanja.
- **Koautorski** (vidi §2.4): hrvatske/EU brojke u NGEU/Hrvatska sekciji + ovjera triju datuma.

**Strukturna uloga:** pretvara DIO IV iz čisto nacionalnog u nacionalni + supranacionalni sloj; funkcionira kao praktični vrhunac DIO IV i most prema DIO V; re-sidri se na Musgraveove tri funkcije iz DIO I (jaka vertikalna integracija). Vjerojatno najaktualnije poglavlje u knjizi (izvori 2024./25.).

---

## 8. Korekcije za chapter-ledger (administrativno)

**Ledger je sada dvostruko zastario** i traži obnovu, ne krpanje:

1. **Numeracija:** ledger vodi 20 poglavlja sa starim brojevima 15–19 (državni neuspjesi → reforme). Na `main`-u su to **16–20**. Svaki zapis 15–19 treba pomaknuti +1.
2. **Nedostaje poglavlje 15 (EU javne financije)** — dodati novi zapis (stage `enriched`; open self: `15-ojs-fig` jedan graf, `15-balanced-ngeu` pola rečenice; coauthor: HR/EU empirija + 3 datuma).
3. **Naslov knjige** u ledgeru zastario — ažurirati na "Sve što želite znati o državi i javnim politikama u Hrvatskoj".

**Prebaciti na `done`** (potvrđeno determinističkim brojanjem): svi `*-defs` zadaci (88 def-blokova u svim poglavljima osim uvoda), `06-empirija`, `08-empirija`, `04-fig-keynes`, `16-cite-legrand` (legrand1991 prisutan), `13-rg-prose` (def-javni-dug), `19-synthesis` (postoji "Pogled unatrag"), te ranije vježbe.

**Ostaju / novo otvoreni (self):** `00-cite-romance`, `02-typo` (samo "premašenu"), `02/14-fig-labels` (+ a11y ožičenje), `03-cite-nordic` (Esping-Andersen), `07-expand` + `07-ojs`, `08-expand` + `08-fig`, **`17-empirija` (novo)**, `15-ojs-fig` (novo), vidljivost-kvaliteta (`og:url`/`canonical`/`apple-touch`/`theme-color`), `author-diacritic`, akademska higijena (`llms-txt`, `citation-cff`, `doi`).

---

## 9. Predloženi redoslijed (ažurirano)

| Faza | Sadržaj | Ovisi o |
|---|---|---|
| **Brzo (dani)** | Akademska higijena: `llms-txt: true`, CITATION.cff + Zenodo DOI, `og:url`/`og:type`/`canonical`/`apple-touch`/`theme-color`, oznaka izdanja, ispravak "Luka Šikić"; Buchanan citat (pogl. 00); empirija-callout u pogl. 17; obnova ledgera na 21-poglavlje | — |
| **Tjedan 1–2** | Sustavan #fig-label + `fig-alt`→`aria-label` prolaz (prioritet pogl. 02 i 14, rješava a11y + križne reference); jedan OJS graf za pogl. 15; Esping-Andersen + pogl. 03 | — |
| **Tjedan 3–5** | PDF statični fallbackovi (najvrjednija tehnička investicija), zatim ukloniti `strip-svg.lua`; pojmovnik (YAML iz 88 def-blokova → quarto-glossary) | fig-labeli olakšavaju |
| **Tjedan 6–9** | `quarto-webr` pilot u pogl. 02/14 + odluka o izvršnim vježbama; `rquiz` u 3 poglavlja kao proba; revealjs slajd-profil | pilot prije rollouta |
| **Paralelno** | Koautorski zahtjevi: pogl. 14 stope, pogl. 20 ERM II/euro/NPOO, pogl. 13 HR sekcija, pogl. 15 HR/EU empirija + 3 datuma; OJS graf za pogl. 07, figura za pogl. 08 | Milan, Petra |
| **Nakon toga** | Preostale sadržajne rupe: "multiple streams" (Kingdon) u pogl. 20, "sludge" most pogl. 12↔16, socijalno osiguranje (Esping-Andersen, dizajn mirovina); odluka o Alatu (isporučiti 2 ili preimenovati) | koautorski potpis |

---

*Izvještaj sastavljen BookWright metodologijom (panel + konduktor + benchmark) na grani `main` (`9868cee`), 7 paralelnih agenata, svi nalazi provjereni determinističkim brojanjem na živim datotekama čistog worktreeja ili web-izvorima s URL-ovima u podlozi. Benchmark izvori (lipanj 2026.): Quarto 1.7 native llms.txt, CITATION.cff/Zenodo, rquiz (CRAN), debruine/quarto-glossary, r-wasm/quarto-live v0.1.2 + coatless/quarto-webr, qmd-lab/closeread v1.0.1, exams2forms, EAA/EN 301 549/WCAG 2.1 AA, CORE Econ 2.0 / R4DS 2e / The Effect 2e / Telling Stories with Data / OWID.*
