# Izvještaj o integraciji koautorskih tekstova

**Datum:** 13. lipnja 2026.
**Predmet:** Sedam dostavljenih tekstualnih cjelina ugrađeno u knjigu *Sve što želite znati o državi i javnim politikama u Hrvatskoj*.

Ovaj izvještaj namijenjen je koautoru koji je dostavio tekstove za ugradnju. Objašnjava gdje je svaki tekst smješten, kako je prilagođen glasu i pravilima knjige, što je zadržano, a što izmijenjeno ili izostavljeno te koje napomene traže koautorsku provjeru.

---

## 1. Opći pristup — kako je svaki tekst obrađen

Svaki je tekst prošao isti postupak prije ugradnje, kako se ne bi razlikovao od ostatka knjige.

- **Glas i registar.** Tekstovi su prepisani u jedinstveni glas knjige (sabrani predavač, autorsko *mi*, prezent za teoriju). Uklonjeni su pojačivači („epohalan", „revolucionaran", „zapanjujući"), najave radnje („u ovom poglavlju ćemo", „konstruirat ćemo"), dvotočja u prozi, nabrajanja s crticama te ispisane godine (pretvorene u citate). Sve je usklađeno sa `STYLE.md` (pravila H1–H8, S1–S7).
- **Matematika.** U svim su tekstovima formule u prijenosu bile izgubljene (prazni okviri). Rekonstruirane su u LaTeX-u i provjerene na unutarnju dosljednost (npr. Coaseov model pregovaranja, Baron-Ferejohnova ravnoteža, Alesinino izborno iznenađenje, Grossman-Helpmanova formula zaštite).
- **Citati.** Svaki je citat iz oblika „(Autor, godina)" pretvoren u `[@ključ]` i **online provjeren** prije unosa u `references.bib`. Nije unesen nijedan nepotvrđen citat. Ukupno je dodano 28 novih bibliografskih jedinica.
- **Grafovi.** Gdje je bilo prirodno, izrađen je interaktivni OJS graf s istovjetnim statičkim R/ggplot2 blizancem za PDF, prema postojećem obrascu knjige (uz „Što isprobati" blok). Ukupno 5 novih interaktivnih grafova.
- **Struktura.** Brojni pododjeljci (često 15–25 po tekstu) sažeti su u 1–3 odjeljka razine `##` bez `###` ugnježđivanja, prema pravilu S7.
- **Načelo neumnažanja.** Ondje gdje knjiga već obrađuje neki pojam, dodano je samo ono što nedostaje, bez ponavljanja.

---

## 2. Po cjelinama

### (1) Coaseov teorem → poglavlje 2 (Alokacijska funkcija)

- **Smještaj:** dva nova odjeljka („Coaseov teorem i vlasnička prava", „Transakcijski troškovi i granice pregovaranja"), iza Pigouova poreza, prije asimetričnih informacija.
- **Zadržano u cijelosti:** recipročnost vanjskih učinaka, formalni model pregovaranja s oba slučaja (prava ribarima / prava tvornici) i dokaz jednakog ishoda, razlika učinkovitosti i raspodjele, transakcijski troškovi, zabluda nirvane, sva tri primjera (EU ETS, jadranska obala, zračne luke u SAD-u), usporedna tablica Pigou–Coase.
- **Izmijenjeno:** zaseban „Zaključak" izostavljen (poglavlje ima vlastiti Sažetak); cijeli tekst preveden u glas knjige.
- **Citati dodani:** `demsetz1969`.
- **Napomena:** jadranski primjer je hrvatska-specifična ilustracija i u datoteci je označen `TODO(coauthor)` — traži vašu potvrdu.

### (2) Bordino pravilo i Saarijeva geometrija → poglavlje 6 (Kolektivni izbor)

- **Smještaj:** novi odjeljak „Bordino pravilo i pozicijsko glasovanje", između materijala o ciklusima i Arrowljeva teorema.
- **Zadržano:** Bordino pravilo i pozicijski vektor težina, primjer Borda-protiv-Condorceta s 19 birača (rekonstruirana aritmetika), Youngova aksiomatizacija, Saarijeva geometrijska dekompozicija, Nanson/Baldwin hibridi. Dodan **interaktivni graf** Bordina zbroja, kasnije i `callout-praksa` o stvarnoj primjeni (Nauru, Slovenija, Eurovizija).
- **Obogaćeno bez umnažanja:** postojeći spomen Gibbard-Satterthwaitea dopunjen formalnim iskazom i Muellerovim „štitom nepotpune informacije"; u odjeljak o dnevnom redu dodana Rikerova herestetika.
- **Citati dodani:** `borda1781`, `baldwin1926`, `saari1995`, `young1974`, `nanson1882`, `mcleanurken1995`, `riker1986`.

### (3) Minimax žaljenje (paradoks izlaznosti) → poglavlje 5 (Javni izbor)

- **Smještaj:** novi odjeljak „Glasanje pod neizvjesnošću i minimax žaljenje", iza instrumentalnoga i ekspresivnog glasanja.
- **Zadržano:** Ferejohn-Fiorinin model, rekonstruirana matrica žaljenja (glasati: trošak C; ostati: B − C; pravilo „glasaj kad je B > 2C"), Beckova kritika, primjer Kenije 2007. (Kimenyi i Gutiérrez-Romero), usporedna tablica. Dodan **interaktivni graf** odluke minimax žaljenja.
- **Napomena:** postojeći Downsov račun izlaznosti (R = P·B − C) i ekspresivno glasanje već su bili u poglavlju, pa je dodan samo novi, treći pristup, bez ponavljanja.
- **Citati dodani:** `ferejohnfiorina1974`, `beck1975`, `savage1951`, `kimenyi2008`.

### (4) Teorija igara → NOVO poglavlje 5a (Teorija igara i zakonodavno pregovaranje)

- **Smještaj:** potpuno novo, samostalno metodološko poglavlje na početku DIO II, između „Javnog izbora" i „Kolektivnog izbora". Datoteka je nazvana `05a-teorija-igara` (umetnuti naziv) kako bi se izbjeglo prenumeriranje poglavlja 6–20; redoslijed u knjizi određuje `_quarto.yml`, a čitatelju brojevi nisu vidljivi.
- **Sadržaj:** tri igre s isplatnim matricama (zatvorenikova dilema, kukavica, koordinacija), **potpuni Baron-Ferejohnov model** zakonodavnog pregovaranja (stacionarna ravnoteža, rezervacijska cijena, udio predlagatelja, komparativna statika), stranačka kohezija, delegiranje, eksperimentalna provjera, ustavni dizajn. **Interaktivni graf** udjela predlagatelja. Izrađen je i puni Vodič panel, Sažetak, vježba te zasebna Vodič-podstranica (mentalna mapa).
- **Citati dodani:** `baronferejohn1989`, `baranskimorton2022`, `fehrschmidt1999`, `osborne2004`.
- **VAŽNA NAPOMENA (ispravak):** izvorni je tekst tvrdio da udio predlagatelja u proračunu **raste** s brojem zastupnika n. To je netočno i proturječi vlastitoj graničnoj formuli teksta. Standardni Baron-Ferejohnov rezultat je da udio **pada** prema polovici kako n raste (svaki glas postaje jeftiniji, ali ih treba kupiti više, a drugi učinak prevladava). Poglavlje, graf i Vodič donose ispravan, padajući odnos.
- **NAPOMENA (citat):** izvor je kao metodološku referencu navodio „Čaklović, 2024", koju nije bilo moguće online provjeriti, pa je zamijenjena kanonskim udžbenikom Osborne (2004), *An Introduction to Game Theory*.

### (5) Makropolitički i proračunski ciklusi → poglavlje 4 (Stabilizacijska funkcija)

- **Smještaj:** tri nova odjeljka, iza diskrecijske fiskalne politike, prije velikih kriza. Poglavlje je već nagovještavalo ovu temu („odvajanje stabilizacijske odluke od izbornih kalkulacija").
- **Sadržaj (puna matematika):** Nordhausov oportunistički model (Phillipsova krivulja, adaptivna očekivanja, indeks potpore), Hibbsov stranački model, Rogoffov model signala kompetencije, Alesinin racionalni stranački model (izborno iznenađenje). **Interaktivni graf** oportunističkog ciklusa. Usporedna tablica četiriju modela.
- **Sažeto uz upućivanje:** dio o ustavnim fiskalnim pravilima (kočnica zaduživanja, fiskalna vijeća, neovisnost SB) namjerno je sažet i upućuje na poglavlje o konstitucionalnoj ekonomici, koje ostaje kanonski dom tog rješenja.
- **Citati dodani:** `hibbs1977`, `alesina1987`, `alesina1989`, `rogoffsibert1988`, `rogoff1990`, `vuckovic2010`, `mackic2015`.
- **NAPOMENE (traže koautorsku provjeru):** hrvatski i EU empirijski nalazi (Vučković 2010.; Mačkić) **hrvatska-su-specifični i označeni `TODO(coauthor)`**, uključujući točne brojke (deficit +0,66 postotnih bodova i sl.). Mačkićeva je disertacija obranjena **2015.** (izvor je naveo 2016.) — godinu treba potvrditi. Oba citata u `references.bib` nose `% TODO(coauthor): provjeriti`.

### (6) Interesne skupine i teorija lobiranja → poglavlje 8 (Interesne skupine)

- **Smještaj:** dva nova odjeljka („Konkurencija interesnih skupina i prodaja zaštite", „Lobiranje kao prijenos informacija i njegova pravila"), iza odjeljka o regulatornom zarobljavanju.
- **VAŽNO — poglavlje je već bilo cjelovito.** Poglavlje 8 već detaljno obrađuje Olsonovu logiku, selektivne poticaje, koncentrirane koristi/raspršene troškove, lov na rentu (Tullock, Krueger, Harberger), regulatorno zarobljavanje (Stigler, Peltzman, kružna vrata, svi Dal Bóovi kanali), željezni trokut i pluralizam/korporativizam. Dostavljeni je tekst otprilike **polovicu toga ponavljao**. Stoga je ugrađeno **samo ono što je nedostajalo**, bez ponavljanja postojećega.
- **Dodano:** Beckerov model konkurencije (mrtvi teret kao kočnica pritiska), Grossman-Helpmanov model „Protection for Sale" (funkcija korisnosti vlade, formula optimalne zaštite), Goldberg-Maggijeva empirija (a ≈ 98 %), Crawford-Sobelov model lobiranja kao „jeftinih riječi", razlika kupnje pristupa i kupnje glasova, Downsova donatorska polarizacija (uz upućivanje na poglavlje o strankama) te tri ustavna instrumenta (registri lobista, razdoblja hlađenja, neovisni uredi za analizu). **Interaktivni graf** Grossman-Helpmanove zaštite. Usporedna tablica triju modela.
- **Citati dodani:** `becker1983`, `grossmanhelpman1994`, `goldbergmaggi1999`, `crawfordsobel1982`, `bernheimwhinston1986`.

---

## 3. Grafika i interaktivni prikazi

Uz tekst je izrađeno **deset novih grafova**, svaki u obliku interaktivnog OJS prikaza za HTML i istovjetnog statičkog R/ggplot2 blizanca za PDF, u boji i tipografiji knjige, uz „Što isprobati" blok.

**Pet grafova izrađenih uz ugrađene tekstove:** minimax žaljenje (pogl. 5), Bordin zbroj (pogl. 6), udio predlagatelja po Baron-Ferejohnu (pogl. 5a), oportunistički ciklus (pogl. 4) i Grossman-Helpmanova zaštita (pogl. 8).

**Pet grafova izrađenih prema skicama koautora.** Koautori su dostavili niz statičkih skica grafova. Provjerom je utvrđeno da knjiga **tri od njih već ima kao interaktivne grafove** (Condorcetov ciklus u pogl. 6, Niskanenov model u pogl. 9, vertikalno zbrajanje potražnje za javnim dobrom u pogl. 2), pa nisu ponovljeni. Preostalih **pet popunjavalo je stvarne praznine** i izrađeni su kao interaktivni grafovi prema skicama:

- **Medijanski glasač** (pogl. 7) — raspodjela birača i konvergencija stranaka prema medijanu.
- **Podrška i obećanja** (pogl. 7) — obrnuta krivulja podrške u ovisnosti o broju obećanja.
- **Lov na rentu** (pogl. 8) — renta (pravokutnik) i mrtvi teret (trokut) zbog ograničenja količine.
- **Trgovanje glasovima** (pogl. 6) — ravnina dobitaka dvaju zastupnika i paket A+B u polju zajedničkog dobitka.
- **Regulacija i mrtvi teret** (pogl. 12) — klin između cijene kupca i proizvođača te trokut mrtvog tereta.

Napomena: poglavlje 7 (Političke stranke i izbori) dotad nije imalo nijedan graf, pa su mu dva nova prikaza najveći pojedinačni dobitak; isto vrijedi i za poglavlje 12. Engleski natpisi sa skica prevedeni su na hrvatski, a prikazi su iz statičnih pretvoreni u interaktivne radi usklađenosti s ostatkom knjige.

## 4. Što je izostavljeno i zašto

- **Coase:** zaseban zaključak (preklapao se sa Sažetkom).
- **Bordin megatekst:** dio detalja o manipulaciji (radni primjer „pokapanja", problem klonova, formalni „manipulacijski potencijal") i odjeljak o ustavnom značaju sažeti su ili izostavljeni radi ujednačenosti; dio o izlaznosti birača **već je postojao** u poglavlju 5, pa nije ponovljen, nego je novi minimax-pristup dodan na nj.
- **Makropolitički ciklusi:** ustavna fiskalna pravila sažeta (kanonski dom je poglavlje 11).
- **Interesne skupine:** Olson, lov na rentu, Stigler-Peltzman, željezni trokut, kružna vrata — **sve je već bilo u poglavlju 8**, pa nije ponovljeno.

---

## 5. Stanje i preostalo

Svih sedam tekstualnih cjelina i deset novih grafova ugrađeno je, provjereno (render, citati, lekture) te objavljeno na `main`. HTML se automatski gradi na GitHub Pages.

**Prije konačne verzije preporučuje se:**
1. **Ponovna izrada PDF-a** (svi grafovi imaju PDF-blizance) — odgođena tijekom rada, a knjiga je u međuvremenu dobila novo poglavlje, šest novih odjeljaka i deset interaktivnih grafova.
2. **Koautorska provjera** označenih hrvatskih sadržaja: jadranski primjer (pogl. 2) i empirija Vučković/Mačkić (pogl. 4), uključujući godinu Mačkićeve disertacije.
