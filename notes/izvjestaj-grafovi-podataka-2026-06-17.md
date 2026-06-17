# Izvještaj — grafovi i podaci u knjizi

*Datum: 2026-06-17. Pregled svih renderiranih figura kroz svih 21 poglavlje + dodatke, s prijedlozima novih grafova podataka.*

---

## 1. Sažetak

Knjiga sadrži **55 renderiranih figura**. Od toga:

| Tip | Broj | Gdje |
|---|---|---|
| **Empirijski grafovi podataka** (stvarni podaci) | **17** | DIO IV (ch14–16) + 3 raštrkana anchora (ch03, ch04, ch05) |
| **Konceptualni / ilustrativni dijagrami** (crtana teorija) | **38** | ravnomjerno kroz DIO I, II, III, V |
| — od toga statički SVG infografi | (4) | ch01, ch05, ch06, ch13 |
| **Interaktivni Atlas** (zaseban alat, CSV-driven) | (1 sustav, 4 pokazatelja) | `podaci.qmd` |

**Ključni nalaz.** Empirijski grafovi gotovo su u potpunosti koncentrirani u **DIO IV (Javne financije u praksi)** — poglavlja 14, 15 i 16 nose **14 od 17** empirijskih grafova. Cijeli **DIO II (Javni izbor, ch06–10)** i **DIO III (institucije, ch11–12)** nemaju **nijedan** graf sa stvarnim podacima — sve su crtane teorijske ilustracije. Poglavlja **11, 12, 18, 19** te **00 (uvod)** i `index.qmd` nemaju **nijednu** figuru.

**Tehnička zapažanja.**

- Svaki interaktivni graf renderira se dvojno: **OJS / Observable Plot** za HTML i statički **R/ggplot2 „blizanac"** (`-print` sufiks) za PDF. Brojimo ih kao jednu figuru.
- Svi empirijski podaci su **hardkodirani inline** u JS/R blokovima — **nema** vanjskih CSV/`FileAttachment` poziva (jedina iznimka je Atlas u `podaci.qmd`, koji čita `data/atlas/*.csv`).
- Dominantni izvori: **Eurostat** (s konkretnim kodovima tablica: `gov_10a_main`, `gov_10a_exp`, `gov_10a_taxag`, `gov_10dd_edpt1`), **OECD** (Revenue Statistics 2025, Taxing Wages 2025, Income Distribution Database), **Tanzi & Schuknecht (2000)** za povijesne nizove.

---

## 2. Empirijski grafovi podataka (17)

Ovo su pravi „grafovi podataka" — prikazuju stvarne brojeve sa stvarnim izvorom.

### DIO I — raštrkani anchori (3)

| # | Poglavlje | Oznaka | Što prikazuje | Izvor |
|---|---|---|---|---|
| 1 | **03 — Distribucijska** | `#fig-gini-prije-poslije` | Ginijev koeficijent prije i poslije poreza/transfera, 8 zemalja, HR istaknuta (0,451 → 0,302); strelica = redistribucijski učinak | **OECD Income Distribution Database** (dohodovna godina 2023., DE 2022.); inline |
| 2 | **04 — Stabilizacijska** | `#fig-javni-dug` | Konsolidirani bruto dug opće države, % BDP-a, kraj 2024., 11 jedinica; maastrichtska crta 60 %; HR 57,4 % | **Eurostat `gov_10dd_edpt1`** (listopadska EDP notifikacija 2025.); inline |
| 3 | **05 — Porezi (teorija)** | `#fig-longrun-porezi` | Dugoročni rast poreznog opterećenja (% BDP-a), dva panela: luk 1900.–2024. + moderni panel 2008.–2025., HR | **Tanzi & Schuknecht** (rashodi do 1960. kao proxy), **OECD** (1965.+), **Eurostat** (moderno); zaokruženo/indikativno; inline |

### DIO IV — jezgra empirije (14)

**Poglavlje 14 — Javna potrošnja (6 empirijskih + 1 ilustrativni)**

