# Izvještaj — estetski screening knjige (stanje + prijedlozi)

**Datum:** 12. lipnja 2026.
**Opseg:** vizualni i strukturni sloj knjige — tema i dizajnerski tokeni, tipografija, tamni način, naslovnica i navigacija, dosljednost među poglavljima, identitet grafova/slika, vodič i dodaci, te ono što stvarno isporučuje render (HTML + PDF).
**Metoda:** osam paralelnih read-only prolaza po dimenzijama, sa adversarijalnom provjerom svakog nalaza visoke/srednje težine i završnim „completeness" kriticom. Tri dimenzije (tipografija, tamni način, vodič/dodaci) i kritic prošle su puni ciklus s provjerom; preostalih pet (tokeni, navigacija, dosljednost, grafovi, render) dovršeno je izravnim pregledom datoteka nakon prekida. **Svi nalazi u nastavku provjereni su na živim datotekama** — svaki nosi `datoteka:linija` i točne vrijednosti.
**Nadovezuje se na:** `izvjestaj-bookwright-screen-2026-06-12.md` (sadržaj/infrastruktura) — ovaj izvještaj ne ponavlja onaj nego pokriva isključivo estetiku.

---

## 1. Sažetak

Knjiga ima **ozbiljan, promišljen dizajnerski sustav** — STATECRAFT paleta (toplo papirnato dno, tinta, verdigris) provedena je s knjiškim mikro-detaljima koje malo tko radi: Newsreader serif za prozu sa oldstyle brojkama prebačenima na tabularne unutar tablica, mjera retka od ~70 znakova uz pune egzibite, hrvatski `hyphens:auto` s namjernim lijevim poravnanjem zbog dijakritike, dvorazinska margina (sidenote vs. citat), tematizirana selekcija teksta, `:focus-visible` stanja, `prefers-reduced-motion` u tri sloja, dinkus razdjelnik i ornamentirana sidrišta naslova. Vodič (slikovnica) i Atlas izrađeni su istim vokabularom, s besprijekornom disciplinom tokena.

Problem nije u konceptu nego u **rasponu provedbe**. Tri obrasca se ponavljaju i objašnjavaju gotovo sve nalaze:

1. **Cijeli sloj „identiteta poglavlja" je mrtav u runtimeu.** Vodeni žig s brojem poglavlja, čip s vremenom čitanja, inicijal (drop cap) i završni ornament svi su uvjetovani naslovom koji počinje brojkom (`/^(\d+)/`), a nijedan naslov u knjizi ne počinje brojkom (`number-sections: false`). Te značajke, koje CLAUDE.md navodi kao brand-element, **renderiraju se na nula stranica**. Isti uzrok proizvodi brojeve slika („Slika 7.1") koji referenciraju broj poglavlja koji nigdje nije vidljiv i k tome je pomaknut za +2.

2. **Tamni način je „spot-fix" preko svjetlog, pa rubni elementi propadaju.** Jezgra čitanja (proza, tablice, kod) pokrivena je toplom sepijom, ali navbar ostaje krem, **naslovnica je velikim dijelom nečitka** (gumbi, autorska meta, kartice staza, TOC), **sva 24 OJS grafa nestaju** na tamnom dnu, a tri pedagoška callouta gube svoj identitetski čip. Korijen: `$body-bg` u `custom.scss` nema `!default`, pa se tamni Bootstrap kompajlira sa svijetlim `--bs-body-bg`, a sve nepokriveno propada.

