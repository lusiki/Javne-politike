# Strukturna revizija knjige — sedam dimenzija

Datum: 10. lipnja 2026. Revizija pokrenuta na zahtjev za provjerom sedam aspekata
rukopisa. Audit proveden čitanjem svih 20 poglavlja u cijelosti (5 paralelnih
agenata) plus inspekcija renderiranog HTML-a i SCSS-a za problem prelijevanja
margine.

> **Status (ažurirano 10. lipnja 2026, nakon zahvata).** Izvorni dokument bio je
> *nalaz i plan*. Većina jeftinih i srednjih stavki sada je **obavljena i
> commitana** (SCSS margine, tri siroče-definicije, ch12 infografika, duplikat-
> captioni, mostovi luka unatrag/unaprijed, svih ~13 „Što isprobati." blokova,
> potpuni STYLE.md prelet ch14). Po dimenzijama je status označen oznakom
> **✅ RIJEŠENO / ⏳ ODGOĐENO / 👤 KOAUTORSKO** uz svaki nalaz. Otvoreno ostaje:
> patuljasta potpoglavlja (dim. 4), neujednačena pokrivenost definicija (dim. 1),
> puni epilog ch19 — plus koautorska hrpa (hrvatske empirije). Detalji u
> redoslijedu korekcija na dnu.

---

## Kako čitati izvještaj

Sedam traženih dimenzija:

1. **Definicije u izdvojenim blokovima** — ima li svako poglavlje (osim uvoda i
   zaključka) formalne definicije.
2. **Suptilna integracija definicija u tekst** — leži li definicija unutar
   argumenta ili stoji kao izolirana kutija koju tekst tek prepričava.
3. **Luk između poglavlja i potpoglavlja** — tekstualni most koji povezuje.
4. **Ravnoteža naslova/podnaslova i duljina potpoglavlja** — nema patuljastih
   potpoglavlja od jednog-dva odlomka; homogena očekivana struktura.
5. **OJS interaktivni grafovi** — numeriranje i homogen tretman (opis + upute
   kako rukovati grafom) kroz cijelu knjigu.
6. **Infografike** — uvedene i opisane u tekstu kad je primjereno.
7. **Prelijevanje tablica i callouta preko desne margine** — CSS problem.

---

## Sažetak stanja (po dimenzijama)