| # | Oznaka | Što prikazuje | Izvor |
|---|---|---|---|
| 4 | `#fig-longrun-rashodi` | Javna potrošnja % BDP-a, dva panela: prosjek 17 razvijenih od 1870. + moderni panel 2008.–2025., HR | Tanzi & Schuknecht (2000) Tab. I.1; Eurostat `gov_10a_main`; HR do 2007. proc. WB/IMF |
| 5 | `#fig-rashodi-bdp` | Ukupni rashodi opće države % BDP-a, 12 zemalja EU; HR 48,0; EU 49,0; OECD-linija 42,6 | Eurostat `gov_10a_main`, OECD (2023.; HR 2024.) |
| 6 | `#fig-cofog` | Funkcionalna struktura rashoda EU (COFOG) 2023., 10 funkcija + raspon socijalne zaštite (SAD/OECD/Finska) | Eurostat (COFOG); OECD za točke raspona |
| 7 | `#fig-cofog-hr` | Funkcionalna struktura rashoda Hrvatske 2024. (kružni dijagram, D3) | Eurostat `gov_10a_exp` |
| 8 | `#fig-soczast-zdravstvo` | Socijalna zaštita + zdravstvo zajedno, % BDP-a, 2023., 15 jedinica; HR 20,5 | Eurostat `gov_10a_exp` (COFOG) |
| 9 | `#fig-ekonomska-struktura` | Struktura rashoda EU po ekonomskim transakcijama 2023. (% ukupnih) | Eurostat |

**Poglavlje 15 — Porezi u praksi (6 empirijskih)**

| # | Oznaka | Što prikazuje | Izvor |
|---|---|---|---|
| 10 | `#fig-porezni-teret` | Ukupni porezni teret % BDP-a, 11 zemalja; HR 38,6; OECD 33,7 | OECD Revenue Statistics 2025 (2023.); HR/SI/HU Eurostat 2024. |
| 11 | `#fig-struktura-pita` | Struktura poreznih prihoda — 6 pita (OECD, DK, DE, SAD, CL, HR); D3 | OECD Revenue Statistics 2025; HR Eurostat 2024. |
| 12 | `#fig-eu-struktura` | Porezi i doprinosi u članicama EU 2024. (% BDP-a), 3 skupine | Eurostat (2024.) |
| 13 | `#fig-doprinosi-podjela` | Socijalni doprinosi % BDP-a 2023., podjela poslodavac/zaposlenik | Eurostat `gov_10a_taxag` (D611/D613) |
| 14 | `#fig-porezni-klin-zemlje` | Porezni klin na rad, 11 jedinica; HR ~36; OECD 35,1 | OECD Taxing Wages 2025; HR nac. procjena (Blažić & Šeparović 2019). ⚠️ `TODO(coauthor)` — HR vrijednost provizorna |
| 15 | `#fig-hr-eu-struktura` | Struktura poreznih prihoda HR vs EU 2024. (5 pokazatelja, grupirani barovi) | Eurostat (2024.) |

**Poglavlje 16 — EU javne financije (2 empirijska)**

| # | Oznaka | Što prikazuje | Izvor |
|---|---|---|---|
| 16 | `#fig-mff-naslovi` | VFO EU 2021.–2027. po naslovima (% obveza); ukupno 1.074 mlrd. € | Europski parlament, Vijeće EU |
| 17 | `#fig-neto-pozicija` | Neto proračunski položaj članica EU, €/stanovniku, 2023.; HR +619 | Europska komisija; izračuni Bundesbank & IW Köln |

### Interaktivni Atlas (`podaci.qmd`)

Zaseban podatkovni alat (nije poglavlje): birač pokazatelja s tri prikaza (**Karta / Vremenska serija / Tablica**) i usporedbom s peer-zemljom. Jedini dio knjige koji čita podatke iz CSV-ova (`data/atlas/*.csv`), pa je i jedini lako osvježiv bez ručnog uređivanja koda.

- **01.1 Rashodi opće države** % BDP — Eurostat `gov_10a_main` (TE, S13)
- **01.2 Prihodi opće države** % BDP — Eurostat `gov_10a_main` (TR, S13)
- **01.3 Funkcionalna struktura (COFOG)** — Eurostat `gov_10a_exp`
- **02.1 Ukupni porezi i doprinosi** % BDP — Eurostat `gov_10a_main` (D2+D5+D91+D61)