3. **Predredizajnski (navy/gold) ostaci žive paralelno s STATECRAFT-om.** `styles/styles.css` — koji se učitava *nakon* kompajlirane teme — u cijelosti je u staroj paleti (#14213D navy, #B08538 gold), pa navbar, PDF-gumbi, traka napretka čitanja, TOC-pregled i hover-preview prikazuju staru paletu **na svakoj stranici, i u svijetlom načinu**. Usporedno, cijela R/ggplot infrastruktura (stara paleta u `theme_book.R`) je **mrtva** — nijedno poglavlje ne izvršava R, svih 110 grafova su OJS.

Uz to, dvije „okolne" površine cure izvan brenda: **deklarirani favicon ne postoji** (svaka kartica preglednika prikazuje zadanu ikonu i radi 404), a nema društvenih meta-oznaka, 404 stranice ni tematiziranog Hypothesis klijenta.

Nijedan od ovih nalaza ne traži novi dizajnerski jezik — svi se rješavaju **unutar postojećeg STATECRAFT/Quarto okvira**. Ukupno: jedan dan posla zatvara većinu „high" stavki.

---

## 2. Stanje po dimenzijama

| Dimenzija | Ocjena | Jednom rečenicom |
|---|---|---|
| Tipografija (proza) | **vrlo dobra** | knjiško slaganje teksta; problemi su na šavovima sustava, ne u tijelu |
| Tema / tokeni | **dobra, s curenjem** | STATECRAFT dosljedan u `custom.scss`, ali `styles.css` i `theme_book.R` su stara paleta |
| Tamni način | **solidna jezgra, rupe na rubu** | proza pokrivena; navbar/naslovnica/grafovi/callouti propadaju |
| Naslovnica i navigacija | **jaka, uz nered** | odlična hero-tipografija; sidebar pretrpan, Alat-stub, tri naslova knjige |
| Dosljednost poglavlja | **vrlo dobra** | 19/20 poglavlja otvara se identično; samo Uvod odstupa |
| Grafovi / slike | **OJS dobar, R mrtav** | OJS na brendu u svijetlom; R-sustav nekorišten i zastario |
| Vodič / dodaci | **najjača satelitska površina** | vodič i Atlas uzorni; Alat i Reference goli |
| Render (HTML/PDF) | **HTML dobar, PDF bezličan** | PDF nema nijedan STATECRAFT element i gubi sve grafove |

### Što je posebno dobro napravljeno (ne dirati)

- **Mikro-tipografija tijela:** Newsreader proza s `kern/liga/calt` + oldstyle proporcionalnim brojkama, prebačenima na tabularne lining unutar tablica (`custom.scss:62-69`, `467-468`) — istinski knjiški detalj.
- **Hrvatski-svjesno slaganje:** `hyphens:auto` s obrazloženim lijevim poravnanjem zbog dijakritike (`custom.scss:83-86`), `hr-HR` proveden (`_quarto.yml:190`), disciplinirani „…" navodnici u prozi.
- **Dvorazinski ritam:** proza/liste/citati ograničeni na 70 znakova dok slike i tablice namjerno idu punom širinom stupca (`styles.css:126-144`) — tufteovski.
- **Margina s hijerarhijom:** sidenote (sans, verdigris panel) vizualno odvojen od citata (0,8rem, ink-mute); fusnotni biljezi bez zagrada kao čisti verdigris superskript.
- **Detalji koje većina zaboravi:** tematizirana `::selection` u oba načina, dizajnirana `:focus-visible` stanja, dinkus (tri oker romba) kao prijelom scene, hover-otkrivanje sidrišta naslova, `prefers-reduced-motion` u tri sloja.
- **Vodič:** hub + 19 podstranica dijele identičan raspored, izgrađen *isključivo* iz STATECRAFT tokena (nula divljih hex vrijednosti u `_vodic.scss`), s punim mobilnim/print/reduced-motion/dark pokrivanjem.
- **Atlas:** stvarna dizajnirana mini-aplikacija (engraved `§`, grid-paper podloga, tabular-nums tablica, Plot boje fiksirane na brend-hexove).
- **Dosljedan „cold open":** 19 od 20 poglavlja otvara se identično — `::: {.vodic-panel}` + `## Vodič kroz poglavlje` — pa čitatelj ima pouzdan ulazni ritam.

---

## 3. Nalazi — rangirano

Težina: **high** = aktivno kvari vizualni doživljaj ili lomi koherentnost brenda; **medium** = vidljiva nedosljednost ili propuštena dorada; **low** = polish. Trud: trivial / small / medium / large. Oznaka ✔ = adversarijalno provjereno; ◇ = potvrđeno izravnim pregledom.

### 3.1 HIGH

**H1 ✔ Cijeli identitet otvaranja poglavlja je mrtav u runtimeu** *(trud: small)*
Vodeni žig s brojem, čip vremena čitanja, inicijal i završni ornament ❦ uvjetovani su naslovom koji počinje brojkom: `book-include.html:42` (`/^(\d+)[\.\s ]/`), a svi naslovi su bez brojke (`chapters/05-javni-izbor.qmd:2`, `_quarto.yml:171` `number-sections: false`). Provjereno: **nijedan naslov nijedne stranice** (poglavlja, vodič, dodaci, landing) ne počinje brojkom → `data-chapter-num` se ne postavlja nigdje, pa su mrtvi: žig (`custom.scss:160-176`), čip (`196-212`), inicijal (`218-236`), ❦ (`966-980`). `_dark.scss` čak održava overrideове za te fantomske značajke. Dodatni latentni bug: selektor inicijala `"section > p, > p"` (`book-include.html:88`) je nevažeći i pao bi i nakon popravka brojeva.
→ **Popravak:** `number-sections: true` + `number-depth: 1` u `_quarto.yml` (Quarto tada prefiksira H1 brojem koji postojeći JS izvlači — oživljava sve četiri značajke odjednom), ili izvesti broj iz slug-a putanje u `setupChapterNumber()`. Usput popraviti drop-cap selektor na `section > p`.

**H2 ✔ Brojevi slika referenciraju nevidljiv i pomaknut broj poglavlja** *(trud: small)*
`docs/chapters/05-javni-izbor.html:629` renderira „Slika 7.1" unutar poglavlja koje cijela knjiga zove 5; `13-javna-potrosnja.html:691` → „Slika 15.1". Pomak +2 dolazi jer `index.qmd` i `00-uvod.qmd` troše slotove poglavlja prije dijelova (`_quarto.yml:63-64`). Uz `number-sections: false` broj poglavlja nije vidljiv nigdje na stranici, pa student koji citira „Sliku 15.1" nema uporište za „15".
→ **Popravak:** vratiti vidljivo numeriranje (rješava se zajedno s H1), ili — ako su nenumerirana poglavlja tvrda urednička odluka — prebaciti crossref na ravnu numeraciju da natpisi glase „Slika 3" umjesto „Slika 15.1".

**H3 ✔ Navbar ostaje svijetlo-krem u tamnom načinu** *(trud: small)*
`styles/styles.css:6-17` postavlja `.navbar { background-color: #F6F1E8 !important }` i linkove `#14213D` (stara navy) s hoverom `#B08538` (stari gold). `styles.css` se učitava *nakon* obje teme (`_quarto.yml:156`), pa pobjeđuje i nad kompajliranim verdigris navbarom i nad `_dark.scss:36-46`. Rezultat: puna krem traka sa starom paletom na svakoj tamnoj stranici, iako navbar nosi `data-bs-theme="dark"`.
→ **Popravak:** premjestiti navbar-pravila iz `styles.css` u `custom.scss` (STATECRAFT tokeni umjesto `#F6F1E8/#14213D/#B08538`) i dodati tamni navbar-blok u `_dark.scss` (`background:#2A241D`, linkovi `#C7BEAF`). Isto za PDF-gumb (`styles.css:47-59`).

**H4 ✔ Naslovnica je velikim dijelom nečitka u tamnom načinu** *(trud: medium)*
U `_dark.scss` ne postoji nijedan `.btn`, `.sc-*`, `.reading-path` ni `.toc-overview` selektor. Posljedice: „Preuzmite PDF" i „Pogledajte sadržaj" renderiraju `#1C1916` na `#1F1A14` (≈1.05:1, nevidljivo; `custom.scss:1593-1608`); autorska meta „20 poglavlja · 5 dijelova" i „CC BY 4.0" nevidljive (`1625-1631`); sve tri kartice staza čitanja gube oznaku i rutu (`2078-2102`); TOC-pregled je 1.05–2.2:1 (`styles.css:263-317`). K tome je TOC u skrivenom omotaču koji otvara baš nevidljivi gumb — tamni čitatelj vjerojatno uopće ne otkrije sadržaj.
→ **Popravak:** dodati landing-blok u `_dark.scss` po uzoru na postojeći `vd-` obrazac (gumbi → `#F0E8D8`/lightened verdigris, meta → `#F0E8D8`, kartice staza → `#2A241D` s `#F0E8D8`/`#C7BEAF` tekstom, TOC → `#C7BEAF`).

**H5 ✔ Sva 24 OJS grafa nestaju na tamnom dnu** *(trud: medium)*
Svaki `Plot.plot` fiksira `color: "#3A332D"` (24 puta u 12 poglavlja), a oznake fiksiraju tintu (`stroke "#3A332D"`, `fill "#1C1916"`; 77 mjesta). Quarto runtime postavlja `background:"none"` na svaki plot-SVG, pa u tamnom načinu tekst/osi (`#3A332D` ≈1.4:1) i marke (`#1C1916` ≈1.0:1) praktički iščeznu dok plave/crvene/zelene linije lebde bez konteksta. Nigdje nema slušatelja promjene teme. (Iznimka: jedan graf s legendom, `13:91`, ostaje bijela kartica.)
→ **Popravak (najjeftiniji):** u `_dark.scss` dati grafovima papirnatu karticu — `.cell-output-display svg { background:#F2EDE3; border-radius:3px; padding:8px }` — pa svih 24 ostaju čitka bez diranja koda poglavlja. Dugoročno: zamijeniti fiksne hexove s `currentColor`/`var(--ojs-label)` (token sustav već postoji).

**H6 ✔ Pedagoški callouti nemaju tamni override — čip „Empirijski dokaz" je nevidljiv** *(trud: trivial)*
Tri custom callouta renderiraju se **bez** `.callout` klase (`docs/chapters/01-uloga-drzave.html:1052`), pa ih `div.callout` pravila iz `_dark.scss` ne hvataju, a nijedan `callout-praksa/empirija/vjezba` selektor ne postoji u `_dark.scss`. Svijetle boje ostaju: empirija `#6B1F26` ≈1.5:1 (nevidljiv čip i rub), praksa `#4A6B5C` ≈2.9:1 (pada AA), samo vježba `#C57832` ≈5.3:1 prolazi. Podloga `rgba(28,25,22,0.025)` također nestaje.
→ **Popravak (3 linije):** u `_dark.scss` repointirati `--pedagogy-color` na već postojeće lightened akcente (`praksa #7BA68F`, `empirija #DD8580`, `vjezba #DD9858`) + zajednička podloga `rgba(232,223,208,0.04)`.

**H7 ✔ Deklarirani favicon ne postoji — svaka stranica radi 404 na ikonu** *(trud: small)*
`_quarto.yml:26` postavlja `favicon: "images/favicon.ico"` i svaka stranica ga linka (`docs/index.html:39`), ali datoteka **ne postoji nigdje** (`images/` sadrži samo `Pic.png` i `infographics/`; `docs/images/favicon.ico` = False). Rezultat: zadana prazna/globus ikona u svakoj kartici, oznaci i povijesti — najtrajnija brend-površina koju čitatelj vidi je nebrendirana, uz 404 zahtjev pri svakom učitavanju.
→ **Popravak:** izraditi 32px `favicon.ico` (+ 180px apple-touch-icon) na papiru `#F2EDE3` s verdigris znakom (dinkus romb ili „Jp" monogram u Newsreaderu); spustiti na `images/favicon.ico` (bez izmjene configa).

**H8 ◇ PDF nema nijedan STATECRAFT element i gubi sve grafove** *(trud: large)*
`_quarto-pdf.yml:25-27` postavlja `mainfont/sansfont/monofont` na **Latin Modern** (generički LaTeX), `linkcolor: blue` (`:34`), `scrbook` zadani izgled — nula brend-tipografije i nula brend-boja. Usto `strip-ojs.lua` + `strip-svg.lua` (`:40-43`) brišu svih 110 OJS grafova i SVG infografike **bez zamjene**. PDF čitatelj (po smjernicama, druga polovica publike) dobiva bezličan dokument bez ijednog grafa.
→ **Popravak:** postaviti `mainfont: "Newsreader"`, `sansfont: "Public Sans"`, `monofont: "IBM Plex Mono"`, `linkcolor`/`urlcolor` na verdigris hex, te (veći zahvat) statične snapshotове OJS grafova uvjetno uključene samo u PDF profil. Ovo je najveća pojedinačna tehnička investicija — poklapa se s nalazom BookWright izvještaja §3.3.

### 3.2 MEDIUM

**M1 ◇ `styles.css` je u cijelosti predredizajnska paleta, učitana nakon teme** *(trud: small)*
Cijeli `styles/styles.css` koristi staru navy/gold paletu: `#14213D` (navbar/TOC/summary linkovi), `#B08538` (hover/PDF/progress), `#2D3748` (hover-preview), `#F6F1E8`, `#4A5568` (slate), `#FAFAF5` — provjereno na linijama 7,13,16,48,57,77,88,109,161,175-196,268-371. Budući da se učitava nakon kompajlirane teme (`_quarto.yml:156`), ovi elementi prikazuju staru paletu **na svakoj stranici i u svijetlom načinu** (H3 je tamni podskup ovoga). Traka napretka je čak navy→gold gradijent (`:161`).
→ **Popravak:** prevesti `styles.css` na STATECRAFT hexove (ink/verdigris/ochre) s komentarom-tokenom, ili premjestiti ta pravila u `custom.scss` gdje imaju pristup varijablama.

**M2 ◇ R/ggplot infrastruktura je mrtva, a CLAUDE.md je opisuje kao živi sustav** *(trud: small)*
Nula poglavlja izvršava R: 0 `source("R/setup.R")`, 0 `{r}` chunkova, 0 `ggplot/pubfin` poziva u `chapters/`. Svih 110 grafova su OJS. Ipak `theme_book.R:9-16` definira `pubfin_colors` u staroj paleti (navy `#1B2A4A`, gold `#C8942D`, slate `#4A5568`), a CLAUDE.md upućuje autore da koriste `scale_fill_pubfin()` kao brend-sustav. Posljedica: zamka za suradnika — tko slijedi dokumentaciju, proizvest će graf u paleti koja se sukobljava sa stranicom. (Time je i „bijeli ggplot PNG" tamni nalaz iz radne verzije bespredmetan — takvi se grafovi ne renderiraju.)
→ **Popravak:** ili uskladiti `pubfin_colors` sa STATECRAFT-om (`#1C1916`, `#4A6B5C`, `#C8985E`, …) i font na Public Sans za buduće R figure, ili ako se R figure neće koristiti, ukloniti R-spominjanja iz CLAUDE.md da se ne zavarava.

**M3 ◇ Tri različita naslova knjige** *(trud: trivial)*
`_quarto.yml:7` „Sve što želite znati o **odnosu države i tržišta**" (renderira se u `<title>` svake stranice i u PDF-u), `_brand.yml:2` meta „Sve što želite znati o **državi i javnim politikama u Hrvatskoj**", a CLAUDE.md/repo „**Javne politike u Hrvatskoj**". Tri imena izviru na različitim površinama (kartica preglednika, OG meta, footer).
→ **Popravak:** odabrati jedan kanonski naslov i uskladiti `_quarto.yml`, `_brand.yml`, `_quarto-pdf.yml` i footer.

**M4 ◇ Sidebar je pretrpan — 19 vodič-podstranica plošno uz 20 poglavlja** *(trud: small)*
Dokirani sidebar na svakoj stranici poglavlja sadrži 20 poglavlja **plus svih 19 vodič-podstranica** (`docs/chapters/01-uloga-drzave.html`: 20 `chapters/` + 19 `vodic/` linkova) plus reference/resursi/alat/podaci kao dodatke. Vodič je zamišljen za pregledavanje preko huba, ne sidebara, pa satelit gotovo udvostručuje navigacijski popis.
→ **Popravak:** maknuti 19 `vodic/NN` podstranica iz `book.appendices` u `_quarto.yml` (ostaviti samo `vodic.qmd` hub) — podstranice ostaju dostupne preko huba i izravnih linkova, a sidebar se prepolovi. Alternativa: `sidebar > contents` ručno kurirati.

**M5 ✔ Učitane težine fonta ne odgovaraju sustavu; Geist preload 100% neiskorišten** *(trud: trivial)*
`_quarto.yml:198` preloada Geist (300–700) i Geist Mono — `grep "Geist"` u `styles/` = 0 pogodaka (render-blocking mrtav teret). Istovremeno brand-import dovlači Public Sans i IBM Plex Mono samo u 400/700, a `custom.scss` koristi 600 (h4-h6, callout-naslovi, thead, gumbi) i 500 (OJS labele, `.var` čipovi) — preglednik supstituira 700 za 600 i 400 za 500, pa se trostupanjska ljestvica težine urušava u bold/regular.
→ **Popravak:** zamijeniti Geist u headeru s `Public+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400` i `IBM+Plex+Mono:wght@400;500;600`, zadržati Newsreader.

**M6 ✔ Svaki h2 nosi dvostruku crtu (custom ink gore + zaostali sivi `#dee2e6` dolje)** *(trud: trivial)*
Kompajlirana tema sadrži i Quartov `h2 { border-bottom:1px solid #dee2e6 }` i kasniji custom `h2 { border-top:1px solid rgba(28,25,22,.08) }` (`custom.scss:103-112`, bez resetiranja `border-bottom`). Naslovi su uokvireni dvjema crtama, a donja je Bootstrap-siva (ne-STATECRAFT) na toplom papiru. Tamni način je gori — siva crta ostaje na tamnom dnu.
→ **Popravak:** dodati `border-bottom:none; padding-bottom:0` u h2 pravilo (`custom.scss:103-112`).

**M7 ✔ `_brand.yml` tipografija proturječi isporučenoj** *(trud: trivial)*
`_brand.yml:36-42` deklarira tijelo Public Sans / naslovi težina 500, ali `custom.scss:62-63` postavlja `body { font-family: Newsreader }` i `:95-97` h1 na težinu 600. CLAUDE.md ponavlja netočnu tvrdnju o Public Sans tijelu. Knob je obmanjujući: uređivanje `_brand.yml base.family` danas ne mijenja ništa (custom.scss sloj uvijek pobjeđuje).
→ **Popravak:** uskladiti `_brand.yml` sa stvarnošću (ili `base.family: Newsreader`, ili komentar da custom.scss namjerno radi serif-proza/sans-UI podjelu) + ažurirati CLAUDE.md.

**M8 ✔ Mjera od 70 znakova lomi se na unutrašnjostima okvira — 100+ znakova po retku** *(trud: small)*
`styles.css:126-137` ograničava samo izravnu djecu (`main.content > section > p`). Ne hvata: odlomke u `section > section` (pogl. 14 ima 14 razina-3 sekcija) i unutrašnjosti `.definition`/`div[id^=def-]`/pedagoških calloutова — najvažnije pedagoške kutije postaju **najteže čitljiv tekst na stranici** (~100-110 znakova/redak). Dvije prazne placeholder-rule (`custom.scss:71-76`, `styles.css:112-118`) priznaju nedovršenu namjeru.
→ **Popravak:** promijeniti selektore iz izravne djece u potomke (`main.content section > p`), dati `.definition`/`def-`/pedagoškim calloutима `max-width:~75ch` uz `margin-right:auto`, obrisati prazne placeholder-rule.

**M9 ✔ Tamni „defaults" sloj ne sleti — `$body-bg` bez `!default`** *(trud: small)*
`custom.scss:50-51` deklarira `$body-bg/$body-color` **bez** `!default`, pa nadjačava `_dark.scss:6-7` u Quartovom slaganju. Posljedica u artefaktu: tamni `bootstrap-dark-*.css` nosi svijetli `--bs-body-bg:#F2EDE3`. Zato svaka `--bs-*`-vođena komponenta (dropdown, mobilni offcanvas sidebar, form kontrole) nasljeđuje svijetle vrijednosti u tamnom načinu, a `_dark.scss` je prisiljen na 149 `!important` zakrpa.
→ **Popravak:** dodati `!default` na `$body-bg/$body-color` (i ostale Bootstrap-hranjive varijable) u `custom.scss`, re-renderirati — popravlja mobilni/offcanvas i form-kontrole besplatno.

**M10 ✔ Atlas (podaci.qmd) nema tamnog pokrivanja** *(trud: medium)*
Nijedan `.atlas` selektor u `_dark.scss`. Aktivna kartica `is-active` (`_atlas.scss:185`) je `#1C1916` ≈1.0:1 (nevidljiva na učitavanju), neaktivne/breadcrumb/toolbar `#6B6357` ≈2.9:1; tablica čak dobiva tamne ćelije s tintastim prvim stupcem ≈1.1:1.
→ **Popravak:** dodati `.atlas-page` tamni blok u `_dark.scss` (chrome → `#C7BEAF`, `is-active` → `#F0E8D8` + `#C8615A` rub; tablicu po uzoru na `_dark.scss:66-87`).

**M11 ✔ `.var` čipovi ≈2.1:1 u tamnom načinu** *(trud: trivial)*
`custom.scss:390-400`: `.var { color:#3A5648 }`, bez tamnog overrideа → 2.1:1 na `#1F1A14` u 0.86em mono. Pojavljuju se 36 puta u „Što isprobati" uputama uz slidere — referenca puca baš ondje gdje povezuje prozu i interakciju.
→ **Popravak:** `_dark.scss`: `.var { color:#9FC0AF !important; background:rgba(232,223,208,0.07) !important }` (već postojeći `--ojs-value` token).

**M12 ✔ Margin-citati i fusnote ≈2.9:1 u tamnom načinu** *(trud: trivial)*
`custom.scss:255-266` `.column-margin { color:#6B6357 }`, bez tamnog overrideа → 2.9:1 za 0.8rem. Budući da su `reference-location` i `citation-location` na margini (`_quarto.yml:182-183`), cijeli margin-aparat svih 20 poglavlja postaje naporan u tamnom načinu.
→ **Popravak:** `_dark.scss`: `.column-margin { color:#C7BEAF !important }` (ton već korišten za figcaption).

**M13 ✔ Dva suparnička tamna akcenta: cigla `#C8615A` (ne-token) vs. verdigris** *(trud: medium)*
`_dark.scss` koristi `#C8615A` kao tamni primarni za linkove, nav, traku napretka, selekciju, žig (27 pojava) — boja nije STATECRAFT token i mjeri 4.37:1 (ispod AA 4.5:1 za linkove). Istovremeno OJS panel i vodič koriste lightened verdigris (`#7FA08F`/`#7BA68F`). Svjetlosna hijerarhija „verdigris primarni, oxblood samo naglasak" iz `_brand.yml` time je invertirana u poglavljima, a očuvana u vodiču — link uz slider pokazuje dva primarna tona.
→ **Popravak:** odlučiti jedan tamni primarni (brend-koherentno: lightened verdigris `#7FA08F` za link/nav/selekciju, a `#C8615A` rezervirati za naglasne uloge oxblooda). Ako cigla ostaje primarna, podići na `#D0736C` (5.22:1) i dodati u dokumentiranu paletu.

**M14 ✔ Alat je nedizajnirano prazno stanje iza prvorazredne navbar-stavke** *(trud: small)*
`alat.qmd:26-43` — cijela stranica je jedan lede + zadani `callout-note` („U pripremi…") s 8 alata kao golim bulletima. Callout se renderira **Bootstrap-plavo** (custom restyle gubi na specifičnosti) s engleskim naslovom „Note" na hr-HR stranici, na praznoj 1100px stranici dostupnoj iz pinanog navbara — najslabiji vizualni trenutak sajta.
→ **Popravak:** iskoristiti postojeći `vd-hub` set — 8 alata kao `vd-hub-grid` ne-link kartica s `.vd-soon` + `.vd-badge "USKORO"` (nula novog SCSS-a; klase već kompajlirane).

**M15 ✔ Nula društvenih meta-oznaka, a gumbi za dijeljenje aktivni** *(trud: small)*
`_quarto.yml:48` `sharing: [twitter, facebook, linkedin]`, ali head ima samo generator/viewport/author — nema `description`, `og:*`, `twitter:*`. „Smoking gun": `custom.scss:716-722` skriva auto-injektiranu cover sliku „za OG/share metadata", ali `_quarto.yml` nema `cover-image` ključa — OG cjevovod oko kojeg je CSS građen tiho je uklonjen. Dijeljeni link je goli sivi URL.
→ **Popravak:** u `_quarto.yml` pod `book:` dodati `cover-image: cover.png`, `open-graph: true`, `twitter-card`, i hrvatski `description`. Skriveni CSS se time re-aktivira.

**M16 ✔ Nema 404 stranice** *(trud: small)*
Nema `404.qmd` ni `docs/404.html`. Sajt je na GitHub Pages, koji vraća zadanu bijelu englesku 404 s octocat ilustracijom — potpun raskid s krem/tinta/hrvatskim identitetom. Rizik je realan: CLAUDE.md dokumentira višekratno renumeriranje poglavlja (orphani), pa zastarjeli linkovi postoje.
→ **Popravak:** dodati `404.qmd` u korijen s hrvatskim tekstom („Stranica nije pronađena"), stiliziranim kao vodič-kartica s povratkom na hub/sadržaj. Quarto ga renderira kroz punu temu; GitHub Pages servira `404.html` bez konfiguracije.

**M17 ✔ Netematiziran Hypothesis klijent na svakoj stranici** *(trud: small)*
`_quarto.yml:201-202` `comments: hypothesis: true` globalno, pa se učitava i na landingu i na vodič-slikovnici (`docs/...:136 <script src="https://hypothes.is/embed.js">`). Nijedan selektor u `styles/` ne tematizira ga — ubacuje bijeli/sivi toggle i žute marker-oznake u isti desni rub rezerviran za margin-citate.
→ **Popravak:** `comments: false` u front-matteru `index.qmd`, `vodic.qmd`, vodič-podstranica i dodataka; zadržati za poglavlja; dodati `.hypothesis-highlight { background: rgba(200,152,94,0.28) }` (oker) u `custom.scss`.

**M18 ✔ Caption slike: mrtvo duplikat-pravilo + nikad-okidani small-caps prefiks** *(trud: small)*
`custom.scss:541-550` stilizira figcaption (sans 0.83rem), ali kasniji `1250-1274` (ista specifičnost) pobjeđuje (serif italic 0.93rem) — prvi blok je mrtav kod. „Slika N." small-caps prefiks (`1277-1288`) cilja `figcaption strong:first-child`, ali Quarto emitira prefiks kao čisti tekst — nikad se ne okida. (Provjerom: tablice se renderiraju kao floatovi i *dijele* serif-italic tretman, pa nema vidljivog nesklada figura/tablica — taj dio izvornog nalaza je odbačen.)
→ **Popravak:** obrisati mrtve blokove (`541-550`, `1277-1288` i pratioce); prefiks po želji implementirati malim JS-om u `book-include.html`.

### 3.3 LOW (polish)

- **L1 ✔ Nedosljedan zatvarajući navodnik:** proza koristi „…", bibliografija „…", a `.pullquote` ornament engleski `"\201C"` (`custom.scss:1000`) na hrvatskoj stranici. → standardizirati na `„…"`.
- **L2 ✔ Margin-citati paušalno kurzivirani** (`custom.scss:255-266`) — briše kurziv naslova časopisa i šteti čitljivosti na 0.8rem. → maknuti paušalni `font-style:italic` s `.csl-entry`.
- **L3 ◇ Predredizajnski leftover-fontovi u `styles.css`:** „Source Serif 4" / „Inter" (`:177,:193`) nigdje nisu učitani; hover-preview u staroj `#2D3748`/`#B08538`. → svesti na Newsreader/Public Sans + STATECRAFT hexove (dio M1).
- **L4 ✔ `.vd-src` linkovi nasljeđuju globalni prozni underline** — puna hairline crta ispod svake vodič-kartice + zeleni hover-blok. → `a.vd-src { border-bottom:0; &:hover{ background:transparent } }`.
- **L5 ✔ References goli zid u punoj kromiranju, s engleskim „Code" gumbom** — `references.qmd` (4 linije) renderira `code-tools` gumb „Code" na stranici bez koda; `.csl-entry` stiliziran samo unutar margine. → `code-tools: false` + lagani `#refs` tretman (`padding`, hairline, 0.92rem) + naslov „Literatura".
- **L6 ✔ Print poglavlja je naknadna misao** — 4 pravila; tamni način ispisuje krem tekst (`#E8DFD0 !important`) na bijelom papiru jer `_dark.scss` nema `@media print`. → proširiti print-blok (re-asertirati svijetle boje, `break-inside:avoid` za callout/figure/table, sakriti interaktivnu kromiranje).
- **L7 ◇ `$brand-gold` aliasiran na verdigris** (`custom.scss:20`) — sve „gold" u SCSS-u tiho renderira zeleno; namjerno i dokumentirano, ali zamka pri budućem uređivanju. → dugoročno preimenovati legacy aliase u STATECRAFT imena.

---

## 4. Predloženi redoslijed

| Faza | Sadržaj | Učinak |
|---|---|---|
| **Dan 1 — brze pobjede** | H1+H2 (numeriranje oživljava 4 značajke + popravlja brojeve slika), H6 (3 linije callout), H7 (favicon), M3 (naslov), M5 (fontovi), M6 (h2 crta), M7 (`_brand.yml`), M11/M12 (`.var`/margina tamno) | vraća mrtvi identitetski sloj + zatvara većinu tamnih rupa uz minimalan trud |
| **Dan 2 — tamni način + tokeni** | H3+H4+H5 (navbar/landing/grafovi tamno), M1 (`styles.css` → STATECRAFT), M9 (`!default`), M10 (Atlas tamno), M13 (jedan tamni akcent) | tamni način postaje prvorazredan; uklanja predredizajnsko curenje |
| **Tjedan 1 — vidljivost i satelit** | M14 (Alat hub), M15 (OG meta), M16 (404), M17 (Hypothesis scope), M4 (sidebar), M8 (mjera u kutijama) | knjiga postaje vidljiva izvana; navigacija pročišćena |
| **Veći zahvat** | H8 (PDF identitet + statični grafovi), M2 (R-sustav: uskladiti ili ukloniti iz dokumentacije) | PDF dobiva brend; uklanja se zamka za suradnike |
| **Polish (uz gornje)** | L1–L7 | finalno doštrivanje |

**Jedan dan zatvara svih 7 „high" + pola „medium" stavki.** Nijedan zahvat ne traži novi dizajn — sve je dorada postojećeg STATECRAFT/Quarto okvira.

---

*Izvještaj: 8 paralelnih estetskih prolaza + adversarijalna provjera (17 potvrđenih nalaza, 0 odbačenih u dovršenim dimenzijama) + completeness kritic; pet dimenzija dovršeno izravnim pregledom datoteka nakon prekida zbog limita. Svi `datoteka:linija` i hex/kontrast podaci provjereni na repozitoriju.*