| # | Dimenzija | Stanje | Glavni nalaz |
|---|-----------|--------|--------------|
| 1 | Definicije u blokovima | **Dobro · ⏳ ostatak odgođen** | Sva 18 sadržajna poglavlja imaju `{#def-}` blokove; uvod (3) i zaključak/ch19 (5) ih također imaju. Pokrivenost neujednačena: ch14 (najveće poglavlje) ima samo 1, ch18 (metodsko) samo 1, ch11 samo 2. **Neujednačenost svjesno odgođena (opcijska).** |
| 2 | Suptilna integracija | **✅ siročići riješeni** | Najbolje: ch08, ch09, ch17, ch19. Sustavni obrazac „def-blok pa rečenica koja ga doslovno prepričava" javlja se u ch02, ch04, ch12, ch15, ch00 (mekše, neobrađeno). **Tri prava siročića RIJEŠENA: ch10 ovisnost-o-putanji uplesteno, ch12 kombinacija-instrumenata premješteno u odjeljak „Kombiniranje", ch13 javni-dug premješteno uz deficit-bias.** |
| 3 | Luk između poglavlja | **✅ mostovi dodani** | Bila najslabija dimenzija. **Mostovi unatrag dodani: ch06, ch09, ch10, ch12, ch13, ch14, ch15, ch18.** **Mostovi unaprijed (Sažetci): ch04, ch13, ch15, ch19.** ch13↔ch14 i ch15↔ch16 šavovi povezani; **ch19 Sažetak sada zatvara cijelu knjigu** (povratak na uvodni okvir). Puni epilog ch19 ostaje veći, opcijski zahvat. |
| 4 | Ravnoteža i duljina | **⏳ ODGOĐENO (odluka korisnika)** | Patuljasta potpoglavlja: **ch02 (6 jednoodlomačnih `###` ispod grafova), ch05 (2 stub `##`/`###`), ch15 (cijela tipologija od 8 neuspjeha promovirana u `##`, „Regulatorni neuspjesi" = 1 odlomak), ch13 „Hrvatska i EU" (placeholder, nedovršeno), ch14 dva tanka `###`, ch16/ch18 po dva tanka odjeljka.** Korisnik: „izvještaj samo, odluka kasnije" — degradirati-u-podebljano vs. zadebljati još nije odlučeno. |
| 5 | OJS grafovi | **✅ tretman homogeniziran** | 110 OJS blokova = ~24 grafa-klastera. Svi imaju `label: fig-` i `fig-cap`. **Svih ~13 grafova kojima je nedostajao „Što isprobati." blok sada ga ima** (ch01, ch02×6, ch03, ch04, ch05, ch06, ch09, ch13, ch15, ch18, ch19). **ch14 (8 grafova) prošao potpuni STYLE.md prelet:** „Kako čitati graf." stopljeno u uvodne odlomke, „Što isprobati." prepisani bez dvotočja/em-crtica. Cijela knjiga sada slijedi obrazac uvodni-odlomak + graf + „Što isprobati.". |
| 6 | Infografike | **✅ siroče riješeno** | Statične infografike: ch01 (tri-funkcije), ch05 (ključne-ideje), ch12 (trzisni-neuspjesi), ch14 (vrste-poreza). **ch12 fig-trzisni-neuspjesi dobio uvodni odlomak** — više nije siroče. Sve infografike sada uvedene tekstom. |
| 7 | Prelijevanje margine | **✅ SCSS popravak dodan** | Uzrok: tablice (`max-width:100%` bez `overflow-x:auto`), OJS SVG-ovi (fiksna piksel-širina bez clamp-a), callout/def kutije (`max-width:70ch` bez `overflow-x`). **Containment blok dodan u `styles/custom.scss`** (overflow-x scroll na tablicama, max-width:100% na SVG-ovima, clamp na callout/def kutijama, overflow-wrap:anywhere). |

---

## Dimenzija 1 — Definicije u izdvojenim blokovima

Status: **zadovoljavajuće.** Knjiga koristi `{#def-}` divove (ne callout-e) za
formalne definicije. Konvencija je dosljedna i ispravna.

Pokrivenost po poglavljima (broj `{#def-}` blokova):

- ch00 (uvod): 3 · ch01: 2 · ch02: 5 · ch03: 5 · ch04: 5 · ch05: 2 · ch06: 5
- ch07: 5 · ch08: 5 · ch09: 6 · ch10: 5 · ch11: **2** · ch12: 5 · ch13: 3
- ch14: **1** · ch15: 5 (ali samo 4 od 8 tipova neuspjeha) · ch16: 5 · ch17: 5
- ch18: **1** · ch19: 5

**Neujednačenost koju vrijedi razmotriti (nije hitno):**
- **ch14** (porezi, najveće poglavlje) ima samo 1 def-blok premda definira porezni
  klin, Lafferovu krivulju, progresivnost itd. samo podebljano u tekstu.
- **ch18** (CBA/evaluacija, metodsko) samo 1, premda RCT, DiD, RDD, QALY,
  diskontnu stopu nigdje formalno ne uokviruje.
- **ch11** samo 2 (fiskalna pravila, vjerodostojnost neuokvireni).
- **ch15** daje def-blok za 4 od 8 paralelnih tipova neuspjeha — ili svih osam ili
  nijedan, radi simetrije.

---

## Dimenzija 2 — Suptilna integracija definicija

Status: **uglavnom dobro.** Tražili ste da definicija leži unutar potpoglavlja, a
ne kao „jedna rečenica u tekstu pa izdvojena definicija". Većina blokova to
zadovoljava — pojam se koristi neposredno prije ili poslije bloka.

**Pravi siročići (popraviti — tekst uz blok ne koristi pojam):**
- **ch10 `#def-ovisnost-o-putanji` (L101)** — okolni tekst govori o „duboko
  trajnim" učincima ali ne imenuje „ovisnost o putanji".
- **ch12 `#def-kombinacija-instrumenata` (L72)** — blok stoji na kraju odjeljka
  „Subvencije", a pojam se koristi tek u odjeljku „Kombiniranje instrumenata"
  (L108), 35 redaka niže. Strukturno premješten.
- **ch13 `#def-javni-dug` (L169)** — ubačen u odjeljak o usporedbi zemalja bez
  ijedne susjedne uporabe pojma.

**Sustavni obrazac „blok pa doslovno prepričavanje" (mekše, ali vrijedi pročešljati):**
- ch02 `#def-trzisni-neuspjeh` (blok + L20 + L22 = ista stvar triput),
  `#def-prirodni-monopol` (L797 gotovo doslovno ponavlja blok).
- ch00 `#def-javne-politike` (L9 blok, L13 gotovo doslovno isto).
- ch04, ch12, ch15 imaju blaže verzije istog (def-blok pa „Drugi/Treći oblik je…").

**Najbolji primjeri (uzor):** ch08 (svaki blok praćen rečenicom koja imenuje i
koristi pojam), ch09, ch17, ch19.

**Sporedno:** ch03 `#def-opadajuca-granična-korisnost` ima ne-ASCII znakove u id-u
(č/ć) — može zasmetati cross-refovima; preimenovati u ASCII.

---

## Dimenzija 3 — Luk između poglavlja i potpoglavlja

Status: **najslabija dimenzija; sustavno popravljiva.** Ovo je najveći nalaz
revizije. Tražili ste „tekstualni most koji povezuje". Knjiga ima dvije razine
problema.

### 3a. Otvaranja poglavlja (most unatrag)

Jaka, eksplicitna otvaranja koja imenuju prethodno poglavlje:
ch02, ch03, ch04, ch05, ch07, ch11, ch16, ch17.

Hladna otvaranja bez mosta unatrag:
**ch06, ch09, ch10, ch12, ch13, ch14, ch15, ch18, ch19.**

Posebno upadljivo: **ch12 je otvarač DIO IV** bez prijelaza s kraja DIO III, a
**ch14 počinje hladno** odmah iza ch13 koji također ne predaje naprijed — pa je
šav rashodi→porezi nepovezan s obje strane.

### 3b. Sažetci (most unaprijed)

**Gotovo nijedan Sažetak ne predaje štafetu sljedećem poglavlju.** Sažetci
sažimaju vlastito poglavlje i staju. Najvidljiviji propušteni prijelazi:
- ch04 → DIO II (javni izbor) — granica dijela, bez mosta.
- ch13 (rashodi) → ch14 (porezi) — prirodni par, nepovezan.
- ch15 (neuspjesi) → ch16 (NJM kao odgovor) — nepovezan.
- **ch19 ne zatvara knjigu** — Sažetak je sažetak poglavlja o reformama, nema
  retrospektive kroz pet dijelova niti povratka na uvodno „kakva država, za koje
  probleme". (Ovo je već zabilježeno u smjernicama kao prijedlog epiloga.)

### 3c. Hladni početci odjeljaka unutar poglavlja

Najčišći unutarnji lukovi: ch02 (formula „Prvi/Drugi/Treći oblik…"), ch15
(„Prvi…Osmi oblik"), ch16/ch17 („Prva/Druga dimenzija"). Najviše hladnih
početaka odjeljaka: ch03 (Utilitarizam, Robni egalitarizam), ch12 (katalog
instrumenata), ch18 (Primjeri primjene), ch14 (klasični odjeljci).

### Implementabilnost

Visoka i jeftina. Most unatrag = jedna rečenica na početku poglavlja koja imenuje
temu prethodnog (konvencija S6 u STYLE.md već propisuje formulu „u poglavlju o…").
Most unaprijed = jedna do dvije rečenice na kraju Sažetka. ch19 epilog je veći
zahvat (već predložen u smjernicama). Sve ostalo je ~18 rečenica unatrag + ~18
naprijed, bez diranja sadržaja.

---

## Dimenzija 4 — Ravnoteža naslova i duljina potpoglavlja

Status: **mješovito.** Tražili ste da nema potpoglavlja s jednim-dva odlomka i da
struktura bude homogena.

**Najbolje balansirana poglavlja (bez patuljaka):** ch11, ch17, ch00, ch19, ch03,
ch04 (zadnja dva plosnata `##` bez `###`, svi odjeljci 3–6 odlomaka).

**Poglavlja s patuljastim potpoglavljima (popraviti):**

- **ch02** — svih **6 `###` ispod grafova su jednoodlomačni stubovi** (Javno dobro
  i švercer, Negativna/Pozitivna eksternalija, Tržište limuna, Moralni hazard,
  Monopol). Svaki samo uvodi graf. Preporuka: degradirati u podebljane uvodnike
  pod roditeljskim `##` ili podebljati.
- **ch05** — `## Pravila igre vs. politički ishodi` (1 odlomak, samo pokazivač na
  ch11) i `### Birokrati i borba za proračun` (1 odlomak, pokazivač na ch09).
- **ch15** — **cijela tipologija od 8 neuspjeha promovirana na `##` razinu**;
  „Regulatorni neuspjesi" = 1 odlomak. Čita se kao popis stubova. Preporuka:
  degradirati osam tipova u `###` pod jednim roditeljem ili podebljati.
- **ch13** — `## Javna potrošnja u Hrvatskoj i EU` je **placeholder s callout-om
  „Ovo se potpoglavlje dovršava"** — nedovršeno, čeka koautorske hrvatske podatke.
- **ch14** — `### Proporcionalni…` i `### Specifični i ad valorem porezi` su
  stub-`###` (svaki par rečenica).
- **ch16** — `## Građanin kao korisnik…` i `## Agencifikacija…` (po 2 odlomka).
- **ch18** — `### Cilj i uloga` i `### Vrste evaluacije` (po 2 odlomka).
- **ch09** — tri jednoodlomačna back-ref `###` (Rentijerstvo, Reg. zarobljavanje,
  Proračunski ciklus) — namjerni pokazivači, ali se čitaju kao stubovi.

**Neravnoteže duljine:** ch09 (Niskanen 9 odlomaka vs stubovi od 1), ch10
(„dugoročni razvoj" 11 odlomaka vs odjeljci od 2), ch14 (teorija optimalnog
oporezivanja golema vs rana dva `###` patuljasta).

---

## Dimenzija 5 — OJS interaktivni grafovi (numeriranje + homogen tretman)

Status: **numeriranje nepotpuno; tretman izrazito nehomogen.** Ovo je, uz luk,
glavni nalaz.

### Brojke

110 `{ojs}` blokova kroz 12 poglavlja, ali to su **klasteri**: jedan graf =
kontrole + reaktivne varijable + crtajući blok. Stvarni broj grafova ~24. Crtajući
blok obično nosi `//| label: fig-…`.

Grafovi po poglavlju (klasteri): ch01:1, ch02:6, ch03:1, ch04:1, ch05:1, ch06:1,
ch09:1, ch13:1, ch14:8, ch15:1, ch18:1, ch19:1. (ch07, ch08, ch10, ch11, ch12,
ch16, ch17 nemaju nijedan interaktivni graf.)

### Numeriranje

Svi crtajući blokovi koji su pregledani **imaju** `//| label: fig-…` i
`//| fig-cap:` i `//| fig-alt:`. Dakle numeriranje (Slika N) i cross-ref rade.
Nema nenumeriranih grafova — ranija sirova brojka „86 nelabeliranih" bila je
artefakt brojanja pojedinačnih blokova umjesto klastera.

### Homogen tretman — ovdje je problem

**Samo ch14 ima homogen, potpun tretman.** Svaki od 8 grafova u ch14 nosi:
1. uvodni odlomak prije grafa (što graf pokazuje),
2. blok „**Kako čitati graf.**" (orijentacija),
3. blok „**Što isprobati.**" (numerirani eksperimenti s klizačima).

**Svi ostali grafovi (ch01, ch02×6, ch03, ch04, ch05, ch06, ch09, ch13, ch15,
ch18, ch19) NEMAJU „Što isprobati." blok.** Upute kako rukovati grafom u tim
poglavljima ili ne postoje, ili su izmještene u završni `callout-vjezba` daleko od
grafa.

Napomena STYLE.md: vodič kaže da se „Kako čitati graf" *ne* koristi kao zaseban
pasus nego se stapa u uvodni odlomak, a „Što isprobati." je sankcioniran blok
poslije grafa. Dakle ciljni homogeni obrazac po STYLE.md je: **uvodni odlomak
(uključuje orijentaciju) + graf + „Što isprobati." blok.** ch14 je djelomično
iznad toga (ima i zaseban „Kako čitati graf."), ostali su ispod (nemaju ništa
poslije grafa).

### Sporedni nalazi
- **ch09 L139 i ch19 L117**: statična *italic* duplikat-caption koja ponavlja
  `fig-cap` doslovno — redundantno, obrisati (ostatak ranijih duplikata koje je
  panel iz lipnja već čistio).
- Uvodni odlomak prije grafa „slab" (graf slijedi callout/def umjesto pravog
  uvodnog pasusa): ch03 fig-lorenz, ch14 fig-mrtvi-teret-skaliranje i
  fig-medutemporalna-stednja, ch18 fig-npv-diskontna, ch05 fig-paradoks.

### Implementabilnost — ✅ OBAVLJENO
Standardizacija je bila mehanička ali sadržajna: za ~13 grafova trebalo je napisati
„Što isprobati." blok (2–4 numerirana eksperimenta vezana uz klizače tog grafa) i,
gdje nedostaje, jednu uvodnu rečenicu. **Učinjeno za sve grafove**; ch14 je poslužio
kao predložak tona i oblika, a sam je potom prošao potpuni STYLE.md prelet (8
blokova svedeno na sankcionirani obrazac, bez dvotočja/em-crtica/viška podebljanja).

---

## Dimenzija 6 — Infografike

Status: **dobro, uz jednu iznimku.** Statične infografike (SVG) postoje u 4
poglavlja i sve su uvedene tekstom osim jedne.

- ch01 `#fig-tri-funkcije` — uvedena (odjeljak Musgraveov okvir). OK.
- ch05 `#fig-javni-izbor-kljucne-ideje` — uvedena rečenicom L22. OK.
- ch14 `#fig-vrste-poreza` — uvedena L49 + 4 pod-odjeljka razrađuju. OK.
- **ch12 `#fig-trzisni-neuspjesi` (L30) — SIROČE.** Stoji između odlomka o
  NATO-okviru (L28) i odjeljka „Porezi" (L32), a prikazuje preslikavanje
  tržišni-neuspjeh → instrument, što je treća tema. Treba uvodni odlomak koji
  imenuje što slika pokazuje i zašto je na tom mjestu.

Vaš kriterij („u pravilu da, iznimno ne ako nije nužno") je zadovoljen svuda osim
ch12, gdje uvod nedostaje a slika je netrivijalna pa ga zaslužuje.

---

## Dimenzija 7 — Prelijevanje tablica i callouta preko desne margine

Status: **dijagnosticirano, popravljivo u SCSS-u bez diranja sadržaja.**

### Uzrok

Layout je `page-columns page-full` s `reference-location: margin` i
`citation-location: margin`. To sužava tijelo teksta i otvara desni marginalni
gutter za citate. Tri vrste sadržaja prelijevaju se u/preko tog gutera jer im
nedostaje horizontalni clamp:

1. **Tablice.** `main.content table { max-width: 100% }` ([styles.css:140](styles/styles.css#L140))
   i `table { width:100% }` u SCSS-u, ali **bez `overflow-x:auto`** i bez
   omotača koji skrola. Tablica čiji stupci traže više od širine stupca gura se
   preko ruba (ch06, ch14, ch16 usporedne tablice).
2. **OJS SVG grafovi.** Observable Plot emitira SVG s fiksnom *piksel*-širinom.
   Kad ta širina premaši suženi stupac, SVG curi desno. `.cell-output` nema
   `overflow-x` ni `max-width:100%` na SVG-u.
3. **Callout / def kutije.** `max-width:70ch` ([styles.css:130](styles/styles.css#L130))
   ali bez `overflow-x` — dugačak neprekinut token, široka inline formula ili
   ugniježđena tablica gura kutiju preko gutera.

### Plan popravka (SCSS, dvije datoteke)

U `styles/custom.scss` dodati pravila:
- `main table` u omotač s `display:block; overflow-x:auto; max-width:100%` ili
  `figure>table` clamp + `-webkit-overflow-scrolling:touch`.
- `.cell-output svg, .observablehq svg { max-width:100%; height:auto }` da SVG
  poštuje stupac (Observable Plot skalira ako mu se da `max-width`).
- `.callout, .callout-praksa, .callout-empirija, .callout-vjezba, .definition,
  div[id^="def-"] { overflow-x:auto }` i `min-width:0` na flex/grid djeci.
- Provjeriti da `word-break`/`overflow-wrap:anywhere` rješava duge tokene.

Popravak je čisto prezentacijski; ne dira `.qmd` izvor. Nakon promjene treba
`quarto render` i vizualna provjera ch14 (najgori slučaj) u svijetlom i tamnom
modu te na mobitelu.

---

## Redoslijed korekcija — status

Poredano po omjeru vrijednost/trošak. Oznake: ✅ obavljeno i commitano ·
⏳ odgođeno (odluka korisnika) · 👤 koautorska hrpa.

1. ✅ **Margine (dim. 7)** — SCSS containment blok dodan u `styles/custom.scss`.
2. ✅ **Tri siroče-definicije (dim. 2)** — ch10 uplesteno, ch12 i ch13 premješteni.
3. ✅ **ch12 infografika uvod (dim. 6)** — uvodni odlomak dodan.
4. ✅ **Duplikat-captioni (dim. 5)** — ch09 L139 i ch19 L117 obrisani.
5. ✅ **Lukovi (dim. 3)** — mostovi unatrag (ch06,09,10,12,13,14,15,18) + naprijed
   u Sažetcima (ch04,13,15,19); ch19 zatvara knjigu. Puni epilog ostaje opcijski.
6. ✅ **„Što isprobati." standardizacija OJS (dim. 5)** — svih ~13 grafova dobilo
   blok; ch14 (8 grafova) prošao potpuni STYLE.md prelet. Najveći sadržajni posao,
   sada gotov.
7. ⏳ **Patuljasta potpoglavlja (dim. 4)** — ch02 (6 stubova), ch15 (tipologija),
   ch05 — strukturni rez, čeka odluku degradirati-ili-podebljati. **ODGOĐENO.**
8. 👤 **ch13 „Hrvatska i EU" placeholder** — čeka koautora (Milan), ne dirati sam.
9. ⏳/👤 **Pokrivenost definicija (dim. 1)** i **ch19 epilog** — veći zahvati,
   opcijski, već u smjernicama.

**Obavljeno ovog ciklusa: stavke 1–6.** Otvoreno: stavka 7 (odluka korisnika),
dijelovi 9. Stavka 8 i hrvatske empirije padaju u koautorsku hrpu (Milan/Petra).