Pokazatelji „u pripremi" (onemogućeni): tax wedge (OECD), struktura poreza po vrstama, izdaci za socijalnu zaštitu.

---

## 3. Konceptualni / ilustrativni dijagrami (38)

Crtane teorijske krivulje i modeli — **bez empirijskog izvora**, generirani iz formula i klizača. Tagirani u kodu kao ilustrativni. Navedeni radi cjelovitosti; **nisu** „grafovi podataka".

- **ch01:** `#fig-tri-funkcije` (SVG infograf), `#fig-edgeworth` (Edgeworthova kutija)
- **ch02:** `#fig-javna-dobra`, `#fig-neg-eksternalija`, `#fig-poz-eksternalija`, `#fig-nepovoljan-izbor`, `#fig-moralni-hazard`, `#fig-monopol` *(6 — svi market-failure dijagrami ponude/potražnje)*
- **ch03:** `#fig-lorenz` (Lorenzova krivulja, predložak)
- **ch04:** `#fig-keynesian-cross`, `#fig-oportunisticki-ciklus`
- **ch05:** `#fig-vrste-poreza` (SVG), `#fig-opadajuca-korisnost`, `#fig-porezna-incidencija`, `#fig-mrtvi-teret-skaliranje`, `#fig-porezni-klin`, `#fig-ramsey-dwl`, `#fig-dokolica-potrosnja`, `#fig-medutemporalna-stednja`, `#fig-laffer` *(9)*
- **ch06:** `#fig-javni-izbor-kljucne-ideje` (SVG), `#fig-paradoks-glasanja`, `#fig-minimax-zaljenje`
- **ch06a:** `#fig-bf-udio` (Baron-Ferejohn udio predlagatelja)
- **ch07:** `#fig-condorcet`, `#fig-borda`, `#fig-logrolling`
- **ch08:** `#fig-medijanski-glasac`, `#fig-downs-obecanja`
- **ch09:** `#fig-lov-na-rentu`, `#fig-zastita-na-prodaju` (Grossman-Helpman)
- **ch10:** `#fig-niskanen`
- **ch13:** `#fig-trzisni-neuspjesi` (SVG), `#fig-regulacija-mrtvi-teret`
- **ch14:** `#fig-wagner` *(ilustrativni scatter — kod i caption izričito kažu „približni podaci, ne službena statistika")*
- **ch17:** `#fig-test-neuspjeha` (heuristički indeks otpornosti)
- **ch20:** `#fig-npv-diskontna` (NPV/IRR računica)
- **ch21:** `#fig-reforma-kapacitet` (stilizirana zvonolika krivulja)

---

## 4. Poglavlja bez ijedne figure

`index.qmd`, **00-uvod**, **11-institucionalna-ekonomika**, **12-konstitucionalna-ekonomika**, **18-novi-javni-menadzment**, **19-novo-upravljanje**.

---

## 5. Prijedlozi novih grafova podataka

Logika prijedloga: (a) **empirijski deficit** je u DIO II, III i V — teorija javnog izbora i institucija nema podatkovni oslonac; (b) recentni smjer knjige (commit „empirical Croatia-anchored data graphs") traži **Hrvatsku usidrenu u EU usporedbi**; (c) već postoji infrastruktura (OJS + ggplot blizanci, Eurostat/OECD izvori), pa su prijedlozi izvedivi istim obrascem.

### Prioritet A — popuniti prazne dijelove (najveći učinak)

| Poglavlje | Prijedlog grafa | Izvor |
|---|---|---|
| **01 Uloga države** | Veličina države u HR kroz vrijeme: ukupni rashodi % BDP-a 1995.–2024. (anchora cijeli uvodni okvir; trenutno samo SVG + Edgeworth) | Eurostat `gov_10a_main`, AMECO |
| **06 Javni izbor** | Pad izlaznosti u HR po vrstama izbora (parlamentarni / EP / lokalni / predsjednički) — **empirijski anchor za paradoks glasanja** | DIP, IDEA Voter Turnout DB |
| **08 Stranke i izbori** | Lijevo-desno pozicije hrvatskih stranaka (anchora median-voter teoriju); ili udio glasova vs udio mandata (disproporcionalnost) | CHES, Manifesto Project, ParlGov |
| **09 Interesne skupine** | Gustoća sindikalnog članstva / pokrivenost kolektivnim ugovorima, HR vs EU; ili broj registriranih lobista | OECD/ICTWSS, Registar lobista |
| **10 Birokracija** | Zaposlenost u općoj državi kao % ukupne zaposlenosti, HR vs EU; ili indeks učinkovitosti vlade kroz vrijeme | Eurostat, World Bank WGI |
| **11 Institucionalna** | Pokazatelji kvalitete institucija (vladavina prava, regulatorna kvaliteta), HR vs EU/region | World Bank WGI, V-Dem, WJP Rule of Law Index |
| **12 Konstitucionalna** | Indeks fiskalnih pravila EU kroz vrijeme; ili povjerenje u institucije | EC Fiscal Rules Database, Eurobarometar |
| **18 Novi javni menadžment** | E-uprava / digitalizacija javnih usluga (DESI), HR vs EU; ili učinkovitost javnog sektora | EC DESI, UN E-Gov Index |
| **19 Novo upravljanje** | Povjerenje u vladu / zadovoljstvo javnim uslugama, HR vs EU | OECD Trust survey, Eurobarometar |

### Prioritet B — empirijski „pojačati" postojeće konceptualne dijagrame

Uz svaki crtani model dodati malu empirijsku pratilju (isti obrazac kao postojeći anchori):

| Poglavlje | Konceptualni graf | Empirijska pratilja |
|---|---|---|
| **02 Alokacija** | eksternalije / javna dobra | Emisije CO₂ ili javni izdaci za R&D % BDP-a, HR vs EU (negativna eksternalija / podprodukcija javnog dobra) — Eurostat, EEA |
| **03 Distribucija** | Lorenzova krivulja | Stopa rizika od siromaštva (AROP) ili S80/S20 omjer kroz vrijeme, HR vs EU — Eurostat SILC |
| **04 Stabilizacija** | oportunistički ciklus | Stvarna nezaposlenost / proračunski saldo HR oko izbornih godina (usidri model u podatke) — AMECO, Eurostat |
| **17 Državni neuspjesi** | heuristički test | Indeks percepcije korupcije HR vs EU kroz vrijeme; ili stopa apsorpcije EU fondova — Transparency Int. CPI, EC |
| **21 Reforme** | krivulja kapacitet/uspjeh | Projekcija omjera ovisnosti starijih (mirovinska reforma) HR — Eurostat / Ageing Report |

### Prioritet C — proširiti Atlas (`podaci.qmd`)

Tri pokazatelja već su skicirana kao „u pripremi" — dovršiti ih znači mali korak uz postojeću CSV infrastrukturu:

- **Tax wedge (OECD)** — Taxing Wages
- **Struktura poreza po vrstama** — Eurostat `gov_10a_taxag`
- **Izdaci za socijalnu zaštitu** — Eurostat `spr_exp_sum` ili COFOG GF10

### Sustavni prijedlog (proces, ne pojedini graf)

Empirijski nizovi sada su **hardkodirani inline** u svakom poglavlju. Migracija u `data/*.csv` (po uzoru na `data/atlas/`) dala bi: (1) jedan izvor istine po nizu, (2) lakše godišnje osvježavanje, (3) mogućnost da se isti niz dijeli između poglavlja i Atlasa. Trenutno se npr. rashodi % BDP-a pojavljuju i u ch14 (inline) i u Atlasu (CSV) — dva odvojena izvora istih brojeva.

---

*Napomena: ovaj izvještaj je dijagnostički pregled, nije izmjena sadržaja. Novi grafovi koji uključuju hrvatske primjere idealno idu uz potvrdu koautora (vrijednosti i godine).*
