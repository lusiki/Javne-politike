# Izvještaj — matematičko obogaćivanje udžbenika

**Datum:** 2026-06-14  
**Metoda:** višeagentni audit (42 agenta) — za svako poglavlje ekspert za javne financije predložio je konkretne jednadžbe, a recenzent matematičke točnosti adverzarijalno je provjerio svaku formulu (predznaci, smjer nejednakosti, elastičnosti) i status citata u `references.bib`.

Ovaj izvještaj je **dijagnostički + prijedložni** — nije izveden nijedan zahvat u poglavlja. LaTeX u tablicama je **već ispravljena/verificirana** verzija (stupac „Provjera" bilježi što je recenzent promijenio).

---

## Sažetak

- **Poglavlja analizirana:** 21 (sva osim uvodnog 00)
- **Predloženih jednadžbi ukupno:** 112
- **Nedostajućih/problematičnih citata:** 23 (vidi popis na dnu — moraju u `references.bib` prije nacrta, uz `TODO(coauthor)`)
- **Formula koje je recenzent ISPRAVIO (greška predznaka/smjera/koncepta):** Barro-Gordon (ch11, L→W maksimizacija), Weitzman (ch12, C''−B'' → C''+B''), Niskanenov uvjet (ch17, B'=C' → B=C), princip-agent rizična neutralnost (ch09, dodana premija rizika), Becker (ch08, tautološki zapis), hold-up v(I) (ch10), δ-prag ponovljene igre (ch18), Alesina-Drazen rat iscrpljivanja (ch20, arg max bez unutarnjeg optimuma), Kaldor-Hicks u novcu ne korisnostima (ch01), Oates dovoljan uvjet ne iff (ch15), Tiebout indeks zbrajanja (ch15), Diamond-Mirrlees (ch14, MRT=MRS pogrešno).

Pouka: **ne lijepiti formule bez provjere.** Prvi su nacrt sadržavali iste vrste grešaka kao i ranija knjiška greška (udio predlagatelja u Baron-Ferejohnu).

---

## 01-uloga-drzave (Uloga države u gospodarstvu)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; dva def-okruženja (Pareto, Kaldor-Hicks) i oba teorema blagostanja iskazana su isključivo verbalno, a uvjet tangentnosti MRS_A=MRS_B opisan je riječima iako ga prateći Edgeworthov dijagram već implicitno prikazuje.

**Jaz:** Nekoliko koncepata koji u literaturi javne ekonomije imaju standardni, kratak i grafički prikaziv formalni izraz trenutno žive samo u prozi. (1) Pareto/Edgeworth uvjet učinkovitosti razmjene MRS_A = MRS_B opisan je rečenicom 'granične stope supstitucije obaju potrošača su jednake' (red 87), ali se nigdje ne zapisuje kao jednadžba, premda OJS/ggplot graf upravo taj uvjet crta kao tangentnost. (2) Cjelovit uvjet Pareto-učinkovitosti u proizvodno-potrošačkom gospodarstvu (MRS = MRT) uopće se ne spominje, a to je kanonski 'lakmus' alokacijske funkcije i prirodni most prema poglavljima o eksternalijama i javnim dobrima. (3) Kaldor-Hicksov kriterij (def, red 75-77) iskazan je verbalno ('agregatni dobici dovoljni da kompenziraju gubitke'); njegov jednoredni formalni zapis izravno bi poduprio numeričku vježbu na kraju poglavlja (red 469-476) koja traži upravo taj račun — ali ga treba pisati u NOVČANIM mjerama, ne u korisnostima. (4) Drugi teorem blagostanja razdvaja učinkovitost od pravednosti, a poglavlje opširno raspravlja o vrijednosnim sudovima društva (red 71, 79, 445) bez ijednom uvedene Bergson-Samuelsonove funkcije društvenog blagostanja, koja je kanonski formalni nositelj tog razdvajanja. (5) Odjeljak o drugom teoremu i optimalnom oporezivanju (red 437-439) verbalno tvrdi da 'optimalna granična porezna stopa ovisi o tome koliko porez utječe na ponudu rada' — to je doslovno Mirrleesov/ABC izraz koji se može dati kao optional formula. Edgeworthova kutija je vizualizirana, ali algebra Cobb-Douglas krivulje ugovora postoji samo u kodu grafa, ne i u tekstu.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Uvjet Pareto-učinkovitosti razmjene (jednakost graničnih stopa supstitucije) | Edgeworthova kutija / krivulja ugovora — Edge | core | low | [@atkinson1980] | Edgeworthova kutija i krivulja ugovora (oko reda 8 |
| 2 | Potpuni uvjet Pareto-učinkovitosti gospodarstva (MRS potrošača = MRT proizvodnje) | Prvi teorem ekonomike blagostanja u Arrow-Deb | core | low | [@arrow1954] | Teoremi ekonomike blagostanja (uz iskaz Prvog teor |
| 3 | Kaldor-Hicksov kriterij (potencijalna kompenzacija) | Kaldor (1939) – Hicks (1939) kriterij potenci | strong | low | [@boardman2018] | Pareto učinkovitost i mjerila blagostanja (uz def- |
| 4 | Bergson-Samuelsonova funkcija društvenog blagostanja | Bergson (1938) – Samuelson (1947) funkcija dr | strong | medium | ⚠ MISSING | Teoremi ekonomike blagostanja (uz raspravu o Drugo |
| 5 | Optimalna granična porezna stopa pod asimetričnom informacijom (kompromis jednakost–učinkovitost) | Mirrleesov model optimalnog oporezivanja doho | optional | high | [@mirrlees1971] | Teoremi ekonomike blagostanja (uz odlomak o optima |

**[1] Uvjet Pareto-učinkovitosti razmjene (jednakost graničnih stopa supstitucije)**

```latex
$$
MRS^{A}_{XY} = \frac{\partial U^{A}/\partial X}{\partial U^{A}/\partial Y} = \frac{\partial U^{B}/\partial X}{\partial U^{B}/\partial Y} = MRS^{B}_{XY}
$$
```
*Zašto:* Ovo je jedina jednadžba koja izravno formalizira ono što čitatelj već gleda na grafu — tangentnost krivulja indiferencije znači jednake granične stope supstitucije. Pretvara opisnu rečenicu u provjerljiv uvjet, daje studentu definiciju MRS-a koja se ponavlja kroz cijelu knjigu (eksternalije, javna dobra) i nije zastrašujuća jer je odmah grafički potkrijepljena.

**[2] Potpuni uvjet Pareto-učinkovitosti gospodarstva (MRS potrošača = MRT proizvodnje)**

```latex
$$
MRS^{A}_{XY} = MRS^{B}_{XY} = MRT_{XY}
$$
```
*Zašto:* Prvi teorem trenutno je samo verbalna tvrdnja da konkurentsko tržište vodi učinkovitoj alokaciji. Ova jednoredna jednakost daje precizan sadržaj pojmu 'učinkovita alokacija' i postaje referentno mjerilo za sva kasnija poglavlja o tržišnim neuspjesima — kod eksternalija je upravo ova jednakost narušena (MRS != MRT). Niska težina jer proširuje već uvedeni MRS samo jednim novim pojmom (MRT).

**[3] Kaldor-Hicksov kriterij (potencijalna kompenzacija)**

```latex
$$
\sum_{i \in G} CV_i \;>\; \sum_{j \in L} |CV_j| \quad\Longleftrightarrow\quad \sum_{i} CV_i > 0
$$
```
*Zašto:* Definicija je trenutno čisto verbalna, a poglavlje završava numeričkom vježbom (90 mil. dobitaka vs 40 mil. gubitaka) koja traži točno ovaj račun. Formalni zapis u NOVČANIM mjerama (CV = kompenzacijska varijacija / spremnost na plaćanje, u eurima) premošćuje definiciju i vježbu i čini eksplicitnim da je kriterij zbroj predznačenih NOVČANIH promjena. KLJUČNO: zbroj se NE smije pisati preko ΔU (korisnosti), jer je smisao kriterija upravo izbjeći zbrajanje korisnosti među osobama; uz jednadžbu valja kratkom rečenicom reći da CV_i mjeri dobitak/gubitak u eurima, čime se izravno povezuje s vježbom denominiranom u eurima.

**[4] Bergson-Samuelsonova funkcija društvenog blagostanja**

```latex
$$
W = W\big(U_1, U_2, \dots, U_n\big), \qquad \frac{\partial W}{\partial U_i} > 0 \;\; \forall i
$$
```
*Zašto:* Drugi teorem cijelo poglavlje koristi za razdvajanje učinkovitosti i pravednosti, ali nigdje ne uvodi objekt koji 'bira' jednu točku na krivulji ugovora — to je upravo W(.). Jednadžba pokazuje studentu da je odabir među beskonačno mnogo Pareto-učinkovitih alokacija normativan čin sažet u funkciji W, čime se eksplicira da Pareto-kriterij ostavlja stupanj slobode koji popunjavaju društvene preferencije. Srednja težina jer uvodi pojam funkcije nad korisnostima, ali je intuitivno čitljiva.

**[5] Optimalna granična porezna stopa pod asimetričnom informacijom (kompromis jednakost–učinkovitost)**

```latex
$$
\frac{T'(z)}{1 - T'(z)} = \frac{1}{\varepsilon}\cdot\frac{1 - F(z)}{z\,f(z)}\cdot\big(1 - G(z)\big)
$$
```
*Zašto:* Poglavlje već verbalno iskazuje srž ovog rezultata — da optimalna stopa ovisi o elastičnosti ponude rada (epsilon) i o raspodjeli sposobnosti. Formula bi to potkrijepila i dala znatiželjnom studentu konkretan sadržaj pojma 'kompromis jednakost-učinkovitost'. Predlažem je kao optional jer notacija (gustoća f, distribucija F, socijalne težine G, elastičnost epsilon) prelazi razinu uvodnog poglavlja; najprimjerenija je u callout/fusnoti ili kao 'pogled unaprijed' prema poglavlju o porezima, da ne preoptereti uvod. NAPOMENA: uz formulu obvezno definirati G(z) kao PROSJEČNU društvenu graničnu težinu blagostanja za one s dohotkom IZNAD z (Diamond-Saez), inače je (1-G(z)) nečitljivo.

**Gdje produbiti (izvodi / vježbe):** 1) PRODUBLJENA IZVEDBA U CALLOUT-VJEZBI (Edgeworth): postojeća sekcija već nosi Cobb-Douglas algebru krivulje ugovora u kodu grafa, ali ne i u tekstu. Vrijedi dodati malu izvedbu (callout-vjezba) u kojoj se za U^A=X^α Y^(1-α) i U^B=(W-X)^β(H-Y)^(1-β) izjednače MRS-ovi i dobije zatvoreni oblik krivulje ugovora — student tako vidi da uvjet MRS_A=MRS_B nije samo slika nego rješiva jednadžba; brojčani primjer s α=0,6, β=0,4 daje konkretne koordinate točaka A/B/C koje već stoje na grafu. Recenzentska napomena: za Cobb-Douglas U^A=X^α Y^(1-α) je MRS^A = (α/(1-α))·(Y/X), pa izjednačavanje MRS-ova daje zatvoreni oblik krivulje ugovora identičan funkciji CC(x) u kodu grafa — izvedba je matematički konzistentna s postojećim grafom. 2) NUMERIČKA VJEZBA UZ KALDOR-HICKS: postojeća vježba (red 469-476) idealno je mjesto da se formalni izraz sum CV_i > 0 primijeni eksplicitno; preporuka je u rješenju/uputi pokazati račun 90 - 40 = 50 mil. eura > 0 kao zadovoljen K-H, uz napomenu da nije Pareto-poboljšanje jer postoji L != prazan skup. Bitno: i ovdje ostati u eurima (CV), ne u utilima. 3) ANALITICKI OKVIR ZA DRUGI TEOREM: kratak formalni okvir (paušalni transfer T_i koji ne ovisi o odlukama vs. porez T(z_i) koji ovisi o zaradi z_i) precizno bi pokazao zašto informacijska struktura ruši idealne paušalne instrumente — to je trenutno najjača prilika za 'mehanizam' umetak jer poglavlje već verbalno nosi cijeli argument (red 437-439). 4) GRAFICKA PRILIKA: Bergson-Samuelsonova W mogla bi se uz postojeću Edgeworthovu kutiju ilustrirati kao odabir jedne točke na krivulji ugovora pomoću društvenih krivulja indiferencije (iso-W kontura), čime se vizualno zatvara petlja učinkovitost–pravednost.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

SAŽETAK ADVERZARIJALNE PROVJERE (5 jednadžbi). [1] MRS_A=MRS_B: OK, citat [@atkinson1980] PRESENT. [2] MRS=MRS=MRT: OK, citat [@arrow1954] PRESENT (Arrow-Debreu je egzist. teorem, atkinson1980 bi tematski bolje stajao kao izvor uvjeta). [3] Kaldor-Hicks: ISPRAVLJENO — izvorni ΔU (zbroj korisnosti) je konceptualna greška jer je to utilitarizam (ΣU), a ne K-H; K-H mjeri u NOVCU (CV/spremnost na plaćanje), pa je ΔU_i zamijenjen CV_i; algebarska ekvivalencija ostaje valjana; citat [@boardman2018] PRESENT. [4] Bergson-Samuelson W=W(U_1..U_n), ∂W/∂U_i>0: OK; citat MISSING — provjereno da u references.bib NEMA ni bergson1938 ni samuelson1947 (postoji samuelson1954 o javnim dobrima, NIJE prava ref); treba dodati novi unos. [5] Mirrlees/ABC T'/(1-T')=(1/ε)((1-F)/(zf))(1-G): OK, provjereno protiv Saez 2001 / Diamond-Saez — 1/ε (ne 1+1/ε), zagrada (1-G(z)) ispravna, G(z)=prosj. težina iznad z; citat [@mirrlees1971] PRESENT, preporuka dodati [@saez2001] koji TAKOĐER POSTOJI u .bib. Razine (core/strong/optional, low/medium/high) realne za studente.

</details>

---

## 02-alokacijska-funkcija (Alokacijska funkcija i tržišni neuspjesi)

**Trenutno:** 5 display jednadžbi · formalni modeli: da  
Only the Coase section is stated formally with display equations (W(q)=π−D, the FOC π'=D', t=D'(q*), and the two bargaining inequalities); all other canonical environments (#def-javno-dobro, #def-eksternalija, #def-asimetricne-informacije, #def-prirodni-monopol) are stated only verbally, while the Samuelson condition, the Pigouvian tax, and the monopoly deadweight loss live only in graphs/sliders and prose, not in equations.

**Jaz:** Nekoliko nosivih koncepata teme tretira se samo riječima ili grafički, premda imaju kratak, standardan formalni zapis. (1) Samuelsonov uvjet ΣMRS = MRT — najkanonskija jednadžba poglavlja — ne pojavljuje se kao display jednadžba; graf javnih dobara vizualizira vertikalno zbrajanje (ΣDᵢ = MSB), ali formalni uvjet nigdje nije zapisan, iako se samuelson1954 već citira. (2) Pigouov porez spominje se prozno i u callout-empirija; u Coaseovoj sekciji se t = D'(q*) već pojavljuje, ali nikad nije istaknut kao t* = MEC(Q*) vezan uz negativnu eksternaliju gdje mu je pedagoški dom. (3) Mrtvi teret monopola prikazan je grafom i pojmom 'monopolska marža', ali Lernerov indeks (P−MC)/P = 1/|ε| nije zapisan; pažnja: graf prikazuje (Pm−Pc)/Pc, a NE Lernerov indeks (Pm−MC)/Pm, pa su to dvije različite veličine. (4) Akerlofov model limuna opisan je čisto verbalno; nedostaje uvjet kolapsa preko očekivane kvalitete E[q|p]. (5) Moralni hazard ima bogat graf s C(e)=1+k·e² i R/OJS kod koji računa eM = m/(2k(1−θ)), ali agentov uvjet izbora nije eksplicitno zapisan. (6) Lindahlove cijene, navedene kao kanonski model, nigdje se ne spominju; uvjet Σpᵢ = MC potpuno nedostaje.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Samuelsonov uvjet za optimalnu ponudu javnog dobra | Samuelson (1954), čista teorija javnih rashod | core | medium | [@samuelson1954] | ## Javna dobra — neposredno nakon ::: {#def-javno- |
| 2 | Lindahlove cijene kao cjenovni dual Samuelsonova uvjeta | Lindahl (1919) / Johansen; ravnoteža dragovol | strong | medium | ⚠ MISSING | ## Javna dobra — odmah iza Samuelsonove propozicij |
| 3 | Pigouov porez jednak marginalnom vanjskom trošku | Pigou (1920), korektivno oporezivanje ekstern | core | low | [@pigou1920] | ## Negativne eksternalije (uz graf fig-neg-ekstern |
| 4 | Mrtvi teret monopola i Lernerov indeks tržišne moći | Lerner (1934) marža/elastičnost; Harberger (1 | strong | medium | ⚠ MISSING | ## Tržišna moć i monopol — odlomak nakon definicij |
| 5 | Nepovoljan izbor i uvjet urušavanja tržišta (limuni) | Akerlof (1970), 'The Market for Lemons' | strong | high | [@akerlof1970] | ## Asimetrične informacije — nakon odlomka o Akerl |
| 6 | Moralni hazard kao agentov izbor pri djelomičnom snošenju troška | Standardni model osiguranja s pokrićem θ (pri | optional | medium | [@stiglitz2015] | ## Moralni hazard i informacijske mjere države — u |

**[1] Samuelsonov uvjet za optimalnu ponudu javnog dobra**

```latex
$$
\sum_{i=1}^{n} MRS^{i}_{G,x} \;=\; MRT_{G,x}
$$
```
*Zašto:* Ovo je najkanonskija jednadžba cijelog poglavlja i jedina koja izravno formalizira ono što interaktivni graf javnih dobara već vizualizira (vertikalno zbrajanje ΣDᵢ = MSB siječe MC). Bez nje poglavlje vizualno pokazuje, ali nigdje ne zapisuje, zašto se kod javnog dobra zbrajaju granične stope supstitucije (a ne količine kao kod privatnog dobra). Spoj 'zbroj graničnih koristi = granični trošak' student odmah povezuje sa Q* na grafu. Citat samuelson1954 već je u references.bib i koristi se u uvodu sekcije.

**[2] Lindahlove cijene kao cjenovni dual Samuelsonova uvjeta**

```latex
$$
\sum_{i=1}^{n} p_i \;=\; MC(G), \qquad p_i = MRS^{i}_{G,x}
$$
```
*Zašto:* Lindahlove cijene izrijekom su navedene među kanonskim modelima teme, a u poglavlju potpuno nedostaju. One su prirodni 'cjenovni blizanac' Samuelsonova uvjeta: svaki korisnik plaća personaliziranu cijenu jednaku svojoj graničnoj koristi, a zbroj cijena pokriva granični trošak (Σpᵢ = ΣMRS = MC = MRT, čime se dual zatvara). Pedagoški pokazuje da TEORIJSKI postoji tržišno rješenje za javno dobro, ali da ga free-rider problem ruši. Treba dodati referencu u references.bib (uz already-present musgrave1959 kao izvor reprinta).

**[3] Pigouov porez jednak marginalnom vanjskom trošku**

```latex
$$
t^{*} \;=\; MEC(Q^{*}) \;=\; MSC(Q^{*}) - MPC(Q^{*})
$$
```
*Zašto:* Pigouov porez je eksplicitno najavljen kanonski model, a trenutno se objašnjava samo prozno i grafom negativne eksternalije koji već crta razmak MSC−MPC. Jednadžba t* = MEC(Q*) je notacijski jeftina (koristi MPC/MSC oznake koje graf uvodi) i izravno povezuje sekciju o društvenom trošku ugljika s formalnim pravilom. U Coaseovoj sekciji već stoji t = D'(q*); ova varijanta vraća isti rezultat u jezik MPC/MSC krivulja, pa zatvara petlju graf→jednadžba→empirija (SCC).

**[4] Mrtvi teret monopola i Lernerov indeks tržišne moći**

```latex
$$
\frac{P_M - MC}{P_M} \;=\; \frac{1}{|\varepsilon_D|}, \qquad DWL = \tfrac{1}{2}\,(P_M - MC)\,(Q_C - Q_M)
$$
```
*Zašto:* Graf monopola već ispisuje maržu i ima klizač za |εD|, ali nigdje ne zapisuje vezu marže i elastičnosti. Lernerov indeks formalizira intuiciju klizača (manja elastičnost → veća marža → veći trokut). Formula za DWL = ½(Pm−MC)(Qc−Qm) podudara se s kodom (0.5·|Pm−MC_at_Qm|·|Qc−Qm|, gdje je MC uzet u Qm). Lerner referenca nije u .bib; harberger1954 jest i pokriva DWL trokut, čime se izbjegava drugi missing citat.

**[5] Nepovoljan izbor i uvjet urušavanja tržišta (limuni)**

```latex
$$
p \;=\; \mathbb{E}\!\left[\,q \mid \text{prodavač nudi po } p\,\right], \qquad \bar q(p) < p \;\Rightarrow\; \text{kolaps tržišta}
$$
```
*Zašto:* Akerlofov model trenutno je čisto verbalan, a graf fig-nepovoljan-izbor prikazuje POSLJEDICU (pomak ponude) bez mehanizma. Jednadžba uvjeta racionalnih očekivanja na cijenu je srce Akerlofova rezultata: kvalitetni se povlače kad prosječna kvaliteta ponuđenih dobara padne ispod cijene, što pokreće spiralu. 'High' jer uvodi očekivanje i uvjetnu distribuciju i implicitno normalizira spremnost na plaćanje na q; primjerenija kao izborni dodatak ili fusnota, uz obaveznu jednu rečenicu intuicije.

**[6] Moralni hazard kao agentov izbor pri djelomičnom snošenju troška**

```latex
$$
\max_{e}\; B(e) - (1-\theta)\,C(e) \;\Longrightarrow\; B'(e_M) = (1-\theta)\,C'(e_M), \quad \frac{\partial e_M}{\partial \theta} > 0
$$
```
*Zašto:* Graf moralnog hazarda eksplicitno računa eM = m/(2k(1−θ)) i pokazuje da rizik raste s pokrićem θ, ali tekst tu mehaniku nigdje ne zapisuje. Uvjet B'(e) = (1−θ)C'(e) točno odgovara kodu (B'=m, C'=2k·e, m=(1−θ)·2k·eM). 'Optional' jer je graf već vrlo eksplicitan s brojevima i klizačem; jednadžba dodaje formalnu strogost ali ne nužnu informaciju. Citat stiglitz2015 već je u .bib.

**Gdje produbiti (izvodi / vježbe):** Tri konkretne prilike, poredane po vrijednosti. (1) PROŠIRENA IZVEDBA SAMUELSONOVA UVJETA uz graf javnih dobara: okvir koji izvodi ΣMRS = MRT iz maksimizacije zbroja korisnosti uz resursno ograničenje, te kontrast s privatnim dobrom (MRSⁱ = MRT za svakoga; horizontalno vs. vertikalno zbrajanje). Spojilo bi dvije postojeće slike (privatno vs. javno dobro) i Samuelsonovu/Lindahlovu jednadžbu — najveća pojedinačna dobit. (2) NOVA callout-vjezba uz monopol/Lerner: numerički zadatak iz P = 120 − Q i MC = 30 + 0,5Q (MR = 120 − 2Q): student izračuna Q_M (MR = MC → 120 − 2Q = 30 + 0,5Q → Q_M = 36), P_M = 84, konkurentsku ravnotežu (D = MC → 120 − Q = 30 + 0,5Q → Q_C = 60, P_C = 90), Lernerov indeks (Pm−MC(Qm))/Pm = (84−48)/84 ≈ 0,43 i DWL = ½·(84−48)·(60−36) = 432. NAPOMENA RECENZENTA: u izvornom prijedlogu navedeni brojevi (P_C = 60, DWL kao ½(Pm−MC)(Qc−Qm)) ne slažu se s P=120−Q, MC=30+0,5Q — pri tim funkcijama je P_C = 90, ne 60, i MC(Q_M)=48; treba ili uskladiti funkcije ili brojeve prije objave. Strukturni blizanac postojeće Pigou-vježbe. (3) PROŠIRENJE ZAVRŠNE callout-vjezbe (dio e): dodati eksplicitan zahtjev da student zapiše uvjet π'(q) = D'(q) u brojevima (granični profit = granična šteta = 30) i izračuna naknadu u oba režima dodjele prava, čime se Coaseova sekcija spaja s numeričkom vježbom. Ni jedna prilika ne dira OJS/R grafove ni B&W blizance.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Provjereno protiv references.bib i OJS/R koda u poglavlju. (1) SAMUELSON ΣMRS=MRT: OK — LaTeX valjan, jednadžba točna (kanonski uvjet za čisto javno dobro; zbroj MRS, ne količina). Citat samuelson1954: present. Tier core/medium realan. (2) LINDAHL Σpᵢ=MC, pᵢ=MRSⁱ: OK — LaTeX valjan, matematički točno i ispravno opisan kao cjenovni dual (Σpᵢ=ΣMRS=MC=MRT). Citat lindahl1919: MISSING — treba ga dodati; alternativno se izvor može vezati uz already-present musgrave1959 (reprint). Tier strong/medium realan. (3) PIGOU t*=MEC=MSC−MPC: OK — LaTeX valjan, dekompozicija točna i dosljedna grafu fig-neg-eksternalija i Coaseovu t=D'(q*). Citat pigou1920: present. UPOZORENJE O PLASMANU: izvorni insertionPoint navodi sekciju POZITIVNIH eksternalija, ali porez (t>0) pripada uz NEGATIVNU eksternaliju; za pozitivnu je dual subvencija (t<0). Tier core/low realan. (4) LERNER (P−MC)/P=1/|ε| i DWL=½(Pm−MC)(Qc−Qm): OK (jednadžbe) — LaTeX valjan; Lernerov indeks i trokut DWL standardni i točni; DWL se podudara s kodom (0.5·|Pm−MC_at_Qm|·|Qc−Qm|). UPOZORENJE: graf ispisuje 'Monopolsku maržu' kao (Pm−Pc)/Pc (marža nad konkurentskom CIJENOM), što NIJE Lernerov indeks (Pm−MC)/Pm; tekst NE smije tvrditi da jednadžba daje broj koji graf prikazuje — samo da formalizira intuiciju klizača. Citat lerner1934: MISSING; za DWL dio dostupan je present harberger1954. Tier strong/medium realan. (5) AKERLOF p=E[q|·], q̄(p)<p ⇒ kolaps: OK — LaTeX valjan; uvjet racionalnih očekivanja i kolapsa korektan uz implicitnu normalizaciju spremnosti na plaćanje na q (Akerlofova konvencija). Citat akerlof1970: present. Tier strong/high realan — difficulty pravilno označen 'high'; zadržati uz rečenicu intuicije ili kao izborni dodatak. (6) MORALNI HAZARD B'(eM)=(1−θ)C'(eM), ∂eM/∂θ>0: OK — LaTeX valjan; FOC i komparativna statika TOČNO odgovaraju kodu (B(e)=m·e, C(e)=1+k·e², eM=m/(2k(1−θ)), pa eM raste s θ). Citat stiglitz2015: present. Napomena: u modelu je e 'rizik', ne 'effort' u standardnom smislu — zadržati to čitanje radi dosljednosti s grafom ('Porast rizika'). Tier optional/medium realan. ZAKLJUČAK: ni jedna jednadžba nije matematički pogrešna; nije bilo potrebe za ispravkom latex polja. Otvoreno: dodati lindahl1919 i lerner1934 u references.bib; uskladiti brojeve u predloženoj monopol-vježbi (P_C=90 i MC(Q_M)=48 pri P=120−Q, MC=30+0,5Q, ne P_C=60); premjestiti Pigou uz negativnu eksternaliju; u monopol-tekstu razdvojiti Lernerov indeks od prikazane 'marže'.

</details>

---

## 03-distribucijska-funkcija — Distribucijska funkcija (država i pitanje pravednosti)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje ima nula display jednadžbi; sva četiri div-okruženja (#def-opadajuca-granicna-korisnost, #def-rawlsov-pristup, #def-paternalizam, #def-lorenz-gini) iskazana su isključivo verbalno, a Gini se računa u OJS/R kodu grafa (1−2∫L dp) ali se ta formula nikad ne ispisuje u tekstu.

**Jaz:** Cijeli mjerni aparat nejednakosti, koji je u javnoj ekonomiji potpuno standardan i kvantitativan, izložen je samo riječima. Konkretno: (1) Lorenzova krivulja i Ginijev koeficijent definirani su verbalno u #def-lorenz-gini, a formula G=1−2∫L(p)dp postoji samo kao komentar u kodu grafa fig-lorenz (red 184), ne kao display jednadžba koju student vidi; nedostaje i ekvivalentna kovarijacijska formula koja Gini čini izračunljivim. (2) Utilitaristički argument za preraspodjelu (opadajuća granična korisnost, jednakost graničnih žrtava) iznesen je isključivo brojčanim primjerom od 1.000 eura bez ijednog simbola, premda ima čistu formalizaciju preko zbroja korisnosti i uvjeta U'(y). (3) Funkcije društvenog blagostanja (utilitaristička, Rawlsova/maximin, te opća Atkinson/konstantne nesklonosti nejednakosti) spominju se kao tri normativna pristupa, ali se nigdje ne pišu kao SWF, čime se gubi to da su utilitarizam i Rawls dva ruba istog parametriziranog kontinuuma. (4) Mirrlees–Saez optimalni porez i Okunova razmjena opisani su riječima iako Saezova formula s elastičnošću već je verbalno parafrazirana u tekstu (red 68) pa je jednadžba prirodan sljedeći korak. (5) Spominju se gornji dohodovni udjeli i ograničenja Ginija (red 138), ali bez ijedne alternativne mjere (Atkinson, Theil) koja bi pokazala zašto izbor mjere nosi vrijednosni sud o averziji prema nejednakosti.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Ginijev koeficijent (površinska i kovarijacijska formula) | Lorenz–Gini; Gini (1912), kovarijacijski izra | core | medium | [@atkinson2015] | def-lorenz-gini (unutar ili neposredno nakon defin |
| 2 | Utilitaristički optimum i jednakost graničnih žrtava | Utilitaristička funkcija blagostanja s opadaj | strong | medium | [@pigou1920] | Utilitarizam (nakon def-opadajuca-granicna-korisno |
| 3 | Funkcije društvenog blagostanja kao kontinuum (utilitarizam ↔ Rawls) | Bergson–Samuelson SWF; Atkinson (1970) klasa  | strong | high | ⚠ MISSING | Rawlsov pristup pravednosti (na kraju sekcije, kao |
| 4 | Atkinsonov indeks nejednakosti i ekvivalentni jednako-raspodijeljeni dohodak | Atkinson (1970) | strong | high | ⚠ MISSING | Efikasnost i pravednost — neposredno nakon rasprav |
| 5 | Optimalna gornja granična porezna stopa (sufficient-statistics formula) | Diamond–Saez top-rate; Saez (2001), Mirrlees  | core | medium | [@saez2001] | Utilitarizam — neposredno nakon rečenice o Saezu i |
| 6 | Theilov indeks (entropijska mjera i dekompozicija) | Theil (1967), Shorrocks (1980) za dekompozici | optional | high | ⚠ MISSING | Efikasnost i pravednost — uz Atkinsonov indeks, ka |

**[1] Ginijev koeficijent (površinska i kovarijacijska formula)**

```latex
$$
G = 1 - 2\int_0^1 L(p)\,dp = \frac{2\,\operatorname{cov}\!\big(y,\,F(y)\big)}{\bar{y}}
$$
```
*Zašto:* Formula koju graf već numerički koristi (G=1−2∫L dp) postaje vidljiva studentu i izravno povezuje krivulju s brojem koji se ispisuje u kutu grafa, čime se zatvara jaz između koda i teksta. Druga, kovarijacijska jednakost pokazuje da je Gini operativna, izračunljiva statistika nad podacima (kovarijanca dohotka i njegova ranga), a ne tek geometrijska apstrakcija, što je nezaobilazno za temu i izravno hrani postojeću callout-vjezbu s pet kućanstava.

**[2] Utilitaristički optimum i jednakost graničnih žrtava**

```latex
$$
\max_{\{y_i\}}\ W=\sum_{i=1}^{n} U(y_i)\quad\text{uz}\quad \sum_{i=1}^{n} y_i=Y\ \Longrightarrow\ U'(y_i)=\lambda\ \ \forall i
$$
```
*Zašto:* Pretvara verbalni primjer od 1.000 eura u opće načelo: pod istom konkavnom U i fiksnim ukupnim dohotkom, maksimizacija zbroja korisnosti traži izjednačavanje granične korisnosti, što uz identične preferencije implicira potpunu jednakost dohotka. Time se egzaktno objašnjava i sljedeća rečenica poglavlja o 'ekstremnom obliku' koji vodi prema potpunoj jednakosti, a uvjet U'(y_i)=λ student može i grafički pročitati. Pripremni teret je umjeren jer se oslanja samo na koncept granične korisnosti koji je već uveden.

**[3] Funkcije društvenog blagostanja kao kontinuum (utilitarizam ↔ Rawls)**

```latex
$$
W_\varepsilon=\begin{cases}\dfrac{1}{1-\varepsilon}\displaystyle\sum_{i=1}^{n} y_i^{\,1-\varepsilon}, & \varepsilon\neq 1\\[2ex]\displaystyle\sum_{i=1}^{n}\ln y_i, & \varepsilon=1\end{cases}\qquad \varepsilon=0:\ \text{utilitarizam},\quad \varepsilon\to\infty:\ W=\min_i y_i\ (\text{Rawls})
$$
```
*Zašto:* Jedna parametrizirana SWF pokazuje da utilitarizam (ε=0, ravnodušnost prema raspodjeli) i Rawlsov maximin (ε→∞, brine samo za najlošije stojećeg) nisu suparničke filozofije nego dva ruba istog kontinuuma averzije prema nejednakosti ε. To je pedagoški izuzetno moćno jer ujedinjuje dvije zasebne sekcije poglavlja i daje studentu jedan parametar kojim se mjeri 'koliko društvu smeta nejednakost'. Difficulty je high zbog eksponenta i graničnih slučajeva, pa pripada strong, a ne core razini.

**[4] Atkinsonov indeks nejednakosti i ekvivalentni jednako-raspodijeljeni dohodak**

```latex
$$
A_\varepsilon = 1-\frac{1}{\bar{y}}\left(\frac{1}{n}\sum_{i=1}^{n} y_i^{\,1-\varepsilon}\right)^{\frac{1}{1-\varepsilon}},\qquad \varepsilon\ge 0,\ \varepsilon\neq 1
$$
```
*Zašto:* Poglavlje već eksplicitno priznaje (red 138) da Gini ima slijepu točku i da izbor mjere nosi vrijednosni sud; Atkinsonov indeks je upravo mjera u koju je taj vrijednosni sud (parametar averzije ε) ugrađen otvoreno. A_ε se čita izravno kao postotak dohotka koji bi društvo bilo spremno žrtvovati da se postigne jednakost, što daje opipljivu interpretaciju i prirodno se nadovezuje na Okunovo 'šuplje vedro'. Dijeli istu ε-klasu kao prethodni prijedlog, pa se njih dva mogu uvesti zajedno uz jednu pripremu notacije. Napomena: za ε=1 indeks prelazi u oblik 1−(geometrijska sredina)/ȳ, pa je u latexu eksplicitno isključen ε≠1.

**[5] Optimalna gornja granična porezna stopa (sufficient-statistics formula)**

```latex
$$
\tau^{*}=\frac{1-g}{1-g+a\,e}
$$
```
*Zašto:* Tekst na redu 68 već verbalno opisuje točno ovu formulu ('optimalna stopa preko elastičnosti oporezivog dohotka, oblika raspodjele i društvene sklonosti preraspodjeli') pa je ispisivanje jednadžbe minimalan korak koji verbalnu parafrazu pretvara u provjerljiv izraz. Tri ulaza (a = Paretov parametar debljine repa, e = elastičnost oporezivog dohotka, g = društvena vrijednost dodatnog eura najbogatijima) izravno pokazuju kako se kod τ* sukobljavaju pravednost i učinkovitost, čime se Okunova razmjena dobiva egzaktan oblik. Ekonomski je centralna za temu i citat već postoji u bibliografiji.

**[6] Theilov indeks (entropijska mjera i dekompozicija)**

```latex
$$
T=\frac{1}{n}\sum_{i=1}^{n}\frac{y_i}{\bar{y}}\ln\!\frac{y_i}{\bar{y}}\;=\;T_{\text{unutar}}+T_{\text{između}}
$$
```
*Zašto:* Theil dodaje jedinstveno svojstvo koje ni Gini ni Atkinson ne nude jednako čisto: aditivnu dekompoziciju ukupne nejednakosti na komponentu 'između skupina' i 'unutar skupina', što je metodološki vrijedno za empirijsku analizu (npr. koliko nejednakosti dolazi od razlika među regijama nasuprot unutar njih). Optional je jer poglavlje već ima dvije snažne mjere (Gini, Atkinson) i treća bi mogla opteretiti studenta; preporuča se samo ako se želi metodološki callout o dekompoziciji.

**Gdje produbiti (izvodi / vježbe):** Tri konkretne prilike za prošireni formalni tretman. (1) Postojeća callout-vjezba (red 273) s pet kućanstava (10, 20, 30, 40, 100) idealna je za worked derivation Ginija: dodati pod-zadatak u kojem student izračuna G iz srednje-razlike ili površinske formule prije i poslije transfera, čime jednadžba iz prijedloga 1 dobiva numeričku provjeru i povezuje se s grafom fig-lorenz. Napomena za autore: provjerena vrijednost je G≈0,38 za zadane dohotke (NE 0,42 kako je analitičar naveo) — izračun po srednjoj-razlici daje srednju apsolutnu razliku 36 tisuća, μ=40 tisuća, G=36/(2·40)=0,45 za uzorak, odnosno populacijski G=0,36; vrijednost treba autoritativno fiksirati prije nego se uvrsti u rješenje. (2) U sekciji 'Utilitarizam', nakon primjera od 1.000 eura, umetnuti kratki #prp- okvir 'Jednakost graničnih žrtava' koji formalno izvodi U'(y_i)=λ iz maksimizacije ∑U(y_i) uz proračunsko ograničenje (prijedlog 2) i u dvije rečenice pokazuje kako se odatle dobiva utilitaristički argument za jednakost te gdje ga problem poticaja zaustavlja. (3) U sekciji 'Efikasnost i pravednost' postaviti formalni analitički okvir koji ε-klasu SWF (prijedlog 3), Atkinsonov indeks (prijedlog 4) i Okunovo šuplje vedro spaja u jednu sliku: averzija prema nejednakosti ε određuje koliko je 'curenja' (1−A_ε) društvo spremno podnijeti, što daje egzaktnu mjeru Okunove metafore. Dodatno, callout-empirija (red 140) s OECD podacima (Gini 0,47→0,31) mogla bi se proširiti numeričkim zadatkom u kojem student izračuna postotno smanjenje Ginija (≈34%) kao mjeru redistributivne snage poreza i transfera.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Sve LaTeX-sintakse provjerene su renderibilnima (cases, dfrac, displaystyle, \\[2ex] sve validni). Sve su jednadžbe matematički/ekonomski TOČNE — nije nađena nijedna greška u predznaku ili smjeru, kao ona ranija s udjelom predlagatelja. Detalji po prijedlogu:

(1) Gini — TOČNO. Površinski izraz G=1−2∫L(p)dp identičan je trapeznom kodu grafa (red 184), ✓. Kovarijacijski izraz G=2cov(y,F(y))/ȳ je standardni Lerman–Yitzhaki (1984) oblik gdje je F rang/CDF, ✓. CITAT: [@atkinson2015] PRESENT (references.bib red 1564, 'Inequality: What Can Be Done?'). Lerman–Yitzhaki/Gini 1912 nisu zasebni ključevi, ali atkinson2015 ih pokriva. valueTier core / difficulty medium realan.

(2) Utilitaristički optimum — TOČNO. Lagrangian L=∑U(y_i)−λ(∑y_i−Y), FOC U'(y_i)=λ ∀i, ✓; uz identičnu konkavnu U slijedi jednakost dohodaka, ✓. CITAT ISPRAVLJEN: analitičar je polje označio 'MISSING' iako u svojoj bilješci priznaje da ključ pigou1920 POSTOJI — provjereno, pigou1920 je PRESENT (references.bib red 1745, Pigou 'The Economics of Welfare', 1920). Citat-polje promijenjeno u [@pigou1920]. valueTier strong / difficulty medium realan.

(3) ε-klasa SWF — TOČNO. Aditivni Atkinson-tip SWF W=1/(1−ε)·∑y_i^(1−ε) za ε≠1 i ∑ln y_i za ε=1 je kanonski, ✓. Granični slučajevi ✓: ε=0 → ∑y_i (utilitarizam/neutralnost prema raspodjeli); ε→∞ → min_i y_i (Rawls maximin). LaTeX cases s \\[2ex] valjan. CITAT: atkinson1970 MISSING — točno označeno; predloženi ključ atkinson1970 (Atkinson 1970, JET 2(3):244–263) nije u references.bib (postoji samo atkinson1980 Atkinson–Stiglitz i atkinson2015). Treba dodati. difficulty high → ispravno svrstano u strong, ne core.

(4) Atkinsonov indeks — TOČNO. A_ε=1−(1/ȳ)[(1/n)∑y_i^(1−ε)]^(1/(1−ε)) je standardni oblik za ε≠1, ✓. UPOZORENJE (minorno): izvorni latex je naveo samo ε≥0, ali izraz je nedefiniran/drugog oblika za ε=1 (tada A=1−geom.sredina/ȳ); u latex polju dodan uvjet ε≠1 i napomena u rationale. Interpretacija 'udio dohotka koji bi se žrtvovao za jednakost' točna, ✓. CITAT: atkinson1970 MISSING (isti ključ kao #3). difficulty high / strong realan.

(5) Optimalna gornja stopa — TOČNO. τ*=(1−g)/(1−g+a·e) je kanonska Diamond–Saez top-rate formula (a=Paretov parametar, e=elastičnost oporezivog dohotka, g=društvena marginalna težina na vrhu), ✓; smjer ispravan — veći e ⇒ niži τ*, veći a (tanji rep) ⇒ niži τ*, manji g ⇒ viši τ*. Model-polje precizirano na 'Diamond–Saez'. CITAT: [@saez2001] PRESENT (references.bib red 748, RES 2001, doi 10.1111/1467-937X.00166). valueTier core / difficulty medium realan; ekonomski najcentralnija jednadžba poglavlja.

(6) Theilov indeks — TOČNO. T=(1/n)∑(y_i/ȳ)ln(y_i/ȳ) je Theil-T (GE(1)) indeks, ✓; aditivna dekompozicija T=T_unutar+T_između je dokazano svojstvo GE klase (Shorrocks 1980), ✓. CITAT: theil1967 MISSING — točno označeno; ni theil1967 ni shorrocks1980 nisu u references.bib, treba dodati barem theil1967. valueTier optional / difficulty high realan.

SAŽETAK CITATA: 3 PRESENT (atkinson2015, pigou1920, saez2001), 2 MISSING ključa za dodati (atkinson1970 — koristi se u #3 i #4; theil1967 — #6). Jedina sadržajna izmjena u prijedlozima: citat-polje #2 ispravljeno iz pogrešnog 'MISSING' u [@pigou1920]; manje preciziranje latexa #4 (ε≠1) i modela #5 (Diamond–Saez). DODATNO UPOZORENJE autorima: numerička vrijednost Ginija za vježbu u detailedAnalysisOpportunities (analitičar je naveo 0,42) ne provjerava se — populacijski G za dohotke 10/20/30/40/100 iznosi ≈0,36, a uzorački ≈0,45; vrijednost treba fiksirati prije objave rješenja.

</details>

---

## 04-stabilizacijska-funkcija (Stabilizacijska funkcija — država i makroekonomska stabilnost)

**Trenutno:** 6 display jednadžbi · formalni modeli: da  
Theorem/def okruženja vezana uz politički ciklus iskazana su formalno (Phillipsova krivulja s očekivanjima, Nordhausova funkcija glasova i gubitka, Alesinine jednadžbe inflacijskog iznenađenja, švicarska kočnica zaduživanja), ali def-okruženja u jezgri stabilizacijske teorije — fiskalni multiplikator, automatski stabilizatori, histereza, stabilnost kao javno dobro — iskazana su isključivo verbalno, bez ijedne jednadžbe.

**Jaz:** Poglavlje je u drugoj polovici (politički ciklusi) matematički bogato, ali je prva polovica — koja nosi naslovnu temu stabilizacijske funkcije — gotovo posve verbalna. Tri kanonska modela koja se prozno objašnjavaju a imaju standardni i jednostavan formalni tretman u javnoj ekonomiji nedostaju u potpunosti. Prvo, fiskalni multiplikator se definira riječima i čak prikazuje grafom (Keynesijanski križ), a OJS/R kod interno računa Y=A0/(1-c) i 1/(1-c), no ta ključna formula i njezina izvedba iz geometrijskog reda nigdje se ne pojavljuju u tekstu kao display jednadžba — student vidi rezultat na grafu, ali ne i algebru iza njega. Drugo, dinamika javnog duga ḃ=(r-g)b-s ne spominje se nigdje, premda poglavlje opetovano govori o fiskalnom prostoru, održivosti, riziku rasta duga (Reinhart-Rogoff) i konsolidaciji — to je kanonska jednadžba koja te pojmove čini preciznima. Treće, Taylorovo pravilo se u odjeljku o podjeli rada monetarne i fiskalne politike opisuje isključivo prozno (središnja banka snižava referentnu stopu), bez formalnog pravila reakcije. Otvoreno gospodarstvo i porezni multiplikator također se spominju samo verbalno (multiplikator manji u otvorenom gospodarstvu) bez izraza koji to pokazuje.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Ravnoteža keynesijanskog križa i izvedba multiplikatora | Keynesijanski model dohotka i izdataka / mult | core | low | [@keynes1936] | ## Fiskalni multiplikator — neposredno nakon def-f |
| 2 | Porezni multiplikator i multiplikator u otvorenom gospodarstvu | Keynesijanski multiplikatori — porezni multip | strong | medium | [@blanchard2017] | ## Fiskalni multiplikator — nakon raspravnog retka |
| 3 | Dinamika javnog duga i fiskalna održivost | Jednadžba akumulacije duga / uvjet (r−g) (Dom | core | medium | [@reinhart2009] | ## Diskrecijska fiskalna politika — uz raspravu o  |
| 4 | Taylorovo pravilo monetarne reakcije | Taylorovo pravilo (Taylor 1993) | strong | medium | [@degrauwe2022] | ### Podjela rada monetarne i fiskalne politike — u |
| 5 | Učinak automatskih stabilizatora na multiplikator | Automatski stabilizatori kao prigušenje multi | optional | low | [@tanzi2011] | ## Automatski stabilizatori — nakon def-automatski |

**[1] Ravnoteža keynesijanskog križa i izvedba multiplikatora**

```latex
$$
Y = \frac{A_0}{1-c}, \qquad \frac{\Delta Y}{\Delta G} = \frac{1}{1-c} = 1 + c + c^2 + c^3 + \cdots
$$
```
*Zašto:* Ovo je središnja jednadžba cijelog odjeljka i nosi naslovni pojam poglavlja. Graf je već crta (interno u kodu Y=A0/(1-c)), pa jednadžba samo eksplicira ono što student ionako vidi geometrijski. Izvedba kao geometrijski red 1+c+c^2+... pedagoški pokazuje zašto je učinak veći od početnog impulsa (prozno se to već tvrdi u retku 50), čime se intuicija 'dodatna potrošnja postaje nečiji dohodak' pretvara u zatvorenu formulu. Najniža moguća notacijska cijena za najveći dobitak.

**[2] Porezni multiplikator i multiplikator u otvorenom gospodarstvu**

```latex
$$
\frac{\Delta Y}{\Delta T} = \frac{-c}{1-c}, \qquad \frac{\Delta Y}{\Delta G} = \frac{1}{1-c(1-t)+m}
$$
```
*Zašto:* Tekst (redak 58 i 'Što isprobati' redak 215) izrijekom tvrdi da je porezni multiplikator negativan i po iznosu manji od multiplikatora potrošnje, a callout-empirija govori o otvorenosti gospodarstva kao odrednici veličine — obje tvrdnje jednadžba čini transparentnima. Lijevi izraz objašnjava zašto -c/(1-c) < 1/(1-c) (porez djeluje posredno), desni pokazuje kako porez t i sklonost uvozu m smanjuju multiplikator, što izravno podupire empirijsku tvrdnju o otvorenosti. Drži se istog c kao prethodni prijedlog pa ne uvodi novu jezgrenu notaciju.

**[3] Dinamika javnog duga i fiskalna održivost**

```latex
$$
\dot{b} = (r - g)\,b - s
$$
```
*Zašto:* Poglavlje opetovano operira pojmovima 'fiskalni prostor', 'održivost javnih financija', 'rastući javni dug povećava ranjivost' i 'konsolidacija' (retci 44, 399, 590), ali nigdje ne daje jednadžbu koja te pojmove formalizira. Ovo je najstandardnija jednadžba fiskalne održivosti u javnim financijama i ima snažnu intuiciju koja se grafički/verbalno objašnjava: ako je kamatna stopa r veća od stope rasta g, dug raste sam od sebe osim ako primarni saldo s to ne pokrije. Izravno povezuje stabilizaciju s konstitucionalnom ekonomikom (švicarska kočnica je već u poglavlju) i opravdava zašto fiskalni prostor uopće postoji kao ograničenje. NAPOMENA RECENZENTA: predloženi [@reinhart2009] već postoji u bibliografiji i koristi se točno uz raspravu o riziku rasta duga (redak 590), pa je on dovoljan citat; dodavanje Domara (1944) je opcionalno i preporučljivo radi atribucije same jednadžbe, ali nije nužno za uvrštenje.

**[4] Taylorovo pravilo monetarne reakcije**

```latex
$$
i_t = r^{*} + \pi_t + \phi_\pi\,(\pi_t - \pi^{*}) + \phi_y\,(y_t - y^{*})
$$
```
*Zašto:* Odjeljak prozno opisuje monetarnu transmisiju i podjelu rada, a Taylorovo pravilo je kanonski formalni izraz reakcijske funkcije središnje banke i bilo je izrijekom navedeno u zadatku kao kanonski model za temu. Jednadžba čini preciznom tvrdnju o tome kako središnja banka reagira na inflaciju i jaz proizvodnje te zašto na donjoj nominalnoj granici (zero lower bound, redak 409) pravilo 'puca' — kad izračunata i_t padne ispod nule, monetarna politika gubi prostor i fiskalni multiplikator raste. Pedagoški povezuje već prisutnu raspravu o ZLB-u s razlogom zašto fiskalna politika tada preuzima primat. Simetrična s Phillipsovom krivuljom koja je već u poglavlju. NAPOMENA RECENZENTA: izvorni prijedlog je [@taylor1993] označio kao MISSING; taj ključ doista NE postoji u references.bib, ali predloženi udžbenički zamjenski izvor [@degrauwe2022] (i [@baldwinwyplosz2022]) POSTOJI — citat je stoga promijenjen u [@degrauwe2022]. Ako se želi izvorna atribucija, dodati Taylor (1993).

**[5] Učinak automatskih stabilizatora na multiplikator**

```latex
$$
\frac{\Delta Y}{\Delta A_0} = \frac{1}{1 - c\,(1 - t)}, \qquad t>0 \;\Rightarrow\; \frac{1}{1-c(1-t)} < \frac{1}{1-c}
$$
```
*Zašto:* Odjeljak prozno tvrdi (retci 385–387) da zemlje s progresivnijim porezom i većim javnim sektorom imaju snažnije automatske stabilizatore, ali ne pokazuje mehanizam. Ova jednadžba čini to mjerljivim: porezna stopa ovisna o dohotku t ulazi u nazivnik i smanjuje multiplikator, pa veći t znači manju amplitudu ciklusa za isti šok A0 — upravo definicija stabilizatora. Koristi isti c iz prethodnih prijedloga, dodaje samo t, pa je notacijski jeftina i zatvara petlju s multiplikatorom iz prethodnog odjeljka. Optional jer dijeli notaciju s prijedlogom o poreznom/otvorenom multiplikatoru i može se spojiti s njim ako se želi štedjeti na jednadžbama.

**Gdje produbiti (izvodi / vježbe):** Tri konkretne prilike. (1) Worked derivation multiplikatora kao callout-vjezba ili kratak formalni umetak u odjeljku Fiskalni multiplikator. Postojeća callout-vjezba na kraju poglavlja (retci 616–622) već traži da student izračuna 1/(1−c) i porast BDP-a, ali sama formula 1/(1-c) nigdje se prije ne izvodi u tekstu — idealno je dodati eksplicitnu izvedbu iz geometrijskog reda (Y=A0+cY ⇒ Y=A0/(1-c)) kao 3-4 retka prije grafa, čime vježba na kraju dobiva svoje formalno uporište. Provjereno: zadana vrijednost vježbe c=0,75 daje 1/(1−0,75)=4, a dio (b) 4×4=16 mlrd EUR — interno konzistentno. (2) Numerička callout-vjezba uz dinamiku duga: zadati student da uz r=4%, g=2%, b=80% BDP-a izračuna primarni saldo s potreban da dug ostane stabilan (s=(r-g)b=0,02×0,80=1,6% BDP-a), čime ḃ=(r-g)b-s postaje konkretan broj i izravno priprema poglavlje o konstitucionalnoj ekonomici. (3) Formalni analitički okvir koji povezuje Taylorovo pravilo i ZLB: kratak umetak u ### Podjela rada koji pokazuje da kad izračunata i_t iz Taylorova pravila padne ispod nule, monetarni instrument je iscrpljen, pa fiskalni multiplikator (već definiran ranije) postaje veći — time se dvije jednadžbe iz poglavlja (multiplikator i Taylorovo pravilo) eksplicitno vežu i opravdava se već prisutna tvrdnja iz [@blanchard2017] o većem multiplikatoru na ZLB-u (redak 409). Sve tri prilike koriste notaciju koja se već uvodi u predloženim jednadžbama, pa ne povećavaju kognitivni teret iznad nužnog.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

SVE JEDNADŽBE PROVJERENE I MATEMATIČKI TOČNE. Nije pronađena nijedna greška u predznacima, smjeru nejednakosti ili obliku formule. Ispravljena su DVA pogrešna statusa citata (proposali 3 i 4 označili su kao MISSING reference koje zapravo postoje u references.bib).

[1] Keynesijanski multiplikator Y=A0/(1-c), ΔY/ΔG=1/(1-c)=1+c+c²+... — TOČNOST: OK. Ravnoteža AE=A0+cY uz AE=Y daje Y=A0/(1-c); geometrijski red 1+c+c²+...=1/(1-c) za 0<c<1 konvergira ispravno. Identično je internom OJS/R kodu poglavlja (multG=1/(1-c), Y0=A0/(1-c)). LaTeX valjan, renderira se bez greške. CITAT: [@keynes1936] — PRESENT (redak 483). RAZINA: valueTier=core i difficulty=low realni; ovo je naslovna jednadžba i najjeftinija notacijski.

[2] Porezni i otvoreni multiplikator ΔY/ΔT=-c/(1-c), ΔY/ΔG=1/(1-c(1-t)+m) — TOČNOST: OK. Lump-sum porezni multiplikator -c/(1-c) podudara se s kodom poglavlja (multT=-c/(1-c)). Otvoreni multiplikator: uz raspoloživi dohodak (1-t)Y i graničnu sklonost uvozu m, inducirana potrošnja po jedinici Y je c(1-t)-m, pa je nazivnik 1-c(1-t)+m — ispravno. |−c/(1-c)| < 1/(1-c) vrijedi jer c<1, što potkrepljuje tvrdnju iz teksta. LaTeX valjan. CITAT: [@blanchard2017] — PRESENT (redak 208). RAZINA: strong/medium realno; uvodi t i m kao novu notaciju ali zadržava isti c.

[3] Dinamika duga ḃ=(r-g)b-s — TOČNOST: OK. Standardna aproksimacija akumulacije omjera duga: promjena omjera = (r-g)·b minus primarni saldo s. Predznaci ispravni (r>g ⇒ dug raste bez dovoljnog primarnog suviška). \\dot{b} renderira se ispravno. CITAT: ISPRAVLJENO — izvorni prijedlog flagirao Domar (1944) kao MISSING i ponudio [@reinhart2009] kao zamjenu; [@reinhart2009] doista POSTOJI (redak 1890) i već se koristi uz raspravu o riziku duga (redak 590), pa je citation polje promijenjeno s 'MISSING...' na [@reinhart2009]. Domar nije u bibu i nije nužan. RAZINA: core/medium realno.

[4] Taylorovo pravilo i_t=r*+π_t+φ_π(π_t-π*)+φ_y(y_t-y*) — TOČNOST: OK. Kanonski Taylor (1993) oblik: nominalna stopa = neutralna realna stopa + tekuća inflacija + reakcija na inflacijski jaz + reakcija na jaz proizvodnje. Predznaci i članovi ispravni. LaTeX valjan (zvjezdice kao superskripti, grčka slova). CITAT: ISPRAVLJENO — izvorni [@taylor1993] doista NIJE u references.bib (potvrđeno grepom), ali predloženi udžbenički zamjenski izvori [@degrauwe2022] (redak 1933) i [@baldwinwyplosz2022] (redak 1943) POSTOJE; citation polje promijenjeno na [@degrauwe2022]. Preporuka: dodati pravi Taylor (1993) ako se želi primarna atribucija. RAZINA: strong/medium realno.

[5] Automatski stabilizatori ΔY/ΔA0=1/(1-c(1-t)), t>0 ⇒ 1/(1-c(1-t))<1/(1-c) — TOČNOST: OK. Uz proporcionalni porez na dohodak multiplikator je 1/(1-c(1-t)); budući da c(1-t)<c za t>0, nazivnik je veći pa je razlomak manji — smjer nejednakosti ISPRAVAN i ilustrira prigušenje ciklusa. LaTeX valjan. CITAT: [@tanzi2011] — PRESENT (redak 848). RAZINA: optional/low realno; dijeli notaciju s prop. 2.

SAŽETAK CITATA: present — keynes1936, blanchard2017, tanzi2011, reinhart2009, degrauwe2022, baldwinwyplosz2022. Nepostojeći u bibu (i ispravno zamijenjeni): taylor1993, domar1944. Nijedan citat nije 'wrong-key'.

</details>

---

## 05-javni-izbor.qmd — Što je to javni izbor i zašto nas se tiče?

**Trenutno:** 3 display jednadžbi · formalni modeli: da  
Poglavlje je iznad prosjeka formalizirano — Downsov instrumentalni račun R = P·B − C, Savage-Ferejohn-Fiorina minimax žaljenje ρ_g = C, ρ_o = B − C s pragom B > 2C, plus izvod N* = B/C u callout-vježbi; definicije (#def-) iskazane su verbalno, ali su tri od četiri kanonska modela već formalno prisutna.

**Jaz:** Glavni jaz nije u nedostatku jednadžbi nego u jednoj koja nedostaje točno ondje gdje je proza najbliža formuli. Ekspresivno glasanje (sekcija „Instrumentalno i ekspresivno glasanje") cijelo se gradi na Riker-Ordeshookovom D-članu i izrijekom citira @riker1968 i @brennan1993, ali kanonska jednadžba R = pB − C + D nikad nije zapisana, premda je njezina prethodnica R = P·B − C već u poglavlju (red 46) i premda upravo D-član razrješava paradoks koji sekcija opisuje. To je najjasniji „prozno-ali-ne-formalno" propust. Drugo, korak P ≈ 1/N ključan je za cijeli argument (spominje se u OJS komentaru i prozi, red 48 i 169), ali nije izdvojen kao relacija premda nosi svu težinu zaključka da R postaje negativan. Treće, definicija racionalnog nepoznavanja (#def-racionalno-nepoznavanje) iskazana je čisto verbalno iako ima trivijalan formalni prag (trošak informiranja vs. P · očekivani dobitak) koji bi je vezao uz već uvedeni P. Teorem medijanskog glasača, naveden kao kanonski model, NE pripada ovdje — obrađen je u pogl. 6 i 7 (fig-medijanski-glasac) i ovdje bi bio duplikat; spominjem ga samo kao opcijsku poveznicu.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Račun glasanja s ekspresivnim D-članom (Riker-Ordeshookov račun) | Riker i Ordeshook (1968), proširenje Downsova | core | low | [@riker1968] | Instrumentalno i ekspresivno glasanje — uz odlomak |
| 2 | Vjerojatnost odlučujućeg glasa pada s veličinom biračkog tijela | Downsov paradoks neglasanja (1957); skaliranj | strong | low | [@downs1957] | Birači i paradoks glasanja — odmah nakon jednadžbe |
| 3 | Prag racionalnog nepoznavanja (racionalne ignorancije) | Downs (1957), ekonomika informiranja birača;  | strong | low | [@downs1957] | Birači i paradoks glasanja — uz #def-racionalno-ne |
| 4 | Žaljenje kao razlika do najboljeg ishoda (matrica žaljenja) | Savage (1951) minimax žaljenje; primjena na i | optional | medium | [@savage1951] | Glasanje pod neizvjesnošću i minimax žaljenje — uz |
| 5 | Logika koncentriranih koristi i raspršenih troškova | Olson (1965), logika kolektivnog djelovanja;  | optional | low | [@olson1965] | Zašto su odluke države često neintuitivne? — uz od |

**[1] Račun glasanja s ekspresivnim D-članom (Riker-Ordeshookov račun)**

```latex
$$
R = pB - C + D
$$
```
*Zašto:* Ovo je kanonska jednadžba koja razrješava paradoks i koju poglavlje već usmeno opisuje a da je ne zapiše. Doslovno je jedan dodatni član (+ D) na već uvedenu formulu iz reda 46, pa je kognitivni trošak za studenta nula, a dobitak velik: vidi se da ekspresivno glasanje nije napuštanje računa nego njegovo proširenje. Notacija je identična onoj u poglavlju (P odn. p, B, C), pa veže dvije sekcije u jedinstven okvir.

**[2] Vjerojatnost odlučujućeg glasa pada s veličinom biračkog tijela**

```latex
$$
P \approx \frac{1}{N} \quad\Longrightarrow\quad R \approx \frac{B}{N} - C
$$
```
*Zašto:* Korak P ≈ 1/N nosi cijeli zaključak (da R postaje negativan kako N raste) i već je ugrađen u OJS i R kod grafa (R = B/N − C), ali u tekstu postoji samo kao usputni komentar. Izdvajanjem u relaciju student vidi odakle dolazi krivulja na grafu i zašto je vodoravna os logaritamska, a izvod N* = B/C iz callout-vježbe (red 362) dobiva svoju polaznu jednadžbu. Spaja prozu, graf i vježbu u jedan formalni lanac uz minimalnu notaciju.

**[3] Prag racionalnog nepoznavanja (racionalne ignorancije)**

```latex
$$
p \cdot \Delta B < c_i \;\Longrightarrow\; \text{biraču se ne isplati informirati}
$$
```
*Zašto:* Definicija je iskazana čisto verbalno, a njezina je jezgra usporedba dvaju iznosa koju knjiga već zna izraziti. Mali prag p·ΔB < c_i (gdje je c_i trošak informiranja, a ΔB dobitak od bolje odluke) pokazuje da racionalno nepoznavanje izvire iz istog malog P kao i paradoks glasanja — to je ista logika primijenjena na informiranje umjesto na izlazak. Pedagoški povezuje dva pojma koja student inače doživljava kao odvojena i koristi već uvedeni simbol p.

**[4] Žaljenje kao razlika do najboljeg ishoda (matrica žaljenja)**

```latex
$$
r(a,\theta) = \Big(\max_{a'} u(a',\theta)\Big) - u(a,\theta), \qquad a^{*} = \arg\min_{a}\ \max_{\theta}\ r(a,\theta)
$$
```
*Zašto:* Poglavlje primjenjuje minimax na dva ishoda (ρ_g = C, ρ_o = B − C) bez opće definicije žaljenja. Dodavanje r(a,θ) i pravila argmin-max čini #def-minimax-zaljenje formalno potpunom i pokazuje da je B − C upravo žaljenje izvedeno iz razlike do najboljeg ishoda, a ne ad hoc izraz. Medium jer uvodi indekse a i θ; isplati se samo ako se želi pojačati veza s teorijom odlučivanja. Inače je verbalna definicija dovoljna za udžbenik.

**[5] Logika koncentriranih koristi i raspršenih troškova**

```latex
$$
\frac{B_{\text{skupina}}}{m} \gg c, \qquad c = \frac{T}{N}\to 0
$$
```
*Zašto:* Cijela sekcija počiva na jednoj asimetriji koju proza opisuje rječito, ali nikad ne kvantificira. Mali izraz pokazuje zašto je organiziranje racionalno za malu skupinu (B/m po članu velik) a apatija racionalna za poreznog obveznika (c = T/N teži nuli kako N raste) — ista 1/N logika kao u paradoksu glasanja, čime se zatvara unutarnja simetrija poglavlja. Opcijsko jer je sekcija sintezna i upućuje na pogl. 8; jednadžba je korisna, ali poglavlje preživljava i bez nje.

**Gdje produbiti (izvodi / vježbe):** 1) Worked derivation u callout-vježbi (proširenje postojeće, red 361–363): vježba već traži izvod N* = B/C. Dodati drugi numerički korak koji od studenta traži da iz proširenog računa R = pB − C + D izračuna koliko velik D-član mora biti da glasanje postane isplativo pri N = 1.000.000, B = 5000 €, C = 10 €. ARITMETIKA PROVJERENA: uvjet je D > C − B/N = 10 − 5000/1.000.000 = 10 − 0,005 = 9,995 €, što je u skladu s prijedlogom analitičara. NAPOMENA: zaključna formulacija „ekspresivna korist ne mora biti velika" pedagoški je donekle labava — D mora biti tek nešto malo manji od punog troška C = 10 € (zapravo gotovo jednak C), a poanta je da MALI instrumentalni član B/N = 0,005 € ne uspijeva pomoći, pa cijeli teret pada na D. Točnija pouka: „instrumentalni doprinos B/N zanemariv je, pa D mora gotovo u cijelosti pokriti trošak C." To prirodno nadograđuje prijedlog #1 i postojeću vježbu bez nove notacije. 2) Formalni analitički okvir (mali umetak, ne callout) u sekciji minimax: prikazati punu 2×2 matricu žaljenja (radnje glasati/ostati × stanja tijesno/neodlučujuće) kao tablicu prije jednadžbe ρ_g = C, ρ_o = B − C — student tada vidi odakle dolaze oba izraza i zašto je P irelevantan; veže se uz prijedlog #4. 3) Nova callout-vjezba u sekciji o ekspresivnom glasanju (trenutačno bez ijedne vježbe): zadatak da se za zadane p = 1/N, B, C odredi prag D na kojem R prelazi u plus (D = C − B/N), te da student usporedi taj prag s troškom C i zaključi koliko je „mala" ekspresivna korist dovoljna. 4) Mogući formalni okvir za racionalno nepoznavanje uz #def-racionalno-nepoznavanje: kratka usporedba praga informiranja p·ΔB < c_i s pragom glasanja, kao dvije strane iste medalje malog P — pogodno za marginalnu bilješku ili jednu rečenicu, ne za puni callout.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

SVE JEDNADŽBE MATEMATIČKI TOČNE; SVI CITATI PRISUTNI. Nijedan latex nije bilo potrebno mijenjati.

[1] R = pB − C + D (Riker-Ordeshook): TOČNOST OK. Kanonski Riker-Ordeshookov račun glasanja (1968); D-član kao dodatak Downsovoj formuli ispravno postavljen, predznak +D točan (povećava nagradu). LaTeX trivijalno valjan. CITAT: [@riker1968] present (references.bib red 677, Riker & Ordeshook 1968, APSR). NAPOMENA O NOTACIJI: poglavlje u redu 46 koristi VELIKO P (R = P·B − C), a prijedlog malo p. Identično je matematički, ali radi dosljednosti udžbenika preporučujem ujednačiti — ili zapisati R = PB − C + D (uskladiti s redom 46), ili u prijedlogu #2 i #3 također prijeći na isti simbol. Razina core/low realna: jedan dodatni član na već poznatu formulu.

[2] P ≈ 1/N ⟹ R ≈ B/N − C: TOČNOST OK. Supstitucija P=1/N u R=PB−C daje točno R=B/N−C; identično kodu grafa (OJS red 85, R red 134) i polaznoj jednadžbi za N*=B/C iz vježbe (red 362). Smjer (R pada i postaje negativan kako N raste) ispravan. LaTeX valjan (\\approx, \\Longrightarrow, \\frac). CITAT: [@downs1957] present (red 331). Razina strong/low realna.

[3] p·ΔB < c_i ⟹ ne isplati se informirati: TOČNOST OK. Smjer nejednakosti ispravan — kad je trošak informiranja c_i veći od očekivanog dobitka p·ΔB, racionalno je ostati neinformiran; to je upravo verbalna jezgra #def-racionalno-nepoznavanje (red 171–173). LaTeX valjan (\\cdot, \\Delta, indeks c_i, tekst u \\text). CITAT: [@downs1957] present. NAPOMENA: poželjno u prozi izrijekom definirati ΔB (dobitak od bolje odluke) i c_i (trošak informiranja) da se izbjegne dvosmislenost; p neka bude isti simbol kao u [1]/[2]. Razina strong/low realna.

[4] r(a,θ)=max u − u; a*=argmin max r (Savage minimax žaljenje): TOČNOST OK. Standardna Savageova definicija žaljenja (žaljenje = najbolji ostvarivi ishod u danom stanju minus ishod odabrane radnje) i pravilo minimax (minimiziraj najveće žaljenje po stanjima) ispravno zapisani; smjer oduzimanja točan (žaljenje ≥ 0). Provjereno da reproducira primjenu u poglavlju: za radnju „glasati" žaljenje je C, za „ostati" je B−C, što se slaže s redom 203 (ρ_g=C, ρ_o=B−C). LaTeX valjan: \\Big, \\max_{a'}, \\arg\\min, \\arg\\max svi se renderiraju u MathJax/KaTeX (\\arg je standardni operator). CITAT: [@savage1951] present (red 759); poglavlje uz to već koristi [@ferejohnfiorina1974] (present, red 370) za primjenu — oba ispravna, paziti da se u prijedlogu ne navede nepostojeći ključ „ferejohn1974" (u bibliografiji je SAMO ferejohnfiorina1974). Razina optional/medium realna — uvođenje indeksa a i θ jedini je skok u apstrakciji u cijelom poglavlju.

[5] B_skupina/m ≫ c, c=T/N→0 (Olson): TOČNOST OK kao ilustrativna asimetrija. Po članu male skupine korist B/m je velika, po poreznom obvezniku trošak c=T/N teži nuli kako N raste — to je upravo simetrija s paradoksom glasanja (1/N) koju proza opisuje. LaTeX valjan (\\frac, \\gg, \\to, \\text). MANJA NAPOMENA (ne greška): c=T/N→0 vrijedi uz prešutnu pretpostavku da je ukupni trošak T fiksan dok N→∞; za fiksni transfer to stoji, ali bi se moglo u prozi reći „pri danom ukupnom trošku T". Nije pogreška, samo preciznost. CITAT: [@olson1965] present (red 624). Razina optional/low realna.

WORKED-DERIVATION (detailedAnalysisOpportunities #1): brojčano provjereno D > C − B/N = 10 − 0,005 = 9,995 € — TOČNO. Jedina zamjerka je interpretativna, ne računska (vidi napomenu u detailedAnalysisOpportunities): D mora gotovo u cijelosti pokriti C, pa formulacija „ekspresivna korist ne mora biti velika" zavarava; preciznije je reći da instrumentalni dio B/N postaje zanemariv.

ZAKLJUČAK: prihvatiti sve prijedloge bez izmjene latexa. Jedina sustavna preporuka prije umetanja: ujednačiti simbol vjerojatnosti (P vs p) kroz prijedloge #1–#3 s postojećim P iz reda 46, i u tekstu eksplicitno imenovati ΔB i c_i.

</details>

---

## 05a-teorija-igara — Teorija igara i zakonodavno pregovaranje

**Trenutno:** 6 display jednadžbi · formalni modeli: da  
Baron-Ferejohnov dio je potpuno formaliziran jednadžbama (proračunsko ograničenje, v=1/n, udio predlagatelja, derivacije komparativne statike, korisnosti uz stranačku koheziju), no def-nashova-ravnoteza i sve tri matrične igre iskazane su samo verbalno i numerički, bez ijedne opće jednadžbe za Nashovu ravnotežu ili dominantnu strategiju.

**Jaz:** Poglavlje je iznadprosječno matematizirano u drugoj polovici (Baron-Ferejohn), ali prva polovica (strateške igre) ostaje čisto verbalno-numerička. Konkretno, samo riječima se tretira: (1) definicija Nashove ravnoteže i dominantne strategije — iskazana prozno u def-nashova-ravnoteza bez ijednog formalnog uvjeta nejednakosti; (2) opća ordinalna struktura zatvorenikove dileme — matrica daje samo brojeve (5>3>1>0), ali nigdje ne stoji kanonska nejednakost T>R>P>S koja definira igru bez obzira na konkretne iznose, niti uvjet za društvenu (ne)učinkovitost 2R>T+S; (3) Fehr-Schmidtova averzija prema nejednakosti — eksplicitno citirana [@fehrschmidt1999] u callout-empirija i opisana rečenicom 'model u kojem korisnost pada s razlikom prema drugima', ali bez funkcije korisnosti koja to formalizira; (4) unatražna indukcija / mješovite strategije u igri kukavice — igra ima dvije ravnoteže u čistim strategijama i prirodnu treću u mješovitima, no mješovita ravnoteža (koja kvantificira 'stratešku neizvjesnost' iz teksta) se ni ne spominje. Najveći jaz je nesrazmjer: predlagateljev udio izveden do parcijalnih derivacija, dok središnji pojmovi cijele discipline (Nashova ravnoteža, dominacija) nemaju nijedan simbol.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Formalni uvjet Nashove ravnoteže i stroge dominacije | Nashova ravnoteža (Nash 1950/1951); standardn | core | medium | [@osborne2004] | Strateške igre i kolektivno djelovanje — unutar/od |
| 2 | Ordinalna struktura zatvorenikove dileme i uvjet neučinkovitosti | Zatvorenikova dilema, kanonski ordinalni pore | core | low | [@hardin1968] | Strateške igre i kolektivno djelovanje — neposredn |
| 3 | Funkcija korisnosti s averzijom prema nejednakosti | Fehr-Schmidtov model averzije prema nejednako | strong | medium | [@fehrschmidt1999] | Eksperimentalna provjera modela — unutar ::: {.cal |
| 4 | Mješovita ravnoteža u igri kukavice | Mješovite strategije i ravnoteža u igri kukav | optional | high | [@osborne2004] | Kukavica i koordinacija, sukob i institucije — nak |
| 5 | Unatražna indukcija i rezervacijska cijena kao uvjet ravnoteže | Unatražna indukcija u sekvencijalnoj igri (Ba | optional | medium | [@baronferejohn1989] | Baron-Ferejohnov model zakonodavnog pregovaranja — |

**[1] Formalni uvjet Nashove ravnoteže i stroge dominacije**

```latex
$$
u_i(s_i^*, s_{-i}^*) \;\ge\; u_i(s_i, s_{-i}^*) \quad \forall s_i \in S_i,\; \forall i. \qquad s_i' \text{ strogo dominira } s_i'' \iff u_i(s_i', s_{-i}) > u_i(s_i'', s_{-i})\;\; \forall s_{-i}.
$$
```
*Zašto:* Nashova ravnoteža je nosivi pojam cijelog poglavlja, a trenutno postoji samo kao rečenica. Jedna jednadžba s notacijom s_{-i} (strategije svih osim i) pretvara verbalnu definiciju u operativan kriterij koji student može provjeriti na svakoj od tri matrice koje slijede. Notacija s_{-i} ionako je potrebna i kasnije, pa se ovdje isplati uvesti je jednom. Bez ove jednadžbe poglavlje govori o ravnoteži a nikad je ne definira simbolički.

**[2] Ordinalna struktura zatvorenikove dileme i uvjet neučinkovitosti**

```latex
$$
T > R > P > S \quad\text{(napast } T \text{, nagrada } R \text{, kazna } P \text{, naivčina } S\text{)}, \qquad 2R > T + S.
$$
```
*Zašto:* Trenutno matrica daje brojeve 5/3/1/0, ali student ne vidi da igra nije igra zbog tih brojeva nego zbog poretka T>R>P>S — isti zaključak vrijedi za bezbroj numeričkih matrica. Uvjet 2R>T+S dodatno objašnjava zašto je obostrana kooperacija društveno optimalna (a ne naizmjenično izrabljivanje), što tekst tvrdi ('Pareto inferiorna') ali ne dokazuje. Najjeftiniji mogući formalni dodatak s najvećim konceptualnim povratom — povezuje konkretnu matricu s općom klasom igara.

**[3] Funkcija korisnosti s averzijom prema nejednakosti**

```latex
$$
u_i(x) = x_i \;-\; \frac{\alpha_i}{n-1}\sum_{j \ne i}\max\{x_j - x_i,\,0\} \;-\; \frac{\beta_i}{n-1}\sum_{j \ne i}\max\{x_i - x_j,\,0\}, \qquad \alpha_i \ge \beta_i \ge 0,\; \beta_i < 1.
$$
```
*Zašto:* Callout već imenuje točno taj model i citira [@fehrschmidt1999], ali ostaje na opisu. Jedna jednadžba pokazuje zašto predlagatelj nudi više od rezervacijske cijene: drugi član (α, zavist) kažnjava nepovoljnu nejednakost partnera, pa preniska ponuda partneru smanjuje njegovu korisnost i povećava rizik odbijanja. Ovo je most između teorijskog Baron-Ferejohna i eksperimentalnog odstupanja koje poglavlje opisuje, i objašnjava obje empirijske anomalije (izdašnije ponude i jednake podjele) jednom funkcijom. NAPOMENA RECENZENTA: u originalu (Fehr-Schmidt 1999) sume su normirane faktorom 1/(n-1) — dodan u latex radi vjernosti izvoru; u dvočlanom slučaju (predlagatelj naspram jednog partnera, n=2) faktor je 1 pa se izraz svodi na jednostavni oblik bez nazivnika.

**[4] Mješovita ravnoteža u igri kukavice**

```latex
$$
p^* = \frac{u(\text{ustraje},\text{popušta}) - u(\text{popušta},\text{popušta})}{[\,u(\text{ustraje},\text{popušta}) - u(\text{popušta},\text{popušta})\,] + [\,u(\text{popušta},\text{ustraje}) - u(\text{ustraje},\text{ustraje})\,]}, \qquad p^* = \frac{2-0}{(2-0)+(-1-(-10))} = \frac{2}{11}.
$$
```
*Zašto:* Tekst tvrdi da 'ako obje strane ustraju, sustav završava u katastrofi' i govori o 'strateškoj neizvjesnosti', ali ne kvantificira koliko je vjerojatan slom. Mješovita ravnoteža daje upravo to: pozitivnu vjerojatnost da obje strane ustraju (p*^2) i time pozitivnu vjerojatnost katastrofe — formalni temelj tvrdnje da krizni pregovori realno prijete kolapsom. Označeno kao optional/high jer mješovite strategije traže najviše pripreme; preporuka je staviti je u callout-vjezba ili fusnotu, ne u glavni tok, da ne zastraši studente.

**[5] Unatražna indukcija i rezervacijska cijena kao uvjet ravnoteže**

```latex
$$
x_i \ge \delta v \;=\; \frac{\delta}{n} \;\Longleftrightarrow\; \text{zastupnik } i \text{ glasuje ZA}; \qquad x_p^* = \arg\max_{x}\Big\{\,x_p : \#\{i : x_i \ge \tfrac{\delta}{n}\} \ge \tfrac{n+1}{2}\Big\}.
$$
```
*Zašto:* Poglavlje već verbalno provodi unatražnu indukciju ('odbije li zastupnik, dobiva δv, pa je rezervacijska cijena δ/n'), ali nigdje ne imenuje ni formalizira sam princip unatražne indukcije, premda je on naveden kao kanonski model teme. Eksplicitni uvjet glasanja (x_i ≥ δ/n ⟺ ZA) i prikaz da predlagatelj rješava maksimizaciju uz ograničenje većine povezuje verbalni argument s logikom optimizacije. Optional jer je sadržaj već prisutan u prozi — ovo je formalizacija postojećeg, ne nov sadržaj.

**Gdje produbiti (izvodi / vježbe):** 1) PROŠIRENI IZVOD (worked derivation) za Baron-Ferejohna: poglavlje navodi rezultat v=1/n kao posljedicu simetrije i usvajanja u prvoj rundi, ali preskače fiksnu točku. Vrijedan dodatak je formalni okvir koji izvodi v iz rekurzivne jednadžbe v = (1/n)·x_p + ((n-1)/n)·(očekivana isplata kao nepredlagatelj), pokazujući da u stacionarnoj ravnoteži v=1/n nije pretpostavka nego rezultat — idealno kao numerirani izvod ili sklopivi (collapsible) okvir nakon formule za x_p, jer trenutno taj korak izgleda kao tvrdnja, a ne dokaz.\n\n2) CALLOUT-VJEZBA s numeričkim zadatkom na zatvorenikovoj dilemi: postojeća vježba pokriva samo Baron-Ferejohna. Dodati kratku vježbu uz @tbl-zatvorenik koja traži da student (a) identificira dominantnu strategiju provjerom uvjeta u_i(D,·) > u_i(C,·) za oba poteza protivnika, (b) provjeri T>R>P>S na zadanoj matrici, (c) izračuna gubitak učinkovitosti 2R−2P kooperacije naspram defekcije. Time se nova jednadžba o ordinalnoj strukturi odmah uvježbava.\n\n3) CALLOUT-VJEZBA na igri kukavice s mješovitom ravnotežom: numerički zadatak koji traži izračun p* iz matrice @tbl-kukavica (točan rezultat p*=2/11≈0,18) i potom vjerojatnost obostrane katastrofe p*²=4/121≈0,033, pokazujući studentu da 'strateška neizvjesnost' iz teksta ima mjerljivu posljedicu (~3% u zadanim brojevima). Drži high-difficulty matematiku izvan glavnog toka.\n\n4) FORMALNI ANALITIČKI OKVIR za Fehr-Schmidta primijenjen na pregovaranje: kratki okvir koji uvrsti Fehr-Schmidtovu korisnost u predlagateljev problem i pokazuje da minimalna ponuda partneru raste s α (zavišću) — eksplicitno premošćuje 'predviđanje modela' i 'eksperimentalni nalaz' iz @tbl-bf-eksperiment, koji su sada samo verbalno suprotstavljeni.\n\n5) Postojeća @tbl-zatvorenik, @tbl-kukavica i @tbl-koordinacija mogu dobiti generičke (simboličke) inačice matrica (T/R/P/S za dilemu) uz numeričke, čime se vizualno povezuje opća struktura igre s konkretnim primjerom — niska barijera, visok pedagoški povrat.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Vidi gore — sva verifikacija u jednom polju.

</details>

---

## 06-kolektivni-izbor (Kolektivni izbor)

**Trenutno:** 2 display jednadžbi · formalni modeli: ne  
Sva theorem/def okruzenja (Condorcet, Arrow, jednovrsnost, medijanski glasac, moc dnevnog reda) iskazana su iskljucivo verbalno; jedine dvije display jednadzbe (vektor pozicijskih tezina i jedan Bordin brojcani primjer) nalaze se u sekciji o Bordinom pravilu.

**Jaz:** Poglavlje je konceptualno bogato, ali gotovo cijela formalna srz teme zivi samo u prozi. Condorcetov ciklus opisan je rijecima (A>B>C>A) bez zapisa parne vecinske relacije. Arrowljev teorem naveden je kao popis pet uvjeta bez ijedne formule, premda svaki uvjet (IIA, Pareto, tranzitivnost) ima standardan i kratak formalni zapis. Jednovrsne preferencije definirane su rijecima ("privlacnost monotono pada s udaljenoscu") iako postoji kanonska jednolinijska formalizacija preko jednomodalne korisnosti na liniji. Teorem o medijanskom glasacu izrecen je bez ijednog izraza, premda je upravo tvrdnja "medijan tuce svaku alternativu u parnom glasovanju" elementarna i graficki intuitivna. Mayev teorem (jedina karakterizacija proste vecine preko anonimnosti, neutralnosti i pozitivne responzivnosti) uopce se ne spominje, a kanonski je za temu. Gibbard-Satterthwaite je opisan verbalno bez formalnog uvjeta strateske otpornosti. Bordino bodovanje ima opci primjer, ali nema opcu formulu zbroja preko svih biraca. Logrolling ima geometrijski graf, ali ne i algebarski uvjet pod kojim paket prolazi (zbroj neto-koristi pozitivan za svakog clana koalicije).

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Vecinska relacija i Condorcetov pobjednik | Condorcetova parna vecinska relacija (Condorc | core | low | [@condorcet1785] | Condorcetov paradoks (uz #def-condorcetov-paradoks |
| 2 | Jednovrsne preferencije i teorem o medijanskom glasacu | Single-peakedness + median voter theorem (Bla | core | low | [@black1948] | Jednovrsne preferencije i medijanski glasac (uz #d |
| 3 | Arrowljevi uvjeti u formalnom zapisu (osobito IIA) | Arrow opci teorem nemogucnosti (Arrow 1951/19 | strong | medium | [@arrow1963] | Arrowljev teorem nemogucnosti (uz @tbl-arrow-uvjet |
| 4 | Mayev teorem o prostoj vecini | May, karakterizacija proste vecine (May 1952) | strong | low | ⚠ MISSING | Bordino pravilo i pozicijsko glasovanje (na pocetk |
| 5 | Opca formula Bordina zbroja | Borda count, opci oblik (Borda 1781; Young 19 | strong | low | [@borda1781] | Bordino pravilo i pozicijsko glasovanje (uz #def-b |
| 6 | Uvjet isplativosti trgovanja glasovima | Logrolling kao razmjena neto-koristi (Buchana | optional | low | [@buchanan1962] | Kontrola dnevnog reda i politika kompromisa (uz @f |

**[1] Vecinska relacija i Condorcetov pobjednik**

```latex
$$
x \succ_M y \iff \#\{\,i : x \succ_i y\,\} > \#\{\,i : y \succ_i x\,\}, \qquad x^{*}\ \text{je Condorcetov pobjednik} \iff x^{*} \succ_M y\ \ \forall\, y \neq x^{*}
$$
```
*Zašto:* Daje paradoksu i Condorcetovu pobjedniku precizan zapis koji se inace u tekstu samo opisuje strelicama (A>B>C>A). Notacija #{...} je studentima citljiva i izravno povezuje verbalnu definiciju s onim sto interaktivni graf vec racuna. Bez ovog zapisa cijela ostatak poglavlja (McKelvey, Bordin protuprimjer, medijan) operira pojmom Condorcetova pobjednika koji nikad nije formalno uveden.

**[2] Jednovrsne preferencije i teorem o medijanskom glasacu**

```latex
$$
u_i(x) = -\,\lvert x - x_i \rvert \quad\Longrightarrow\quad x_{\mathrm{med}} \succ_M y \ \ \forall\, y \neq x_{\mathrm{med}}, \qquad x_{\mathrm{med}} = \operatorname{med}\{x_1, x_2, \dots, x_n\}\ \ (n\ \text{neparan})
$$
```
*Zašto:* Pretvara dvije cisto verbalne definicije u jednu jednadzbu koja istodobno formalizira jednovrsnost (jednomodalna korisnost koja pada s udaljenoscu) i sadrzaj teorema (medijan pobjedjuje svaku alternativu). Lako se crta na osi 'manje-vise javne potrosnje' koju tekst vec koristi, pa je idealno graficki potkrijepljena. Postavlja temelj za poglavlje o strankama gdje se medijan ponovno koristi.

**[3] Arrowljevi uvjeti u formalnom zapisu (osobito IIA)**

```latex
$$
\text{(Pareto)}\ \ \bigl(\forall i:\ x \succ_i y\bigr) \Rightarrow x \succ y; \qquad \text{(IIA)}\ \ \bigl(\forall i:\ x \succ_i y \Leftrightarrow x \succ_i' y\bigr) \Rightarrow \bigl(x \succ y \Leftrightarrow x \succ' y\bigr)
$$
```
*Zašto:* Tablica vec verbalno nabraja pet uvjeta; dvije kljucne i najmanje intuitivne (Pareto i neovisnost o nevaznim alternativama) zasluzuju formalni zapis jer je upravo IIA srce 'spoiler' efekta koji callout-praksa spominje. Pokazuje studentu da je IIA precizan logicki zahtjev, a ne maglovito nacelo. Notacija je umjerena i prati vec uvedenu relaciju succ.

**[4] Mayev teorem o prostoj vecini**

```latex
$$
f(\mathbf{d}) = \operatorname{sgn}\!\left(\sum_{i=1}^{n} d_i\right), \qquad d_i \in \{-1, 0, +1\}
$$
```
*Zašto:* Mayev teorem je kanonski za temu i nedostaje u poglavlju: pokazuje da je pri tocno dvije opcije prosta vecina jedinstveno pravilo koje zadovoljava anonimnost, neutralnost i pozitivnu responzivnost. To je pozitivni protuteg Arrowljevu pesimizmu (nemogucnost se javlja tek s tri+ alternative) i objasnjava zasto se 'problem' tema bavi sa >=3 opcije. Funkcija znaka zbroja je vizualno jednostavna i pedagoski moćna.

**[5] Opca formula Bordina zbroja**

```latex
$$
B(x) = \sum_{i=1}^{n} \bigl(m - r_i(x)\bigr), \qquad r_i(x) \in \{1, 2, \dots, m\}
$$
```
*Zašto:* Poglavlje ima konkretan Bordin izracun (B(A)=20 itd.) i vektor tezina, ali ne i opcu formulu koja povezuje rang r_i(x) svakog biraca sa zbrojem. Ovaj zapis generalizira primjer s 19 glasaca na proizvoljan profil i izravno priprema Youngovu karakterizaciju (konzistentnost) koja se vec citira. Niska je teznja jer koristi samo sumu i rang.

**[6] Uvjet isplativosti trgovanja glasovima**

```latex
$$
\text{paket}\ A{+}B\ \text{prolazi} \iff b_1 - l_1 > 0\ \ \wedge\ \ b_2 - l_2 > 0, \qquad \text{drustveni visak} = \sum_{j}(b_j - l_j) \gtrless 0
$$
```
*Zašto:* Interaktivni graf vec racuna tocku A+B preko g i l, ali tekst nigdje ne zapisuje uvjet pod kojim paket prolazi niti razlikuje privatnu isplativost (svaki clan dobiva) od drustvenog viska (zbroj svih neto-koristi, ukljucujuci vanjske strane). Jednadzba precizira kljucnu poantu poglavlja da neto ucinak logrollinga na blagostanje nije unaprijed zadan, sto je sada samo proza.

**Gdje produbiti (izvodi / vježbe):** 1) Worked derivation uz Condorcet: callout-vjezba na kraju poglavlja vec postavlja kombinatorni zadatak (6^3 = 216 profila, 12 cikličkih), ali rjesenje je dano u tekstu. Mogao bi se umetnuti kratak formalni izvod udjela cikličkih ishoda (12/216 = 1/18) s objasnjenjem zasto su to upravo dvije rotacijske trojke pomnozene sa 3! = 6 permutacija oznaka, i kako udio raste s brojem alternativa. To je prirodan numericki dodatak koji ne zahtijeva novu notaciju. NAPOMENA RECENZENTA: 12/216 se uredno skracuje na 1/18 (tocno), ali tekst poglavlja kaze samo 'dvanaest', pa izvod mora eksplicitno povezati 2 rotacijske trojke x 3! = 6 -> 12 da student ne pobrka s 'dvije rotacijske trojke' iz proze.\n2) Formalni analiticki okvir uz Arrowa: kratka 'skica dokaza' kutija (decisive set -> contraction to a single voter) mogla bi se pretvoriti u polu-formalan okvir s definicijom odlucujuce skupine $D \\subseteq N$ ($x \\succ_D y \\Rightarrow x \\succ y$), cime se intuicija dokaza iz proze (sirenje i stezanje odlucnosti) dobiva minimalni simbolicki oslonac. Teznja medium-high, predloziti kao optional callout, ne kao glavni tekst.\n3) Nova callout-vjezba uz Bordu/Condorcet: numericki zadatak u kojem student dobije profil (npr. 3 skupine biraca) i mora a) naci Condorcetova pobjednika preko parnih usporedbi, b) izracunati Bordin zbroj opcom formulom B(x)=sum(m - r_i(x)), c) utvrditi slazu li se. To operacionalizira predlozene jednadzbe 1, 5 i povezuje ih s vec postojecim @fig-borda.\n4) Median voter: mini-izvod (3-5 redaka) zasto medijan pobjedjuje svaku alternativu — za bilo koji y < x_med vise od pola biraca ima idealnu tocku >= x_med pa preferira x_med, simetricno za y > x_med. To je elementarno, graficki prikazivo na osi i idealno za callout uz teorem. NAPOMENA RECENZENTA: izvod vrijedi za neparan n; za paran n nastaje medijanski interval u kojem 'tuce svaku alternativu' postaje slabo (moguci nerijeseni parovi), pa mini-izvod treba u jednoj recenici ograniciti na neparan n ili formulirati 's barem polovicom'.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Provjereni references.bib (root projekta) i puni tekst poglavlja 06. Sintaksa svakog LaTeX-a renderira se bez greske; provjerene relacije, predznaci i smjerovi nejednakosti.

[1] Vecinska relacija / Condorcetov pobjednik — TOCNOST: OK. Stroga nejednakost #{x>i y} > #{y>i x} ispravno definira strogu vecinsku relaciju (zanemaruje izjednacenja, sto je standard); x* tuce svaki y parno — ispravna definicija Condorcetova pobjednika. CITAT: condorcet1785 present (@book, redak 1121). RAZINA: core/low realno; notacija #{...} dostupna studentu i izravno preslikava na ono sto OJS pair() vec racuna.

[2] Single-peakedness + medijan — TOCNOST: ISPRAVLJENO (dodatak, ne ispravak smjera). Sama jednadzba u_i(x) = -|x - x_i| i implikacija da medijan tuce svaki y su tocni, ALI: (a) u_i = -|x-x_i| je SIMETRICNA jednovrsnost, uza pretpostavka od opce single-peakedness — to je legitiman kanonski poseban slucaj i jasno je oznacen kao ilustracija; (b) stroga tvrdnja 'x_med >M y za svaki y' vrijedi za NEPARAN n; za paran n nastaje medijanski interval i relacija postaje slaba. Dodao sam kvalifikator '(n neparan)' u latex da tvrdnja bude tehnicki ispravna. CITAT: black1948 present (@article, redak 87) — tocan rad (Median voter, Black 1948). RAZINA: core/low realno.

[3] Arrowljevi uvjeti (Pareto, IIA) — TOCNOST: OK. Pareto: jednoglasje (svi x>i y) => x>y — ispravno. IIA: ako je za svaki i preferencija izmedu x i y ista u profilima > i >', tada je i drustvena preferencija izmedu x,y ista — to je tocno kanonski zapis IIA (lokalnost na par {x,y}). LaTeX (primovi >_i', >') ispravni. CITAT: arrow1963 present (@article, redak 1442); arrow1951 takodjer present (redak 68) ako se zeli izvornik. RAZINA: strong/medium realno — IIA s primovima je najzahtjevniji zapis u setu, medium je opravdan.

[4] Mayev teorem (sgn zbroja) — TOCNOST: OK. f(d)=sgn(sum d_i), d_i u {-1,0,+1} je standardna i tocna reprezentacija proste vecine; karakterizacija (anonimnost, neutralnost, pozitivna responzivnost) ispravno opisana u rationaleu. CITAT: MISSING — potvrdjeno, may1952 NE postoji u references.bib (0 pogodaka). Bibliografski podaci u prijedlogu su tocni (Econometrica 20(4), 680-684, doi:10.2307/1907651). PREPORUKA: dodati @article{may1952} prije umetanja. RAZINA: strong/low realno; sgn-zbroj je vizualno najjednostavniji izraz u setu.

[5] Opca Bordina formula — TOCNOST: OK, i KONZISTENTNA s vec postojecom def-bordino-pravilo u poglavlju. Def kaze: prvo mjesto m-1, ..., zadnje 0; B(x)=sum(m - r_i(x)) s r=1 (najbolje) daje m-1, s r=m daje 0 — tocno se poklapa. Generalizira brojcani primjer (B(A)=20, B(B)=28, B(C)=9 uz tezine 2,1,0; provjereno: 10*2=20, 10*1+9*2=28, 9*1=9 — tocno). CITAT: borda1781 present (@incollection, redak 167); young1974 present (redak 993). RAZINA: strong/low realno.

[6] Uvjet isplativosti logrollinga — TOCNOST: OK. paket prolazi <=> b1-l1>0 AND b2-l2>0 tocno reproducira uvjet grafa (AB=(g-l, g-l), prolazi kad su obje koordinate >0). Drustveni visak sum_j(b_j-l_j) gtrless 0 ispravno hvata poantu da neto ucinak na blagostanje NIJE unaprijed zadan. NAPOMENA: da bi 'vanjske strane' iz rationalea dosle do izrazaja, indeks j u sumi viska mora eksplicitno obuhvatiti i nesudionike (kojima je b_j=0, ostaje -l_j); preporuka je u proznoj recenici uz jednadzbu reci 'j preko svih pogodjenih, ne samo dvojice iz koalicije'. Privatna isplativost (gornja dva uvjeta) opravdano koristi samo clanove 1,2. CITAT: buchanan1962 present (@book, redak 263); Tullock 1959 spominje se u modelu ali nije nuzan kljuc. RAZINA: optional/low realno.

ZAKLJUCAK: nijedna jednadzba nema gresku predznaka, smjera nejednakosti niti pogresne strukture (za razliku od ranije pronadjene greske 'udio predlagatelja raste s n'). Jedina supstantivna intervencija je kvalifikator neparnog n u [2]. Jedini nedostajuci citat je may1952 [4]. Svi ostali kljucevi (condorcet1785, black1948, arrow1963/arrow1951, borda1781/young1974, buchanan1962) provjereni i present.

</details>

---

## 07-stranke-izbori.qmd — Političke stranke i izbori

**Trenutno:** 1 display jednadžbi · formalni modeli: ne  
Poglavlje ima samo jednu display jednadžbu (Riker-Ordeshookov račun glasovanja R=(P×B)−C+D na liniji 280); svi #def- okviri (Hotelling-Downs, konvergencija, pakiranje, višedimenzionalni prostor, polarizacija) iskazani su isključivo verbalno, bez ijedne formalne nejednakosti ili uvjeta ravnoteže.

**Jaz:** Središnji teorijski rezultat poglavlja — teorem medijanskog glasača i Hotelling-Downsova konvergencija — iznesen je samo prozno i grafom (OJS), iako ima udžbenički standardan formalni iskaz (Downs/Black: u jednodimenzionalnom prostoru s jednovrhnim preferencijama Condorcetov pobjednik je idealna točka medijanskog glasača, a obje stranke konvergiraju u x_m). Trenutno se „konvergencija prema centru" tvrdi bez ijednog uvjeta ravnoteže. Slično, „racionalna neinformiranost" objašnjava se riječima iako izravno slijedi iz već prisutnog Riker-Ordeshookova računa (P×B → 0 jer je P reda 1/N). „Probabilistički model glasanja" — jedan od četiri kanonska modela navedena u zadatku — uopće se ne spominje, premda upravo on formalno objašnjava zašto stranke vagaju biračke skupine (Lindbeck-Weibull/Coughlin), čime se zatvara jaz prema sekciji o pakiranju i ciljanju skupina. „Citizen-candidate" model (Osborne-Slivinski, Besley-Coate) nije spomenut, a izravno se nadovezuje na vježbu (d) o ulasku trećeg igrača i na pitanje zašto se kandidati ne konvergiraju savršeno. McKelveyev teorem o kaotičnosti u višedimenzionalnom prostoru citiran je (@mckelvey1976) ali bez ikakvog formalnog traga (npr. uvjeta Plottove radijalne simetrije za postojanje ravnoteže). Polarizacija se opisuje kao „bimodalna distribucija" bez ijednog izraza za optimalnu poziciju stranke pri mobilizaciji baze.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Teorem medijanskog glasača (formalni iskaz) | Black–Downs medijanski glasač / Hotelling-Dow | core | low | [@black1948; @downs1957] | Medijanski glasač i natjecanje za centar — kao for |
| 2 | Najbolji odgovor stranke i uvjet ravnoteže | Hotelling-Downsov model prostornog natjecanja | strong | medium | [@hotelling1929; @downs1957] | Medijanski glasač i natjecanje za centar — uz odlo |
| 3 | Račun glasovanja i racionalna neinformiranost | Downs–Riker–Ordeshook (granična vrijednost in | core | medium | [@downs1957; @riker1968; @mulligan2003] | Racionalna neinformiranost i izlaznost — odmah nak |
| 4 | Probabilistički model glasanja i vaganje biračkih skupina | Lindbeck–Weibull / Coughlin (probabilistic vo | strong | high | ⚠ MISSING | Kako se stranke natječu za glas — uz odlomak o pak |
| 5 | Citizen-candidate i nesavršena konvergencija | Osborne–Slivinski / Besley–Coate (citizen-can | optional | high | ⚠ MISSING | Medijanski glasač i natjecanje za centar — uz odlo |

**[1] Teorem medijanskog glasača (formalni iskaz)**

```latex
$$
x^{*}_A = x^{*}_B = x_m, \quad \text{gdje je } x_m \text{ takav da } \Pr(x_i \le x_m) \ge \tfrac{1}{2} \ \text{i}\ \Pr(x_i \ge x_m) \ge \tfrac{1}{2}
$$
```
*Zašto:* Ovo je definirajući rezultat cijelog poglavlja i trenutno se nigdje ne iskazuje formalno. Jednadžba je minimalna (definicija medijana + jednakost ravnotežnih pozicija), grafički je već potkrijepljena postojećim OJS grafom fig-medijanski-glasac i izravno pretvara verbalnu tvrdnju o konvergenciji u provjerljiv uvjet. Idealan most između proze i interaktivnog grafa.

**[2] Najbolji odgovor stranke i uvjet ravnoteže**

```latex
$$
V_A(x_A, x_B) = \Pr\!\left(\,|x_i - x_A| < |x_i - x_B|\,\right), \qquad (x_m, x_m) \text{ je ravnoteža jer } V_A(x_m, x_m) \ge V_A(x_A', x_m)\ \ \forall x_A'
$$
```
*Zašto:* Pokazuje ZAŠTO je medijan ravnoteža a ne samo da jest: udio glasova V_A je vjerojatnost da je birač bliži stranci A, a (x_m, x_m) je jedini par bez profitabilnog jednostranog otklona. ISPRAVLJENO: izvorni prijedlog karakterizirao je ravnotežu uvjetom ∂V_A/∂x_A=0, što je u determinističkom Hotelling-Downsovu modelu (glasaj-za-bližega) MATEMATIČKI NETOČNO, jer je V_A step-funkcija s prekidom u x_A=x_B i ondje nije derivabilna; ravnoteža se mora iskazati uvjetom nepostojanja profitabilnog otklona (Nash), ne FOC-om jednakim nuli. FOC vrijedi tek u zaglađenoj/probabilističkoj verziji (prijedlog 4).

**[3] Račun glasovanja i racionalna neinformiranost**

```latex
$$
P \sim \frac{1}{N} \;\Rightarrow\; \lim_{N \to \infty} (P \times B) = 0, \qquad \text{birač se informira dok je } P \cdot \frac{\partial B}{\partial I} \ge \frac{\partial C}{\partial I}
$$
```
*Zašto:* Poglavlje već ima R=(P×B)−C+D i empirijski podatak P≈1/10 milijuna iz @mulligan2003, ali skok od te jednadžbe do zaključka o racionalnoj neinformiranosti je samo verbalan. Granični uvjet informiranja (marginalna korist informiranja P·∂B/∂I pada s P, marginalni trošak ostaje) pretvara intuiciju u mikroekonomski izvod koji student može sam ponoviti i koji se prirodno nastavlja na fiskalnu iluziju. NAPOMENA: izvorni prijedlog je citirao @mulligan2003 (Mulligan-Hunter) za graničnu vrijednost informiranja; mulligan2003 je empirijska procjena učestalosti pivotalnog glasa, a granični model informiranja izvorno je downsovski, pa @mulligan2003 ostavljam samo kao potkrjepu reda P~1/N.

**[4] Probabilistički model glasanja i vaganje biračkih skupina**

```latex
$$
\max_{x} \; \sum_{g} n_g\, \phi_g \, W_g(x), \qquad \phi_g = \text{gustoća neopredijeljenih (swing) birača skupine } g
$$
```
*Zašto:* Probabilistički model je jedan od četiri tražena kanonska modela i jedini koji formalno objašnjava sekciju o pakiranju i diferencijaciji: stranke ne ciljaju medijana nego ponderiraju skupine prema gustoći neopredijeljenih (swing) birača φ_g. Time se „bundling" i ciljanje umirovljenika/poduzetnika iz proze dobiva egzaktan kriterij. Zahtjeva više notacije (težinska društvena funkcija), pa je high i strong, ne core.

**[5] Citizen-candidate i nesavršena konvergencija**

```latex
$$
\text{kandidat ulazi ako } \; p_j \, B_j(x_j) - \delta \; \ge \; 0, \qquad x_j = \text{vlastita idealna točka kandidata}
$$
```
*Zašto:* Objašnjava ono što Hotelling-Downs ne može: zašto se kandidati u stvarnosti ne stope u medijanu, nego zastupaju vlastite idealne točke, jer ulaze tek ako očekivana korist od pobjede (p_j·B_j) nadmašuje trošak kandidature δ. Izravno formalizira vježbu (c) o trećem igraču. Optional jer dodaje četvrti model na već gust teorijski sloj; vrijedan ako se želi formalni odgovor na nesavršenu konvergenciju.

**Gdje produbiti (izvodi / vježbe):** Najjača prilika za proširenu izvedbu (worked derivation) jest u sekciji „Medijanski glasač i natjecanje za centar": umetnuti kratki formalni okvir u tri koraka — (1) definicija udjela glasova V_A kao vjerojatnosti da je birač bliži stranci A, (2) pokazati da svaki jednostrani pomak od (x_m, x_m) gubi većinu, (3) zaključiti da je (x_m, x_m) jedini par bez profitabilnog otklona. VAŽNO: izvedba se mora voditi preko uvjeta nepostojanja profitabilnog otklona (Nash), a NE preko ∂V_A/∂x_A=0, jer u determinističkom modelu V_A nije derivabilna u x_A=x_B; FOC=0 pripada zaglađenom probabilističkom modelu (Lindbeck-Weibull) i njega treba rezervirati za prijedlog 4. To se savršeno spaja s već postojećim interaktivnim grafom (klizači pA, pB izvode upravo taj najbolji odgovor) i s vježbom (b). Druga prilika je proširiti postojeću ::: {.callout-vjezba} (linije 330–337) numeričkim izračunom: za idealne točke 1,3,5,7,9 i pozicije A=3, B=7 eksplicitno prebrojati glasove (A dobiva birače 1 i 3, B dobiva 7 i 9, birač 5 je indiferentan), izračunati udjele i pokazati da pomak A→5 i B→5 vodi u 50:50 podjelu — to operacionalizira teorem medijanskog glasača brojevima. Treća prilika je nova ::: {.callout-vjezba} uz račun glasovanja: dati studentu P=1/10⁷, B=10.000 €, C=20 €, D=25 € i tražiti da izračuna R te pokaže da instrumentalni član P×B=0,001 € čini izlazak racionalnim samo kroz D, čime se brojčano potvrđuje paradoks glasovanja (provjereno: P×B = 10000/10^7 = 0,001 €; R = 0,001 − 20 + 25 = 5,001 € > 0 isključivo zbog D, što je točan i poučan ishod). Eventualni ::: {#prp-} okvir mogao bi nositi formalni iskaz teorema medijanskog glasača (uvjeti: jedna dimenzija, jednovrhne preferencije, neparan broj birača → Condorcetov pobjednik = x_m), čime bi se popunila praznina jer poglavlje trenutno nema nijedno #prp-/#thm- okruženje unatoč tome što počiva na teoremu.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

done

</details>

---

## 08-interesne-skupine (Interesne skupine — iza kulisa politike)

**Trenutno:** 2 display jednadžbi · formalni modeli: da  
Definicije (#def-) iskazane su isključivo verbalno, ali Grossman-Helpman dio nosi dvije prave display jednadžbe (cilj vlade i Protection-for-Sale formulu) plus inline Crawford-Sobel korisnosti, dok su Olson, Tullock i Becker — tri od četiri kanonska modela — formalno neprikazani.

**Jaz:** Poglavlje je za udžbenik već iznadprosječno formalizirano u Grossman-Helpman i Crawford-Sobel dijelu, ali tri kanonska modela koja imaju standardan i jednostavan formalni zapis u literaturi javne ekonomije ostaju potpuno u prozi. (1) Tullockovo natjecanje za rentu (rent-seeking contest) ima cijelu sekciju, OJS graf rente i mrtvog tereta te eksplicitnu tvrdnju u tekstu da se 'cijela renta potroši u nadmetanju' i da 'svaki sudionik ulaže do točke u kojoj je očekivani povrat jednak nuli' — to je doslovan verbalni opis Tullockove funkcije uspjeha u natjecanju i rezultata potpune disipacije rente kod n simetričnih natjecatelja, a nigdje nema jednadžbe. (2) Beckerov model pritiska razrađen je u dva gusta odlomka (ravnoteža pritisaka, proračunsko ograničenje vlade, mrtvi teret koji 'raste s kvadratom porezne stope', izjednačavanje graničnih pritisaka s graničnim troškovima preraspodjele) bez ijedne jednadžbe, premda su funkcija pritiska i uvjet ravnoteže standardni i kratki. (3) Olsonova logika selektivnih poticaja i problem slobodnog jahača iskazani su samo intuitivno; jednostavna nejednakost individualnog poticaja (pojedinačni udio koristi naspram troška doprinosa, koji opada s veličinom skupine) dala bi formalnu okosnicu cijelom uvodnom dijelu. Asimetrija koncentriranih koristi i raspršenih troškova (i pripadajuća callout-vjezba) također zaziva minimalni omjer koncentracije koji je trenutno samo opisan riječima 'nekoliko milijuna prema nekoliko eura'.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Tullockova funkcija uspjeha u natjecanju za rentu | Tullockovo natjecanje za rentu (Tullock rent- | core | low | [@tullock1967] | Lov na rentu — neposredno prije ili uz odlomak 'Gl |
| 2 | Disipacija rente i pravilo ravnoteže lova na rentu | Tullockovo natjecanje za rentu, simetrična ra | strong | medium | [@tullock1989]  (fallback za present ključ; kano | Lov na rentu — uz rečenicu '...kad svaki sudionik  |
| 3 | Uvjet ravnoteže Beckerova modela natjecanja pritisaka | Beckerov model konkurencije interesnih skupin | strong | medium | [@becker1983] | Konkurencija interesnih skupina i prodaja zaštite  |
| 4 | Mrtvi teret oporezivanja kao kvadratna funkcija stope | Harberger / Becker — granični trošak preraspo | core | low | [@harberger1954] | Konkurencija interesnih skupina i prodaja zaštite  |
| 5 | Individualni poticaj i logika selektivnih poticaja | Olsonova logika kolektivnog djelovanja, Mancu | strong | low | [@olson1965] | Logika kolektivnog djelovanja — uz odlomak 'U veli |
| 6 | Omjer koncentracije koristi i raspršenosti troškova | Asimetrija koncentriranih koristi i raspršeni | optional | low | [@olson1965] | Koncentrirane koristi, raspršeni troškovi — uz odl |

**[1] Tullockova funkcija uspjeha u natjecanju za rentu**

```latex
$$
p_i = \frac{x_i^{r}}{\sum_{j=1}^{n} x_j^{r}}
$$
```
*Zašto:* Cijela sekcija opisuje natjecanje za rentu i tvrdi da veće ulaganje povećava izglede za nju, ali nikad ne kaže KAKO. Tullockova funkcija uspjeha vjerojatnost dobivanja rente p_i veže uz vlastiti ulog x_i u odnosu na zbroj svih uloga — to je najprepoznatljivija jednadžba teorije lova na rentu i pretvara grafom prikazani pravokutnik 'rente' u nešto za što se mjerljivo natječe. Parametar r (diskriminacijska oštrina) intuitivno se objašnjava: r=0 je čista lutrija, veliki r je natjecanje 'pobjednik nosi sve'. Niska notacijska cijena, visoka pedagoška dobit.

**[2] Disipacija rente i pravilo ravnoteže lova na rentu**

```latex
$$
x^{*} = \frac{(n-1)}{n^{2}}\,r\,R, \qquad \sum_{i=1}^{n} x_i^{*} = \frac{n-1}{n}\,r\,R
$$
```
*Zašto:* Tekst eksplicitno tvrdi da gubitak 'može biti gotovo jednak' vrijednosti rente kad je natjecanje otvoreno — to je upravo rezultat agregatne disipacije. Formula pokazuje da ukupno potrošeni resursi rastu prema (n-1)/n od vrijednosti rente R kako broj natjecatelja n raste, pa za velik n teže punoj disipaciji R (uz r=1). Time se brojčano potkrepljuje Kruegerina empirijska procjena iz callout-empirija i (c) dio callout-vjezbe gdje studenti računaju gornju granicu uloženih resursa. VAŽNO: formula vrijedi samo za r unutar uvjeta postojanja unutarnje ravnoteže u čistim strategijama (r ≤ n/(n−1)); za pedagoški slučaj r=1 sve drži. Zahtijeva uvođenje R i n, ali ostaje na razini srednje teške algebre i izravno hrani postojeću vježbu.

**[3] Uvjet ravnoteže Beckerova modela natjecanja pritisaka**

```latex
$$
I_s = I_s(p_s, p_t), \quad I_t = I_t(p_s, p_t), \qquad I_s + I_t = 0, \qquad \frac{\partial I_s}{\partial p_s} = -\,\frac{\partial I_t}{\partial p_t}
$$
```
*Zašto:* Beckerov model je u tekstu razrađen kroz dva odlomka isključivo riječima. ISPRAVLJENA verzija odbacuje izvorni arg-max zapis koji je bio tautološki (samo je rekao 'skupina bira pritisak koji maksimizira korist', bez ikakvog sadržaja) i umjesto toga eksplicitno iskazuje Beckerovu temeljnu strukturu: politički utjecaj svake skupine I_s i I_t funkcija je obaju pritisaka, utjecaji su zbroja nula (preraspodjela je igra nulte sume u utjecaju), a ravnoteža izjednačava granične učinke pritiska — upravo verbalnu tvrdnju iz teksta 'granični pritisci obiju strana izjednače'. Drži se Beckerove izvorne notacije (funkcija utjecaja i pritiska) i ne zalazi u tešku komparativnu statiku.

**[4] Mrtvi teret oporezivanja kao kvadratna funkcija stope**

```latex
$$
DWL(t) \approx \tfrac{1}{2}\,\varepsilon\,t^{2}\,B, \qquad \frac{\partial\, DWL}{\partial t} \approx \varepsilon\,t\,B
$$
```
*Zašto:* Tekst doslovno tvrdi da mrtvi teret 'raste otprilike s kvadratom porezne stope' i da zato 'granični iznos raste sa svakim dodatnim eurom preraspodjele' — to je verbalni izgovor jednadžbe koja već postoji, samo nenapisana. Kvadratna formula (uz bazu B = vrijednost oporezovane osnovice pQ i ε kompenziranu elastičnost) odmah objašnjava ZAŠTO je granični trošak linearan u t, čime postaje providan cijeli Beckerov mehanizam. Niska notacijska cijena, povezuje ovo poglavlje s Harbergerovim trokutom već citiranim u callout-empirija i s poglavljem o porezima.

**[5] Individualni poticaj i logika selektivnih poticaja**

```latex
$$
\underbrace{\frac{V}{n}}_{\text{udio u javnom dobru}} + \underbrace{s}_{\text{selektivni poticaj}} \; > \; \underbrace{c}_{\text{trošak doprinosa}}
$$
```
*Zašto:* Olsonova teza je čisto verbalna, a ima trivijalno jednostavan formalni izraz koji studentu odmah pokazuje srž: pojedinac doprinosi samo ako njegova osobna korist nadmašuje trošak. Kako udio V/n pada s veličinom skupine n, velike se skupine ne organiziraju — osim ako selektivni poticaj s ne podigne lijevu stranu iznad troška c. Jedna nejednakost objedinjuje problem slobodnog jahača, ovisnost o veličini skupine I ulogu selektivnih poticaja, što su tri zasebne ideje koje poglavlje sada nosi u tri odlomka proze. Idealno za uvodnu sekciju jer je notacijski neustrašiva. Napomena: V/n je simetrična aproksimacija (svaki član internalizira 1/n vrijednosti dobra) — primjereno za udžbenik.

**[6] Omjer koncentracije koristi i raspršenosti troškova**

```latex
$$
\frac{b/m}{c/N} = \frac{b}{c}\cdot\frac{N}{m} \gg 1 \quad \text{(uz } b \le c,\; m \ll N\text{)}
$$
```
*Zašto:* Asimetrija je trenutno samo opisana ('nekoliko milijuna prema nekoliko eura'). Omjer pojedinačne koristi b/m (korist b podijeljena na m korisnika) prema pojedinačnom trošku c/N (trošak c na N obveznika) brojčano pokazuje zašto je poticaj na organiziranje sustavno asimetričan ČAK I kad je ukupni trošak veći od ukupne koristi (b ≤ c). To izravno formalizira callout-vjezbu na kraju poglavlja (50 mil. / 5 proizvođača vs 80 mil. / 20 mil. obveznika; provjereno: omjer = 2 500 000) i daje studentu prijenosivi 'detektor'. Optional jer dvije prethodne Olson/Tullock jednadžbe nose veći teret.

**Gdje produbiti (izvodi / vježbe):** 1) Worked derivation Tullockove disipacije rente: kratak izvod simetrične ravnoteže za n natjecatelja (svaki maksimizira p_i·R − x_i uz funkciju uspjeha p_i, uvjet prvog reda, simetrija x_i=x*) prirodno staje u zaseban formalni okvir ili dulju fusnotu. Izvod je provjeren: FOC daje R·r(n−1)/(n²x*) = 1, odakle x* = (n−1)/n²·rR, a agregat (n−1)/n·rR. Most prema postojećoj uputi 'Što isprobati (3)'. OBAVEZNO uz izvod navesti uvjet postojanja unutarnje ravnoteže u čistim strategijama r ≤ n/(n−1); inače (visok r, 'pobjednik nosi sve') ravnoteža je u mješovitim strategijama i formula ne vrijedi, pa tekstualna napomena 'veliki r' treba taj oprez. 2) Numerička callout-vjezba uz Tullocka: postojeća vježba u dijelu (c) već traži gornju granicu resursa; proširiti zadatkom u kojem 5 proizvođača s rentom R=50 mil. eura uz r=1 simetrično ulažu x*=(n−1)/n²·R, pa student usporedi stvarni ukupni ulog (n−1)/n·R = 0,8·50 = 40 mil. eura s naivnom pretpostavkom 'svatko ulaže do svoje koristi' (što bi dalo 50 mil.). 3) Formalni okvir Beckerova modela: kratak analitički box s funkcijama utjecaja I_s(p_s,p_t) i I_t(p_s,p_t), uvjetom nulte sume utjecaja, proračunskim ograničenjem vlade (porez = subvencija + mrtvi teret) i uvjetom ravnoteže izjednačenih graničnih učinaka pritiska. 4) Callout-vjezba uz mrtvi teret kao kvadratnu funkciju: dati B, ε i dvije stope t da student izračuna DWL(t)=½εt²B i pokaže da podvostručenje stope učetverostručuje gubitak (provjereno: DWL(2t)/DWL(t)=4) — povezuje Beckerov mehanizam i poglavlje o porezima. 5) Olsonova nejednakost u kratkoj callout-vjezbi s tri veličine skupine (n = 5, 500, 5 000 000) da student vidi kako V/n pada ispod c i kako tek selektivni poticaj s vraća poticaj na organiziranje.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

SAŽETAK ADVERZARIJALNE PROVJERE (6 jednadžbi).

[P1 — Tullockova funkcija uspjeha p_i = x_i^r / Σ x_j^r]: TOČNOST = OK. LaTeX ispravan, renderira bez greške. Ekonomski standardna i ispravna forma Tullockove contest-success-function; r ∈ [0,∞) je oštrina, r=0 lutrija, r→∞ all-pay 'pobjednik nosi sve' — opis u rationale točan. CITAT [@tullock1967] = PRESENT (references.bib:856, 'The Welfare Costs of Tariffs, Monopolies, and Theft'). Razina: core/low realna. Napomena: tullock1967 je izvor pojma rent-seeking gubitka, ali sama parametrizirana funkcija uspjeha potječe iz Tullock (1980); za udžbenik je tullock1967 prihvatljiv jer poglavlje već njime citira lov na rentu.

[P2 — disipacija x* = (n−1)/n²·rR i Σx* = (n−1)/n·rR]: TOČNOST = OK (formule analitički izvedene i numerički provjerene; SymPy nedostupan, izveo ručno + numerička FOC-provjera za n∈{2,3,5,10}, r∈{0.5,1,1.5}: FOC ≈ 0 na kandidatu, agregat se točno poklapa). Ovo je ISPRAVAN smjer — disipacija RASTE prema R kako n raste (za r=1: (n−1)/n → 1), nema obrnute pogreške poput one s udjelom predlagatelja u Baron-Ferejohnu. UPOZORENJE (mora se navesti uz formulu): vrijedi samo unutar uvjeta postojanja unutarnje ravnoteže u čistim strategijama r ≤ n/(n−1); za r iznad toga (npr. all-pay) ravnoteža je u mješovitim strategijama, agregat može premašiti R (preko-disipacija) i formula otkazuje. Za pedagoški slučaj r=1 sve drži. CITAT: [@tullock1980] = MISSING u references.bib (analitičar to sam označio). ISPRAVLJENO na [@tullock1989] (references.bib:878, 'The Economics of Special Privilege and Rent Seeking') kao PRESENT fallback koji pokriva isti rezultat; preporuka: dodati tullock1980 ('Efficient Rent Seeking', 1980) kao kanonski izvor formule. Razina: strong/medium realna.

[P3 — Beckerov uvjet ravnoteže]: TOČNOST = ISPRAVLJENO. Izvorni zapis (I_s = π_s(p_s,p_t,…), p_s = argmax Z_s) nije matematički netočan, ali je TAUTOLOŠKI/prazan — drugi član samo kaže 'skupina bira pritisak koji maksimizira korist' bez sadržaja, a oznaka π za funkciju utjecaja sudara se s uobičajenim π=profit. Zamijenjeno informativnijim i Beckeru vjernijim zapisom: I_s=I_s(p_s,p_t), I_t=I_t(p_s,p_t), uvjet nulte sume utjecaja I_s+I_t=0 i ravnoteža graničnih učinaka pritiska ∂I_s/∂p_s = −∂I_t/∂p_t, što izravno formalizira tekstualnu tvrdnju 'granični pritisci obiju strana izjednače'. CITAT [@becker1983] = PRESENT (references.bib:147). Razina: strong/medium realna (uz ispravak ostaje pristupačno).

[P4 — DWL(t) ≈ ½εt²B i ∂DWL/∂t ≈ εtB]: TOČNOST = OK. LaTeX ispravan. Derivacija provjerena numerički: ∂/∂t (½εt²B) = εtB točno; svojstvo udvostručenja DWL(2t)/DWL(t)=4 potvrđeno. Standardna Harbergerova kvadratna aproksimacija; '≈' je primjeren jer egzaktni trokut koristi promjenu cijene i nagib potražnje. Napomena (poželjna u tekstu): B treba biti vrijednost oporezovane osnovice (pQ), a ε kompenzirana elastičnost — tada je formula dimenzionalno i ekonomski korektna. CITAT [@harberger1954] = PRESENT (references.bib:1908) i već citiran u callout-empirija ovog poglavlja. Razina: core/low realna.

[P5 — Olsonova nejednakost V/n + s > c]: TOČNOST = OK. LaTeX s \\underbrace ispravan i renderira. Ekonomska logika korektna: član doprinosi ako internalizirana korist (udio V/n + selektivni poticaj s) premašuje trošak c; V/n pada s n → velike skupine se ne organiziraju bez s. V/n je simetrična aproksimacija (svaki član captures 1/n od V), što je standardno i primjereno za udžbenik; vrijedi navesti da je riječ o pojednostavljenju. CITAT [@olson1965] = PRESENT (references.bib:624). Razina: strong/low realna.

[P6 — omjer koncentracije (b/m)/(c/N) = (b/c)·(N/m) ≫ 1]: TOČNOST = OK. Algebra provjerena: (b/m)/(c/N) = (b/m)·(N/c) = (b/c)·(N/m), identitet točan. Logika ≫1 uz b≤c i m≪N drži kad N/m ≫ c/b. Reprodukcija vježbe iz poglavlja provjerena numerički: b=50M/m=5, c=80M/N=20M → 10M po proizvođaču vs 4 EUR po obvezniku, omjer = 2 500 000, i to uz b<c (neto-negativna mjera) — upravo poanta. CITAT [@olson1965] = PRESENT. Razina: optional/low realna; ispravno rangirano niže od P2/P5.

ZAKLJUČAK: Nijedna jednadžba nije matematički pogrešna u predznaku ili smjeru. Jedina prava intervencija je P3 (prazan arg-max zapis zamijenjen informativnim Beckerovim uvjetom). Jedini citatski problem je P2 (tullock1980 MISSING → privremeno tullock1989 PRESENT; preporuka dodati tullock1980 u references.bib). Obavezno uz P2 navesti uvjet r ≤ n/(n−1) za valjanost formule.

</details>

---

## 09-birokracija (Dva pogleda na birokraciju / Birokracija)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Sva četiri okruženja (#def-niskanenov-model, #def-bureau-shaping, #def-principal-agent, #def-input-output-ishod) iskazana su isključivo verbalno — nema nijedne display jednadžbe; Niskanenov rezultat (Qₙ = 2Q*) postoji samo kao numerika u OJS/R kodu grafa (a=10, b=1, c=3 → Q*=7, Qₙ=14) i u tekstu vježbe, nikad kao formalni izraz u prozi.

**Jaz:** Poglavlje opisuje dva kvantitativno precizna modela isključivo riječima. (1) Niskanenov model birokrata koji maksimizira proračun ima standardni formalni tretman: maksimizacija B uz uvjet B(Q) ≥ C(Q), s rezultatom da se output gura do točke totalne ravnoteže B(Qₙ)=C(Qₙ) umjesto marginalne B'(Q)=C'(Q), što uz pravocrtnu graničnu korist i konstantni granični trošak daje Qₙ = 2Q*. Taj rezultat (2×) doslovno je naveden u prozi (red 207) i u kodu grafa, ali nigdje nije pokazano ZAŠTO vrijedi — izvod nedostaje. (2) Migué-Bélanger diskrecijski proračun (potpuno odsutan iz poglavlja) generalizira Niskanena uvođenjem korisne funkcije birokrata U(Q, D), gdje je D = B − C(Q) diskrecijski višak; on objašnjava heterogenost motiva koju poglavlje opisuje samo verbalno (Breton-Wintrobe red 209, Dunleavy red 211). (3) Princip 'uzmi ili ostavi' (red 207) — prisvajanje cijelog viška — ima jednostavan algebarski izraz koji nedostaje. (4) Principal-agent okruženje (#def-principal-agent, red 229) navedeno je čisto verbalno, bez ijedne formalne komponente, a tvrdnja o iskrivljujućim pokazateljima (red 243) ima formalni temelj u linearnom modelu nagrade.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Niskanenov uvjet maksimizacije proračuna | Niskanenov model birokrata koji maksimizira p | core | low | [@niskanen1971] | Pogled teorije javnog izbora — neposredno nakon #d |
| 2 | Rezultat dvostruke prevelike ponude (Qₙ = 2Q*) | Niskanenov model — usporedba marginalnog i to | core | medium | [@niskanen1971] | Pogled teorije javnog izbora — uz red 207 ('otpril |
| 3 | Diskrecijski proračun i korisna funkcija birokrata | Migué-Bélanger model diskrecijskog proračuna  | strong | medium | ⚠ MISSING | Pogled teorije javnog izbora — kao novi kratki odl |
| 4 | Ponuda 'uzmi ili ostavi' i prisvajanje potrošačkog viška | Niskanenov mehanizam sveobuhvatne (all-or-not | optional | medium | [@niskanen1971] | Pogled teorije javnog izbora — uz red 207, gdje se |
| 5 | Princip–agent ugovor s asimetrijom informacija | Linearni model nagrade i kompatibilnost potic | optional | high | ⚠ MISSING | Asimetrija informacija i principal–agent problem — |

**[1] Niskanenov uvjet maksimizacije proračuna**

```latex
$$
\max_{Q}\; B(Q) \quad \text{uz ograničenje} \quad B(Q) \ge C(Q)
$$
```
*Zašto:* Ovo je definicijska jezgra cijelog poglavlja koja trenutno postoji samo kao rečenica. Jedna kratka jednadžba pokazuje studentu da birokrat ne maksimizira neto korist (B−C) ni dobit, nego sirovu veličinu proračuna, ograničen samo time da sponzor ne smije ostati na gubitku. Sve daljnje (Qₙ, prekomjerna potrošnja, graf) izravno slijedi iz nje, pa je njezino izostavljanje najveći formalni jaz.

**[2] Rezultat dvostruke prevelike ponude (Qₙ = 2Q*)**

```latex
$$
\underbrace{B'(Q^{*}) = C'(Q^{*})}_{\text{učinkovito}} \qquad \text{vs.} \qquad \underbrace{B(Q_{n}) = C(Q_{n})}_{\text{Niskanen}} \;\overset{B'=a-bQ,\;C'=c}{\Longrightarrow}\; Q_{n} = 2\,Q^{*}
$$
```
*Zašto:* Tvrdnja '2×' je središnji teorijski rezultat poglavlja i već je ugrađena u graf i u vježbu, ali se nigdje formalno ne pokazuje odnos marginalnog uvjeta (Q*) i totalnog uvjeta (Qₙ). Jednadžba eksplicitno suprotstavlja dvije logike (granično vs. ukupno izjednačavanje) i daje studentu 'aha' moment koji graf samo ilustrira. KLJUČNO: faktor 2 vrijedi SAMO uz linearnu MB i konstantnu MC, pa je u ispravljeni latex umetnut uvjet nad strelicom da implikacija ne izgleda kao opća istina. Izvod (uz B(Q)=aQ−bQ²/2, C(Q)=cQ) prirodno ide u callout-vjezba ili analitički okvir.

**[3] Diskrecijski proračun i korisna funkcija birokrata**

```latex
$$
\max_{Q}\; U\big(Q,\,D\big), \qquad D = B(Q) - C(Q), \qquad U_Q>0,\; U_D>0
$$
```
*Zašto:* Poglavlje cijeli odlomak (red 209) posvećuje heterogenosti birokratskih motiva ('neki žele miran posao, neki ugled') ali bez modela koji to formalizira. Migué-Bélanger upravo to čini: birokrat vrednuje i output Q i diskrecijski višak D (=razliku između odobrenog proračuna i minimalnog troška). Niskanenov čisti slučaj je rubni (kada U ovisi samo o Q). Jedna jednadžba elegantno povezuje Niskanena, Bretona i Dunleavya u jedinstven okvir i pokazuje da 'fat'/organizacijski višak može zamijeniti puko širenje. Zahtijeva dodavanje reference u .bib.

**[4] Ponuda 'uzmi ili ostavi' i prisvajanje potrošačkog viška**

```latex
$$
\int_{0}^{Q_{n}} B'(q)\,dq \;=\; \int_{0}^{Q_{n}} C'(q)\,dq \qquad\Longleftrightarrow\qquad B(Q_{n}) = C(Q_{n})
$$
```
*Zašto:* Tekst (red 207) verbalno objašnjava kako birokracija nudi paket po jednoj ukupnoj cijeni i tako 'prisvaja gotovo cijeli višak'. Jednadžba pokazuje da je odobreni proračun jednak površini ispod krivulje granične koristi (ukupna spremnost na plaćanje), a ne marginalnoj cijeni — što je točno analogon savršene cjenovne diskriminacije. Korisno za studente koji su prošli osnove mikroekonomije; povezuje birokraciju s monopolom (već obrađenim u poglavlju 2). Označeno optional jer se djelomično preklapa s prijedlogom #2. Ekvivalencija vrijedi uz uobičajenu normalizaciju B(0)=C(0)=0.

**[5] Princip–agent ugovor s asimetrijom informacija**

```latex
$$
w = \alpha + \beta\,y, \qquad y = e + \varepsilon,\;\; \varepsilon\sim(0,\sigma^{2}), \qquad \max_{e}\; \underbrace{\alpha + \beta e - \tfrac{1}{2}c\,e^{2} - \tfrac{1}{2}\rho\,\beta^{2}\sigma^{2}}_{\text{ekvivalent sigurnosti}} \;\Longrightarrow\; \beta^{*} = \frac{1}{1+\rho\,c\,\sigma^{2}}
$$
```
*Zašto:* Sekcija o principal-agent problemu potpuno je kvalitativna. Minimalni linearni model formalizira zašto se 'skriveno djelovanje' ne može savršeno nagraditi i zašto loši pokazatelji iskrivljuju ponašanje (red 243). ISPRAVLJENO: originalni latex s 'max E[w] − ½ce²' opisuje RIZIČNO NEUTRALNOG agenta, kod kojeg šum σ² NE utječe na optimalni β (optimalno bi bilo β=1), pa zaključak iz obrazloženja ('β je malen kad je output slabo mjerljiv') NE slijedi iz te jednadžbe. Dodan je član premije rizika −½ρβ²σ² (rizično-averzan agent, ekvivalent sigurnosti) i eksplicitan rezultat β*=1/(1+ρcσ²), koji STVARNO opada u σ² i time daje obećani zaključak. Označeno high/optional — preporuka je staviti u callout ili fusnotu, a ne u glavni tok.

**Gdje produbiti (izvodi / vježbe):** Najjača prilika je proširena izvedba Niskanenova rezultata Qₙ = 2Q*, koja trenutno postoji samo kao numerika u kodu grafa i u postojećoj callout-vjezba (redovi 277–285). Predlaže se dodati kratki analitički okvir (ili proširiti postojeću vježbu) s eksplicitnim funkcijskim oblicima: granična korist B'(Q) = a − bQ i konstantni granični trošak C'(Q) = c. Tada je ukupna korist B(Q) = aQ − bQ²/2 i ukupni trošak C(Q) = cQ; učinkovito Q* = (a−c)/b iz B'=C', a Niskanen Qₙ rješava aQ − bQ²/2 = cQ, tj. nakon dijeljenja s Q dobiva se a − bQ/2 = c, odakle Qₙ = 2(a−c)/b = 2Q*. To je čista, zatvorena izvedba (PROVJERENO TOČNA) koja studentu pokazuje ODAKLE dolazi faktor 2 i izravno se poklapa s vrijednostima u grafu (a=10, b=1, c=3 → Q*=7, Qₙ=14). Postojeća callout-vjezba već traži upravo te račune (dijelovi a–c), pa bi se njoj mogao dodati dio (d) koji traži opću izvedbu Qₙ = 2Q* za proizvoljne a, b, c — čime vježba prelazi iz aritmetike u algebru i učvršćuje rezultat. Druga prilica je nova callout-vjezba uz Migué-Bélanger model: zadati U = Q·D (Cobb-Douglas oblik) uz D = B(Q) − C(Q) i tražiti od studenta da pokaže kako optimalni Q pada ispod Niskanenova Qₙ kada birokrat vrednuje i diskrecijski višak — numerički ilustrirajući da 'organizacijski višak' (fat) djelomično zamjenjuje puko širenje outputa. Treća, lakša prilika je callout-empirija ili fusnota koja kvantificira raspravu o pokazateljima (red 243) preko principal-agent rezultata β*=1/(1+ρcσ²): jak poticaj (β blizu 1) optimalan je samo kad je output dobro mjerljiv (mali σ²); kad je output slabo mjerljiv (velik σ²) optimalni β pada prema nuli, pa su jaki poticaji u javnom sektoru često neoptimalni — formalni temelj već prisutne verbalne tvrdnje. NAPOMENA: ovaj treći okvir mora koristiti ispravljenu (rizično-averznu) formulaciju iz prijedloga 5, jer rizično-neutralna verzija ne daje taj zaključak.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

PRIJEDLOG 1 (Niskanen max): TOČNOST OK — LaTeX valjan; ekonomski ispravno (birokrat maksimizira B, ne neto korist B−C, uz vezujuće ograničenje B≥C koje u unutarnjem rješenju daje B=C). Citat [@niskanen1971]: PRESENT (references.bib red 595). Razina low ispravno postavljena. ||| PRIJEDLOG 2 (Qₙ=2Q*): TOČNOST ISPRAVLJENO (sadržaj točan, ali nedovoljno uvjetovan). Algebra provjerena: B'=a−bQ=c → Q*=(a−c)/b; B(Qₙ)=C(Qₙ): aQ−bQ²/2=cQ → a−bQ/2=c → Qₙ=2(a−c)/b=2Q*. Rezultat 2× je TOČAN i poklapa se s grafom (a=10,b=1,c=3→7 i 14). PROBLEM u originalnom latexu: implikacija '…⟹ Qₙ=2Q*' prikazana je kao da slijedi iz samih uvjeta B'=C' i B=C, a ona vrijedi SAMO uz linearnu MB + konstantnu MC. Dodao sam uvjet nad strelicom (B'=a−bQ, C'=c) da se ne sugerira opća istina. Citat [@niskanen1971]: PRESENT. Razina medium ispravna. ||| PRIJEDLOG 3 (Migué-Bélanger): TOČNOST OK — LaTeX valjan; U(Q,D), D=B−C, U_Q>0, U_D>0 je standardna formulacija diskrecijskog viška; Niskanen je rubni slučaj (U ovisi samo o Q). Citat @miguebelanger1974: MISSING — nema u references.bib (pretraga migue/belanger/bélanger bez pogodaka). Predloženi metapodaci (Public Choice 17(1):27–47, 1974, doi:10.1007/BF01718995) odgovaraju stvarnom radu 'Toward a General Theory of Managerial Discretion' — treba dodati u .bib uz oznaku TODO(coauthor). Razina strong/medium realna. ||| PRIJEDLOG 4 (uzmi-ili-ostavi integral): TOČNOST OK — LaTeX valjan; matematika ispravna uz normalizaciju B(0)=C(0)=0 (∫₀^Qn B' dq=B(Qn)−B(0)=B(Qn) itd.), pa ekvivalencija s B(Qn)=C(Qn) vrijedi. Identično je Niskanenovu uvjetu iz prijedloga 2, samo u integralnom obliku (framing prisvajanja viška / savršene cjenovne diskriminacije). Citat [@niskanen1971]: PRESENT. Razina optional/medium ispravno; preklapanje s #2 točno uočeno. ||| PRIJEDLOG 5 (principal-agent linearni ugovor): TOČNOST ISPRAVLJENO — LaTeX originala je SINTAKTIČKI valjan i interno konzistentan ZA RIZIČNO NEUTRALNOG agenta, ALI je u sukobu s vlastitim obrazloženjem. Original 'max_e E[w]−½ce²': E[w]=α+βe (jer E[ε]=0), FOC β−ce=0 → e*=β/c — uredno; no kod rizično neutralnog agenta σ² NE ulazi u izbor β (optimalno β=1, 'prodaj poduzeće agentu'), pa tvrdnja iz rationale da 'β je malen kad je šum velik' NE SLIJEDI. To je suštinska, a ne kozmetička greška (analogno upozorenju o 'udjelu koji raste s n'). Ispravak: dodan član premije rizika −½ρβ²σ² (ekvivalent sigurnosti CARA agenta) i eksplicitan rezultat β*=1/(1+ρcσ²), koji je standardni Holmström-Milgrom (LEN) izraz i STVARNO opada u σ², čime obećani zaključak postaje točan. Citat @laffont2002: MISSING i WRONG-KEY/nepotpun — nema nikakvih Laffont/Martimort/Holmström unosa u .bib; uz to original navodi samo Laffonta, a knjiga ima dva autora (Laffont i Martimort), pa predlažem ključ @laffontmartimort2002. Treba dodati u .bib uz TODO(coauthor). Razina high/optional realna — uz premiju rizika i očekivanje model je vjerojatno pretežak za glavni tok; preporuka fusnote/callouta opravdana.

</details>

---

## 10-institucionalna-ekonomika (Nova institucionalna ekonomika — pravila igre)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; svih pet #def- okruženja (institucije, institucionalna kvaliteta, transakcijski troškovi, inkluzivne/ekstraktivne, ovisnost o putanji) iskazano je čisto verbalno, bez formula, a postojeća callout-vjezba je numerička ali samo aritmetička (zbroj triju stavki) i ne sadrži nikakav formalni model.

**Jaz:** Nekoliko koncepata koji imaju ustaljen formalni tretman u literaturi obrađeni su isključivo prozom. (1) Williamsonova usporedba tržište-protiv-hijerarhije ("make-or-buy") opisana je riječima i numerički u vježbi, ali bez uvjeta odlučivanja u zatvorenoj formi — iako je upravo to mjesto gdje formula najviše pomaže jer pretvara intuiciju "granica ovisi o tome gdje su troškovi najniži" u provjerljiv kriterij. (2) Principal-agent problem (sekcija o javnom sektoru) iznesen je potpuno verbalno, premda postoji kanonski model optimalnog ugovora s poticajima (Holmström-Milgrom) koji formalizira kompromis između poticaja i podjele rizika; trenutno nedostaje čak i osnovni izraz w = a + b·y. (3) Specifičnost ulaganja i hold-up problem (kraj sekcije o transakcijskim troškovima) opisani su anegdotalno, a imaju jednostavnu formalizaciju kvazi-rente i poddulaganja kad strana zadrži samo udio s<1 viška. (4) Acemoglu-Robinsonov empirijski doprinos eksplicitno se naziva "kvantitativnim" (regresija institucija na dohodak, IV-strategija sa smrtnošću doseljenika), ali nije prikazana nijedna regresijska jednadžba niti logika instrumentalne varijable, što ostavlja ključnu metodološku poantu (odvajanje uzročnosti od korelacije) bez formalnog sidra. (5) Northova teza da institucije snižavaju transakcijske troškove razmjene mogla bi se sažeti rastavom ukupnog troška razmjene na cijenu plus transakcijski trošak.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Williamsonov uvjet izbora upravljačke strukture (tržište nasuprot hijerarhije) | Transakcijski troškovi i izbor upravljačke st | core | low | [@williamson1985; @coase1937] | ## Transakcijski troškovi (nakon odlomka o specifi |
| 2 | Optimalni ugovor s poticajima (linearni princip kompenzacije) | Principal-agent model s moralnim hazardom (Ho | core | medium | ⚠ MISSING | ## Problem principal–agent u javnom sektoru (nakon |
| 3 | Hold-up problem i kvazi-renta od specifičnog ulaganja | Specifičnost ulaganja i nepotpuni ugovori (Wi | strong | medium | [@williamson1985] | ## Transakcijski troškovi (uz odlomak o specifično |
| 4 | Institucije kao determinanta razvoja i instrumentalna varijabla | Institucije i dugoročni razvoj; IV-identifika | strong | medium | [@acemoglu2001] | ## Institucije i dugoročni razvoj (uz odlomak koji |
| 5 | Rastav ukupnog troška razmjene (cijena plus transakcijski trošak) | Northov pojam institucija kao mehanizma za sn | optional | low | [@coase1937; @north1990] | ## Transakcijski troškovi (uz #def-transakcijski-t |

**[1] Williamsonov uvjet izbora upravljačke strukture (tržište nasuprot hijerarhije)**

```latex
$$
G^* = \arg\min_{G \in \{T, H\}} \big[\, C(G) + TC(G;\, k) \,\big], \qquad \text{integriraj kada } TC(T;k) - TC(H;k) > C(H) - C(T)
$$
```
*Zašto:* Ovo je središnja kvantitativna tvrdnja poglavlja — granica između tržišta (T) i hijerarhije (H) bira se minimizacijom zbroja proizvodnog troška C i transakcijskog troška TC koji raste sa specifičnošću ulaganja k. Jednadžba doslovno formalizira postojeću callout-vjezbu (koja sad samo zbraja tri broja bez kriterija) i daje studentima provjerljivo pravilo odlučivanja umjesto verbalne intuicije. Niska zahtjevnost: samo usporedba dvaju zbrojeva i pojam argmin koji se može objasniti riječima.

**[2] Optimalni ugovor s poticajima (linearni princip kompenzacije)**

```latex
$$
\max_{a,\,b}\; \mathbb{E}[\,y - w\,] \quad \text{uz } w = a + b\,y, \qquad b^* = \frac{1}{1 + r\,\sigma^2 / m}
$$
```
*Zašto:* Sekcija o principal-agentu potpuno je verbalna iako je ovo jedan od dvaju kanonskih formalnih modela poglavlja. Linearni ugovor w = a + b·y i optimalna osjetljivost b* pokazuju zašto je nadzor nesavršen i zašto su jaki poticaji skupi kada je ishod bučan (velik σ²) ili agent nesklon riziku (velik r) — što je upravo razlog zašto u javnom sektoru, gdje su učinci teško mjerljivi, snažni poticaji često nisu izvedivi. Srednja zahtjevnost jer uvodi varijancu i averziju prema riziku, ali se b* može potpuno intuitivno objasniti (manje mjerljivo → slabiji poticaji).

**[3] Hold-up problem i kvazi-renta od specifičnog ulaganja**

```latex
$$
\pi_i = s\,[\,v(I) - v_0\,] - I, \qquad s\,v'(I^*) = 1 \;\Rightarrow\; s<1 \text{ implicira } v'(I^*) = \tfrac{1}{s} > 1 \text{ (poddulaganje)}
$$
```
*Zašto:* Odlomak već verbalno opisuje 'otmicu dobiti' i poddulaganje, ali bez formalne poveznice. Izraz pokazuje da kad strana pri pregovaranju zadrži samo udio s<1 kvazi-rente [v(I) − v₀] umanjen za nepovratno ulaganje I, uvjet prvog reda postaje s·v'(I*) = 1, pa graničnu vrijednost v'(I*) = 1/s mora gurnuti iznad društvenog optimuma 1 — što precizno znači manje ulaganja. To je razlog zašto vertikalna integracija (koja vraća s prema 1) rješava problem. ISPRAVLJENO u odnosu na izvorni prijedlog: izvorni izraz π_i = s(v−v₀) − I s komparativnom statikom ∂I*/∂s > 0 bio je mehanički točan u smjeru, ali matematički zavaravajuć jer je v tretirao kao konstantu (tada bi ∂π/∂I = −1 < 0 sugeriralo nulto ulaganje); rezultat poddulaganja počiva na v = v(I), pa je v(I) sada eksplicitno i prikazan je uvjet prvog reda umjesto puke komparativne statike.

**[4] Institucije kao determinanta razvoja i instrumentalna varijabla**

```latex
$$
\ln y_i = \alpha + \beta\, R_i + \gamma' X_i + \varepsilon_i, \qquad R_i = \delta + \theta\,\ln M_i + \eta' X_i + u_i
$$
```
*Zašto:* Tekst eksplicitno kaže da je doprinos 'kvantitativan, ne samo deskriptivan' i detaljno objašnjava IV-strategiju riječima (smrtnost doseljenika M kao instrument za kvalitetu institucija R), ali ne prikazuje nijednu jednadžbu. Dvije jednadžbe (druga faza za ln dohotka y, prva faza za institucije R na instrumentu ln M) čine logiku identifikacije konkretnom i uče studente zašto puka korelacija ne dokazuje smjer uzročnosti — ključnu metodološku pouku poglavlja. U AJR (2001) očekuje se θ < 0 (veća smrtnost → ekstraktivnije/lošije institucije) i β > 0 (bolje institucije → viši dohodak); jednadžbe ne fiksiraju predznake pa su konzistentne. Povezuje se s knjiškom metodološkom linijom (slot 'methodology' iz ENRICHMENT.md).

**[5] Rastav ukupnog troška razmjene (cijena plus transakcijski trošak)**

```latex
$$
TT = p\,q + \underbrace{\big(c_{\text{trazenje}} + c_{\text{pregovaranje}} + c_{\text{nadzor}} + c_{\text{provedba}}\big)}_{TC(\,\text{kvaliteta institucija}\,)}
$$
```
*Zašto:* Niskozahtjevno formalno sidro koje samo zapisuje ono što definicija već nabraja: ukupni trošak razmjene TT je cijena (p·q) uvećana za zbroj transakcijskih troškova čiju visinu određuje kvaliteta institucija. Pomaže studentima vidjeti da 'institucije snižavaju TC' znači pomicanje druge zagrade prema nuli, bez ikakve nove notacije. Optional jer je više ilustrativni rastav nego model; vrijedan ako se želi blagi uvod u formalizam prije težih jednadžbi.

**Gdje produbiti (izvodi / vježbe):** Najjača prilika za proširenu izvedbu jest pretvaranje postojeće callout-vjezbe (make-or-buy s tri scenarija) u formalni okvir: trenutno se samo zbrajaju brojevi, a dodavanjem Williamsonova uvjeta G* = argmin[C(G)+TC(G;k)] vježba dobiva eksplicitan kriterij odlučivanja i prirodno se proširuje na parametrizaciju gdje trošak ugovaranja raste linearno sa specifičnošću k, pa studenti mogu izračunati prag k* na kojem se isplati integrirati — to je worked derivation koja spaja sva tri scenarija u jednu krivulju. (Provjereno na postojećim brojevima: polazni T = 20+50+40 = 110, H = 60+10+30 = 100 → H je jeftiniji za 10; scenarij (b) podiže trošak ugovaranja na tržištu sa 50 na 110 pa T = 170 > H = 100, integracija još izglednija; scenarij (c) podiže trošak nadzora na tržištu sa 40 na 90 pa T = 160 > H = 100 — sva tri scenarija dosljedno pokazuju isti smjer, što potvrđuje da je vježba numerički konzistentna s predloženim kriterijem.) Druga prilika je nova callout-vjezba uz principal-agent sekciju: zadati w = a + b·y s konkretnim r, σ² i m, tražiti b* i pokazati da b* pada kad ishod postane manje mjerljiv (raste σ²), čime se brojčano dolazi do zaključka zašto javni sektor s teško mjerljivim učincima koristi slabe poticaje i fiksne plaće. Treća prilika je kratki formalni analitički okvir (ne callout, nego dvije rečenice uz #def-) koji uz Acemoglu-Robinson empiriju prikazuje dvostepenu IV-jednadžbu i objašnjava zašto instrument (smrtnost doseljenika) mora utjecati na dohodak samo preko institucija (uvjet isključenja) — to je idealno mjesto za graničnu metodološku napomenu o razlici korelacije i uzročnosti koju tekst već verbalno otvara.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

[Prijedlog 1 — Williamson make-or-buy] TOČNOST: OK. Uvjet integracije TC(T;k) − TC(H;k) > C(H) − C(T) ispravno se algebarski izvodi iz C(H)+TC(H) < C(T)+TC(T); argmin i {T,H} sintaksa renderiraju se bez greške. CITATI: [@williamson1985] present (red 1819), [@coase1937] present (red 1621). RAZINA: core/low realno — usporedba dvaju zbrojeva, prikladno za studente, dobro se preslikava na postojeću vježbu.

[Prijedlog 2 — Holmström linearni ugovor] TOČNOST: OK (uz napomenu o atribuciji). Formula b* = 1/(1+rσ²/m) je kanonski Holmström-Milgrom (1987) rezultat: r = apsolutna averzija prema riziku, σ² = varijanca šuma, m = produktivnost napora (trošak c(e)=e²/2m). Smjer je točan — veći σ² ili veći r snižavaju b*, što je upravo ekonomska priča prijedloga. LaTeX valjan. CITAT: holmstrom1979 MISSING u references.bib (potvrđeno pretragom; prijedlog to ispravno označava). VAŽNA NAPOMENA: zatvorena formula b* nije iz Holmström (1979) nego iz Holmström-Milgrom (1987); ako se citira sama formula, treba dodati @holmstromMilgrom1987, inače je atribucija formule pogrešnom radu. RAZINA: core/medium realno; b* se može objasniti čisto intuitivno.

[Prijedlog 3 — Hold-up / kvazi-renta] TOČNOST: ISPRAVLJENO. Komparativna statika ∂I*/∂s > 0 jest točna u smjeru, ALI izvorni izraz π_i = s(v−v₀) − I bio je matematički zavaravajuć jer je v tretiran kao konstanta — tada je ∂π/∂I = −1 < 0, što bi naivno značilo nulto ulaganje; rezultat poddulaganja oslanja se na v = v(I) (rastuća, konkavna). Ispravljeni LaTeX čini v(I) eksplicitnim i prikazuje uvjet prvog reda s·v'(I*) = 1 ⇒ v'(I*) = 1/s > 1, što je standardni Grossman-Hart-Moore/Williamson rezultat poddulaganja i jasnije pokazuje mehanizam. CITAT: [@williamson1985] present. Grossman-Hart-Moore spominje se samo u nazivu modela, ne kao [@key], pa nema nedostajućeg citata; napomena: grossmanhelpman1994 u bibu je rad o lobiranju, NE Grossman-Hart-Moore — ne brkati. RAZINA: strong/medium realno.

[Prijedlog 4 — AJR IV dvije faze] TOČNOST: OK. Specifikacija točno odgovara AJR (2001): ln y_i na institucijama R_i (zaštita od eksproprijacije), instrument ln M_i (log smrtnosti doseljenika), kontrole X_i. Prva i druga faza ispravno napisane; predznaci nisu fiksirani u jednadžbama (u AJR θ<0, β>0) pa nema sukoba. LaTeX valjan. CITAT: [@acemoglu2001] present (red 1869). RAZINA: strong/medium realno; idealno za metodološku poantu korelacija-vs-uzročnost.

[Prijedlog 5 — Northov rastav troška] TOČNOST: OK. Računovodstveni identitet TT = pq + (zbroj transakcijskih troškova); trivijalno točan, \underbrace i \text{} renderiraju se bez greške. CITATI: [@coase1937] present, [@north1990] present (red 614). RAZINA: optional/low realno — ilustrativni rastav bez nove notacije, dobar blagi uvod u formalizam.

ZAKLJUČAK: 4 od 5 jednadžbi matematički ispravne kakve jesu; prijedlog 3 ISPRAVLJEN (eksplicitni v(I) + uvjet prvog reda). Svi korišteni [@key] citati postoje u references.bib osim holmstrom1979 (ispravno označen MISSING), uz dodatno upozorenje da formula b* zapravo pripada Holmström-Milgrom (1987), pa preporučam ključ @holmstromMilgrom1987. Postojeća numerička vježba provjerena i konzistentna sa svim trima scenarijima predloženog kriterija.

</details>

---

## 11-konstitucionalna-ekonomika (Konstitucionalna /ustavna/ ekonomika)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; sva četiri #def- okruženja (ustavna ekonomika, veo neizvjesnosti, vremenska nedosljednost, političko-proračunski ciklus, vjerodostojnost) iskazana su isključivo verbalno, nema nijednog #prp-/#thm- okruženja, a postojeća callout-vjezba postavlja numerički zadatak bez ijedne formule kao oslonca.

**Jaz:** Tri standardno formalizirana modela teme tretiraju se samo prozno. (1) Buchanan-Tullockov račun pristanka (The Calculus of Consent) — sam naslov i srž poglavlja — opisan je riječima ('pravila o pravilima', 'optimalna većina'), ali nigdje u knjizi nije iskazan kao minimizacija zbroja vanjskih troškova i troškova odlučivanja po pragu suglasnosti; ch05 ima račun glasanja R=PB−C, ch06 ima Bordu, ali račun pristanka i Rae-Taylorov optimalni prag nedostaju u cijeloj knjizi. (2) Problem vremenske nedosljednosti (Kydland-Prescott; Barro-Gordon) citira se i ilustrira monetarnom inflacijskom pristranošću, ali bez ijedne nejednakosti koja pokazuje zašto je diskrecijski ishod ravnoteža i zašto je obvezivanje superiorno; callout-vjezba traži upravo taj izračun, a tekst joj ne daje algebarski okvir. (3) Vrijednost obvezivanja i minimalna 'kazna' k za održanje discipline (uvjet vjerodostojnosti) postavljeni su numerički u vježbi, ali bez opće formule. Sve troje ima udžbenički standardan, grafički prikaziv formalni tretman.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Račun pristanka — optimalna većina koja minimizira ukupne troškove kolektivnog odlučivanja | Buchanan-Tullockov račun pristanka (The Calcu | core | low | [@buchanan1962; @mueller1989] | Pravila i odluke — dvije razine političkog odlučiv |
| 2 | Vanjski troškovi i troškovi odlučivanja kao funkcije pravila suglasnosti | Rae-Taylorov optimalni prag većine unutar Buc | strong | medium | [@buchanan1962; @mueller1989] | Pravila i odluke — dvije razine političkog odlučiv |
| 3 | Vremenska nedosljednost — zašto je diskrecijski ishod inferioran obvezivanju | Kydland-Prescott problem vremenske nedosljedn | strong | high | [@kydland1977; @rogoff1985] | Vremenska nedosljednost javnih politika (nakon odl |
| 4 | Vrijednost obvezivanja — minimalna kazna koja održava fiskalnu disciplinu | Logika obvezivanja (commitment) iz Kydland-Pr | strong | low | [@kydland1977] | callout-vjezba na kraju poglavlja (dio b) — kao fo |
| 5 | Politički proračunski ciklus — predizborni fiskalni signal i njegovo slabljenje s biračkim iskustvom | Nordhausov model političkog poslovnog ciklusa | optional | medium | [@nordhaus1975; @brender2005] | Političko-proračunski ciklusi (nakon odlomka o Bre |

**[1] Račun pristanka — optimalna većina koja minimizira ukupne troškove kolektivnog odlučivanja**

```latex
$$
C(k) = E(k) + D(k), \qquad k^{*} = \arg\min_{k \in [1,N]} \big[\, E(k) + D(k) \,\big]
$$
```
*Zašto:* Ovo je nezaobilazna jednadžba teme — doslovno daje ime poglavlju. E(k) su očekivani vanjski troškovi (padaju kako prag suglasnosti k raste, jer veća većina manje šteti pojedincu), D(k) su troškovi odlučivanja (rastu s k, jer je teže okupiti veću većinu). Optimalni prag k* minimizira zbroj i objašnjava zašto jednoglasnost rijetko, a kvalificirana većina za ustavna pravila često ima smisla. Dvije monotone krivulje i njihov U-oblikovani zbroj lako se crtaju i intuitivno objašnjavaju, a izravno opravdavaju zašto se ustavna razina štiti pojačanom većinom (eksplicitno spomenuto u tekstu kod švicarske Schuldenbremse).

**[2] Vanjski troškovi i troškovi odlučivanja kao funkcije pravila suglasnosti**

```latex
$$
E'(k) < 0, \quad D'(k) > 0 \;\;\Rightarrow\;\; E'(k^{*}) = -\,D'(k^{*})
$$
```
*Zašto:* Uvjet prvog reda pokazuje da je optimalna većina ona pri kojoj se granično smanjenje vanjskih troškova izjednačava s graničnim porastom troškova odlučivanja. Pedagoški dovršava prethodnu jednadžbu (od 'minimiziraj zbroj' do 'izjednači granične učinke') i daje studentu prepoznatljiv marginalistički obrazac koji su već vidjeli drugdje u knjizi. Drži se na 'strong', a ne 'core', jer zahtijeva derivaciju; može se izostaviti ako se želi zadržati potpuno bezračunska razina, ali izvrsno povezuje temu s ostatkom mikroekonomske logike knjige.

**[3] Vremenska nedosljednost — zašto je diskrecijski ishod inferioran obvezivanju**

```latex
$$
W(\pi) = b\,(\pi - \pi^{e}) \;-\; \tfrac{1}{2}\,a\,\pi^{2}, \qquad \pi^{D} = \frac{b}{a} > 0 = \pi^{R}, \quad a,b>0
$$
```
*Zašto:* Najmanji mogući Barro-Gordon prikaz: vlast vrednuje iznenadnu inflaciju (član b(π−πᵉ), npr. preko smanjenja nezaposlenosti) ali snosi trošak same inflacije (−½aπ²). Pod racionalnim očekivanjima diskrecija daje pozitivnu inflacijsku pristranost π^D=b/a, dok bi obvezujuće pravilo dalo π^R=0 uz isti ishod za zaposlenost — to je sržna poruka neovisnosti središnje banke koju tekst već navodi. Vrlo je ilustrativno, ali nosi makro notaciju (očekivanja, kvadratna funkcija), pa je 'high' i treba ga uokviriti kao 'analitički okvir' ili callout-empirija da ne zastraši; alternativno pojednostaviti na verbalni opis π^D>π^R bez funkcije cilja.

**[4] Vrijednost obvezivanja — minimalna kazna koja održava fiskalnu disciplinu**

```latex
$$
G^{\text{odstupanje}} - k \;\le\; G^{\text{disciplina}} \;\;\Longleftrightarrow\;\; k \;\ge\; G^{\text{odstupanje}} - G^{\text{disciplina}}
$$
```
*Zašto:* Postojeća vježba traži od studenta da izračuna najmanji k pri kojem disciplina postaje isplativija, ali mu ne daje nijednu formalnu polugu. Ova nejednakost (kazna mora pokriti razliku kratkoročnih dobitaka od odstupanja i discipline) daje točan, jednoredni okvir koji student sam popuni brojevima iz vježbe (k ≥ 8 − 2 = 6). Notacija je minimalna (usporedba dvaju dobitaka), a izravno operacionalizira pojmove 'obvezivanja' i 'vjerodostojnog ograničenja' kojima poglavlje obiluje. Idealno spaja prozu, vježbu i formalizam bez podizanja razine težine.

**[5] Politički proračunski ciklus — predizborni fiskalni signal i njegovo slabljenje s biračkim iskustvom**

```latex
$$
D_{t} = \alpha + \beta\, \mathbb{1}[\,\text{izborna godina}\,] + \gamma\, \big(\mathbb{1}[\,\text{izborna godina}\,] \times \text{zrelost demokracije}\big) + \varepsilon_{t}, \quad \beta > 0,\; \gamma < 0
$$
```
*Zašto:* Daje studentu kompaktan empirijski model koji povezuje teoriju s načinom na koji se ciklus zapravo mjeri. Pozitivan β hvata predizborni skok deficita (Nordhaus), negativan interakcijski član γ formalizira ključni nalaz iz teksta da ciklus gotovo nestaje u zrelim demokracijama (Brender-Drazen, Shi-Svensson). Vrijednost je 'optional' jer je to ekonometrijska specifikacija, a ne strukturni model teme; korisna je za premošćivanje teorije i empirije te kao predložak za callout-vjezba o interpretaciji koeficijenata, ali nije nužna za razumijevanje srži poglavlja.

**Gdje produbiti (izvodi / vježbe):** Tri prirodna mjesta za prošireni formalni tretman. (1) Najjača prilika je kratka pod-sekcija/analitički okvir 'Račun pristanka' u sekciji o dvije razine odlučivanja, s izvedbom u tri koraka — krivulja vanjskih troškova E(k) koja pada, krivulja troškova odlučivanja D(k) koja raste, te njihov zbroj C(k)=E(k)+D(k) čiji minimum daje k*. Ovo se može dopuniti grafikonom (dvije krivulje + U-oblikovani zbroj, uz B&W/monospace twin konvenciju knjige) i callout-vjezba u kojoj student za zadane numeričke E(k) i D(k) tablice nađe k* i objasni zašto jednoglasnost (k=N) nije optimalna iako eliminira vanjske troškove. (2) U sekciji o vremenskoj nedosljednosti uvesti kompaktni Barro-Gordon analitički okvir kao callout-empirija ili formalni box — izvesti π^D=b/a iz uvjeta prvog reda (∂W/∂π = b − aπ = 0) i pokazati π^R=0, čime se algebarski dokazuje poruka o neovisnosti središnje banke koju tekst sada iznosi samo verbalno. Naglasiti da je W funkcija cilja koja se MAKSIMIZIRA (ne funkcija gubitka koja se minimizira), inače znak ispada pogrešan. (3) Postojeću callout-vjezba na kraju poglavlja nadograditi formulom k ≥ G^odstupanje − G^disciplina za dio (b), tako da student ima formalni oslonac umjesto čiste aritmetike; dio (c) ostaje kvalitativan i veže se uz veo neizvjesnosti. Napomena o kalibraciji — poglavlje legitimno može ostati pretežno kvalitativno (tema je institucionalna), pa od pet prijedloga samo račun pristanka (core) zaslužuje punu izvedbu; ostalo treba uvoditi štedljivo, jednu-dvije jednadžbe, da se ne naruši čitljivost udžbenika.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Provjereni svi citatni ključevi protiv references.bib: buchanan1962 (Buchanan & Tullock, Calculus of Consent, 1962) PRESENT; mueller1989 (Mueller, Public Choice III — napomena: ključ glasi '1989' ali zapis je 3. izdanje s year=2003, ipak isti ključ postoji i ispravno se resolvira) PRESENT; kydland1977 (Kydland & Prescott, Rules Rather than Discretion, JPE 1977) PRESENT; rogoff1985 (Rogoff, Optimal Degree of Commitment, QJE 1985) PRESENT; nordhaus1975 (Nordhaus, Political Business Cycle, RES 1975) PRESENT; brender2005 (Brender & Drazen, JME 2005) PRESENT; shi2006 (Shi & Svensson, JPubE 2006) PRESENT. Svi citati su present.

PRIJEDLOG 1 (C(k)=E(k)+D(k), k*=argmin): TOČNO (OK). LaTeX ispravan, zagrade balansirane, \\arg\\min sintaksa valjana. Standardni Buchanan-Tullock prikaz: E(k) opada (vanjski troškovi), D(k) raste (troškovi odlučivanja), zbroj je U-oblikovan, k* minimizira. Ekonomski točno, predznaci monotonosti ispravni. Citati present. valueTier=core i difficulty=low realni za studente — jedna jednostavna zbrojna krivulja. PREPORUKA: dosljedno definirati k kao prag/udio suglasnosti (1..N) u prozi prije jednadžbe.

PRIJEDLOG 2 (FOC: E'<0, D'>0 ⇒ E'(k*)=−D'(k*)): TOČNO (OK). Izvod iz C'(k)=E'(k)+D'(k)=0 daje E'(k*)=−D'(k*); uz E'<0 i D'>0 to je konzistentno (lijeva strana negativna = negativ pozitivne desne). LaTeX valjan. Citati present. difficulty=medium opravdan (traži deriviranje). Bez zamjerki.

PRIJEDLOG 3 (Barro-Gordon): ISPRAVLJENO. Izvorni latex je oznaku funkcije nazvao L(π) (konvencionalno LOSS koji se MINIMIZIRA), ali ju je tretirao kao objekt koji vlast 'vrednuje'/maksimizira i napisao u obliku korist−trošak. To je interno nekonzistentno: ako je L gubitak koji se minimizira, π^D=b/a NE slijedi iz napisanog izraza s tim predznacima. Matematika je točna SAMO ako se funkcija MAKSIMIZIRA. Ispravak: preimenovano u W(π) (funkcija cilja/blagostanja koja se maksimizira), član preuređen na b(π−πᵉ) i dodan uvjet a,b>0. Uz to ∂W/∂π=b−aπ=0 ⇒ π^D=b/a; pod obvezivanjem (πᵉ=π internalizirano) maksimum je u π^R=0. Dakle π^D=b/a>0=π^R je TOČNO uz ispravljenu oznaku. Ovo je analog one ranije knjižne greške 'krivi smjer' — predznak/uloga funkcije bili su zavaravajući. Citati present. difficulty=high opravdan; OBVEZNO u prozi naglasiti da se W maksimizira, inače student dobije pogrešan predznak. Alternativa za niži prag: zadržati samo zaključak π^D>π^R=0 bez funkcije.

PRIJEDLOG 4 (k ≥ G^odstupanje − G^disciplina): TOČNO (OK). Logika obvezivanja ispravna: vlada ostaje disciplinirana kad G^dev−k ≤ G^disc ⟺ k ≥ G^dev−G^disc. S brojevima iz vježbe (G^dev=8, G^disc=2) daje k≥6, što se slaže s rationale. LaTeX (\\text{} indeksi, \\Longleftrightarrow) valjan. Citat present. UPOZORENJE (manje, pedagoško): pri k=6 vlada je TOČNO indiferentna (jednakost), a vježba traži k 'pri kojoj postaje ISPLATIVIJE' (strogo bolje) — strogo gledano to je k>6, a k=6 je granični (rubni) slučaj. Vrijedi u tekstu reći 'najmanji k koji disciplinu čini barem jednako dobrom (k=6), a strogo isplativijom za k>6'. Formula ostaje točna; samo dodati napomenu o rubu. difficulty=low realan.

PRIJEDLOG 5 (regresija PBC): TOČNO (OK), uz manju kozmetičku korekciju. Reduciranoformna specifikacija interno konzistentna i u skladu s literaturom: β>0 (predizborni skok deficita, Nordhaus), γ<0 (slabljenje u zrelim demokracijama, Brender-Drazen/Shi-Svensson). Izvorni latex je interakcijski član pisao kao '(izborna godina × zrelost)' tekstualno; radi dosljednosti s glavnim članom interakcija je preuredjena na 𝟙[izborna godina]×zrelost demokracije (isti indikator). \\mathbb{1} zahtijeva amssymb/amsfonts (podržava MathJax/KaTeX u Quartu) — renderirat će se. Citati present. valueTier=optional i difficulty=medium realni; korisno za interpretaciju koeficijenata, nije strukturni model. Bez sadržajne greške.

ZAKLJUČAK: 3 jednadžbe potpuno točne (1,2,4 sa sitnom rubnom napomenom uz 4), 1 kozmetički uredjena (5), 1 SUŠTINSKI ISPRAVLJENA (3 — oznaka L→W i smjer maksimizacije, bez čega je rezultat π^D=b/a bio pogrešno potkrijepljen). Svi citati present.

</details>

---

## 12-instrumenti — Instrumenti državne intervencije

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; svih pet okruženja su #def- definicije (NATO okvir, regulacija, subvencija, javno poduzeće, policy mix) iskazane isključivo verbalno, a jedini formalni sadržaj je OJS/R graf mrtvog tereta čija se formula nigdje ne zapisuje.

**Jaz:** Cijela kanonska ekonomika izbora instrumenata tretira se samo prozno. Konkretno: (1) mrtvi teret klina/poreza opisan je riječima i nacrtan grafom ('raste s kvadratom jačine mjere'), ali Harberger-trokut t·ΔQ/2 nigdje se ne piše, iako je formula trivijalno čitljiva s postojećeg grafa; (2) korektivni (Pigouov) porez kao instrument za negativnu eksternaliju spominje se u definiciji subvencije i u odjeljku o porezima ('oporezivanje aktivnosti koje stvaraju negativne eksternalije') bez uvjeta t=MEC; (3) glavni kanonski rezultat teme — Weitzmanova usporedba cijene vs količine pod neizvjesnošću (nagib MB vs MC odlučuje treba li porez ili kvota) — potpuno izostaje iako brief eksplicitno traži taj model; (4) ekvivalencija poreza i prodavih dozvola (cap-and-trade) spomenuta je u OECD/BC primjerima bez formalne tvrdnje da oba izjednačavaju MAC = cijena ugljika; (5) sama vježba (c) radi numeričku usporedbu trošak-po-efektu instrumenata bez ijedne opće formule troškovne učinkovitosti.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Mrtvi teret poreznog klina (Harbergerov trokut) | Harberger / standardni model viška — trokut m | core | low | [@harberger1954] | ## Regulacija — neposredno uz OJS/R graf 'Regulaci |
| 2 | Korektivni (Pigouov) porez na negativnu eksternaliju | Pigou (1920) — optimalni porez jednak graničn | core | low | [@pigou1920] | ## Porezi — uz rečenicu o 'alokacijskoj ili korekt |
| 3 | Cijene ili količine pod neizvjesnošću (Weitzmanovo pravilo) | Weitzman (1974), 'Prices vs. Quantities' — re | core | high | ⚠ MISSING | ## Kombiniranje instrumenata — uz raspravu o tome  |
| 4 | Cjenovna efikasnost tržišnih instrumenata (izjednačavanje graničnih troškova smanjenja) | Baumol–Oates — uvjet troškovne minimizacije z | strong | medium | [@baumol1988] | ## Kombiniranje instrumenata — uz rečenicu 'Tržišn |
| 5 | Troškovna učinkovitost instrumenta (trošak po jedinici učinka) | Opći okvir komparativne učinkovitosti instrum | optional | low | [@boardman2018] | ::: {.callout-vjezba} — kao formalni okvir uz dio  |

**[1] Mrtvi teret poreznog klina (Harbergerov trokut)**

```latex
$$
DWL = \tfrac{1}{2}\,t\,(Q^{*} - Q_{t}) = \tfrac{1}{2}\,\frac{\varepsilon_{S}\,\varepsilon_{D}}{\varepsilon_{S}+\varepsilon_{D}}\,\frac{Q^{*}}{P^{*}}\,t^{2}
$$
```
*Zašto:* Graf već crta upravo taj trokut i tekst tvrdi da mrtvi teret 'raste otprilike s kvadratom jačine mjere'. Zapisivanje DWL = ½·t·ΔQ čini tu tvrdnju egzaktnom i čitljivom izravno s grafa (visina klina t, baza ΔQ), a drugi oblik s t² formalizira već izrečenu kvadratnu ovisnost i uvodi ulogu elastičnosti. Niska notacijska cijena, maksimalna povezanost s postojećim vizualom.

**[2] Korektivni (Pigouov) porez na negativnu eksternaliju**

```latex
$$
t^{*} = MEC(Q^{*}), \qquad \text{gdje } Q^{*} \text{ rješava } MPB(Q^{*}) = MPC(Q^{*}) + MEC(Q^{*})
$$
```
*Zašto:* Korektivna funkcija poreza je eksplicitno navedena prozom ali bez pravila. Pigouov uvjet t*=MEC je najjednostavnija jednadžba koja pretvara 'oporezuj zagađenje' u precizan instrument i izravno povezuje ovo poglavlje s eksternalijama iz DIO I. Studentima intuitivno: porez koji internalizira jaz između privatnog i društvenog troška.

**[3] Cijene ili količine pod neizvjesnošću (Weitzmanovo pravilo)**

```latex
$$
\Delta = \frac{\sigma^{2}}{2\,(C'')^{2}}\,\bigl(C'' + B''\bigr), \qquad B'' \le 0 \le C''
$$
```
*Zašto:* Ovo je kanonski model teme koji brief eksplicitno traži, a poglavlje ga uopće nema. Weitzmanovo pravilo daje precizan odgovor na središnje pitanje poglavlja (porez vs kvota/regulacija): kad je granični trošak strmiji od granične koristi (|C''|>|B''|) prednost ima cijena/porez, inače količina/kvota. ISPRAVLJEN PREDZNAK: u kanonskom obliku s drugim derivacijama (B''<0, C''>0) zbroj je (C''+B''), ne razlika; prednost cijene Δ>0 vrijedi kad C''+B''>0, tj. kad je MC krivulja strmija od (apsolutnog nagiba) MB krivulje. Notaciju popratiti s dvije slike strmih vs položenih krivulja jer je riječ o drugim derivacijama; zaslužuje mjesto jer je to JEDINI formalni rezultat koji izbor instrumenta čini analitičkim, a ne taksonomskim.

**[4] Cjenovna efikasnost tržišnih instrumenata (izjednačavanje graničnih troškova smanjenja)**

```latex
$$
MAC_{i}(a_{i}) = \tau \quad \forall i \;\;\Longrightarrow\;\; \min \sum_{i} C_{i}(a_{i}) \;\text{ uz } \sum_{i} a_{i} = \bar{A}
$$
```
*Zašto:* Poglavlje tvrdi prozom da cjenovni instrumenti minimiziraju ukupni trošak jer akteri 'sami pronađu najjeftiniji put', dok regulacija 'nameće isti zahtjev različitim akterima čije su krivulje troška različite'. Ova jednadžba formalizira upravo tu tvrdnju: jedinstvena cijena τ izjednačava granične troškove smanjenja (MAC) svih aktera, što je nužan uvjet minimuma ukupnog troška — i objašnjava ekvivalenciju poreza i prodavih dozvola. Pedagoški spaja BC porez na ugljik, tržišta emisija i regulatorne standarde u jedan okvir.

**[5] Troškovna učinkovitost instrumenta (trošak po jedinici učinka)**

```latex
$$
\frac{C_{A}}{E_{A}} \lessgtr \frac{C_{B}}{E_{B}}, \qquad E_{k} = \sum_{j} \theta_{kj}\,x_{kj}
$$
```
*Zašto:* Vježba (c) već traži upravo ovaj izračun verbalno ('koji instrument ostvaruje cilj uz niži ukupni administrativni trošak'). Eksplicitno pravilo trošak/učinak (C/E) daje studentu generalizirajući alat umjesto ad hoc aritmetike i prirodno se nadovezuje na poglavlje o CBA i evaluaciji. Niska cijena, ali 'optional' jer je više pedagoška generalizacija nego kanonski teorijski rezultat.

**Gdje produbiti (izvodi / vježbe):** Tri prirodna mjesta za prošireni formalni tretman. (1) Worked derivation mrtvog tereta uz postojeći graf: budući da OJS/R kod već definira D(q)=100−q, S(q)=20+q, t i dwl=½·t·(Q*−Q_reg), može se dodati kratka izvedba koja pokazuje da je upravo dwl=½·t·ΔQ i da ΔQ=t/2 pa DWL=t²/4 — egzaktno potvrđuje 'raste s kvadratom' iz teksta 'Što isprobati', bez ikakvog novog vizuala. POTVRĐENO numerički: pri tim parametrima elastičnostni oblik daje εS=εD=1.5, εSεD/(εS+εD)=0.75, Q*/P*=2/3, pa ½·0.75·(2/3)·t²=t²/4 — identično prvom obliku, što čini Harbergerov prijedlog dvostruko provjerljivim u nastavi. (2) Mali formalni okvir (može kao ::: {#prp-cijene-kolicine} propozicija) za Weitzmanovo pravilo: dvije skice (strma MC + položena MB → porez; strma MB + položena MC → kvota) plus jedna linija Δ=σ²(C''+B'')/(2(C'')²) UZ EKSPLICITAN dogovor o predznaku (B''≤0); to izbor 'porez ili regulacija', koji poglavlje sada rješava nabrajanjem prednosti/mana, pretvara u testabilan kriterij. (3) Numerička callout-vježba uz odjeljak o subvencijama/Pigouu: zadati MPC, MEC linearno i tražiti od studenta da izračuna t*=MEC(Q*) te usporedi ishod poreza i kvantitativnog standarda — povezuje korektivni porez, Baumol-Oatesovo izjednačavanje MAC i postojeću BC carbon-tax callout-praksu u jedan zadatak. Postojeća vježba (c) može se nadograditi formulom C/E iz prijedloga 5 da numerika postane primjena općeg pravila.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

P1 Harberger DWL — TOČNOST: OK. Oba oblika ispravna. Prvi (½·t·ΔQ) je egzaktna površina trokuta. Drugi (elastičnostni) je standardni Harberger oblik i NUMERIČKI PROVJEREN protiv parametara samog grafa: D=100−q, S=20+q daju εS=εD=1.5 → εSεD/(εS+εD)=0.75, Q*/P*=40/60, pa DWL=½·0.75·(2/3)·t²=t²/4, što se točno poklapa s prvim oblikom (ΔQ=t/2). LaTeX valjan (\\tfrac, \\varepsilon standardni). CITAT: present (harberger1954, AER 44(2):77-87 — postoji u references.bib). RAZINA: 'core'/'low' realno. NAPOMENA: u nastavi naglasiti da su t i elastičnosti mjereni u istim jedinicama (t kao apsolutni klin uz P* iz nazivnika).\n\nP2 Pigouov porez — TOČNOST: OK. t*=MEC(Q*) uz uvjet društvenog optimuma MPB=MPC+MEC ispravan; optimalni porez jednak je graničnom vanjskom trošku procijenjenom U OPTIMUMU (ne u tržišnoj ravnoteži), što je formula ispravno kodirala kroz Q*. LaTeX valjan. CITAT: present (pigou1920, The Economics of Welfare — postoji, ima TODO(coauthor) marker ali je validan ključ). RAZINA: 'core'/'low' realno.\n\nP3 Weitzman — TOČNOST: ISPRAVLJENO. Originalni latex je imao POGREŠAN PREDZNAK za kanonsku notaciju s drugim derivacijama: pisalo je (C''−B''), a u standardnom Weitzmanovom obliku gdje je B'' druga derivacija koristi (B''<0, jer je MB padajuća) i C'' druga derivacija troška (C''>0), komparativna prednost cijena nad količinama glasi Δ=σ²(C''+B'')/(2(C'')²). Prednost cijene (Δ>0) vrijedi kad je C''+B''>0, tj. kad MC raste strmije nego što MB pada (|C''|>|B''|) — to je Weitzmanov središnji rezultat. Originalni (C''−B'') bio bi točan SAMO uz konvenciju da B'' označava apsolutni nagib (pozitivan magnitudni zapis), što je proposal implicitno koristio u rationaleu ('C''>B'''), ali ta konvencija nije bila navedena i lako vodi studenta na obrnut zaključak. Da bi se uskladilo s univerzalnim oblikom iz literature i izbjegla zamka, latex je promijenjen na (C''+B'') uz eksplicitan dogovor B''≤0≤C''. (Napomena o knjizinoj povijesti: ovo je upravo tip predznačne greške kao raniji 'udio predlagatelja raste s n'.) LaTeX inače valjan (\\bigl/\\bigr, \\sigma standardni); dodao sam zagrade oko C'' u nazivniku radi jasnoće ((C'')²). CITAT: MISSING — weitzman1974 NE postoji u references.bib (potvrđeno pretragom). Predloženi BibTeX entry u proposalu je točan (Rev. Econ. Stud. 41(4):477-491, doi 10.2307/2296698) i mora se dodati prije korištenja [@weitzman1974]. RAZINA: 'core'/'high' realno — zbog drugih derivacija i predznačne suptilnosti opravdano je popratiti dvjema slikama.\n\nP4 Baumol-Oates equimarginal — TOČNOST: OK. MAC_i(a_i)=τ ∀i kao nužan uvjet minimuma Σ C_i uz Σ a_i=Ā je ispravan equimarginal princip (FOC Lagrangiana, τ je multiplikator/cijena). Smjer implikacije pedagoški prihvatljiv. Notacija dosljedna (a_i abatement, Ā ukupni cilj). LaTeX valjan (\\Longrightarrow, \\forall, \\bar{A}). CITAT: present (baumol1988, The Theory of Environmental Policy — postoji, TODO(coauthor) marker ali validan). RAZINA: 'strong'/'medium' realno.\n\nP5 Trošak/učinak (C/E) — TOČNOST: OK. Generička komparacija omjera trošak-po-učinku ispravna; E_k=Σ θ_kj x_kj je bezopasna linearna agregacija učinaka. LaTeX valjan (\\lessgtr standardni). CITAT: present (boardman2018, Cost-Benefit Analysis — postoji). RAZINA: 'optional'/'low' realno; ispravno označen kao pedagoška generalizacija a ne kanonski teorem.\n\nSAŽETAK: 4 od 5 jednadžbi ekonomski/matematički točne kako predložene; 1 (Weitzman) ISPRAVLJENA zbog predznaka. Citati: 4 present (harberger1954, pigou1920, baumol1988, boardman2018), 1 MISSING (weitzman1974 — predloženi entry točan, dodati u references.bib).

</details>

---

## 13-javna-potrosnja (Javna potrošnja)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; sva tri def-okruženja (Wagnerov zakon, pristranost prema deficitu, javni dug) i ključni koncepti (fiskalni multiplikator, Baumolova bolest, r-g dinamika duga) iskazani su isključivo verbalno, bez ijedne formule.

**Jaz:** Najveći je jaz u tome što poglavlje izlaže kvantitativne teze potpuno bez kvantitativnog aparata. Wagnerov zakon opisan je riječima i ilustriran OJS grafom čiji trend (sp ≈ α + β·ln(gdp)) već postoji u kodu, ali sama jednadžba nigdje nije ispisana studentu, niti je formuliran njegov pravi sadržaj (dohodovna elastičnost javne potrošnje > 1). Baumolova bolest opisana je narativno ('relativna cijena sata nastave raste') iako je njezina jezgra jednoredna formula rasta jediničnog troška uz nultu produktivnost. Fiskalni multiplikator definiran je verbalno ('javna potrošnja postaje dohodak...') premda je standardni izraz 1/(1−c) ili 1/(1−c(1−t)+m) elementaran i izravno ilustrira sve nabrojene determinante (sklonost štednji, porezi, uvoz). Dinamika javnog duga eksplicitno se poziva na uvjet r>g u def-okruženju i u vježbi, ali jednadžba kretanja omjera duga (Δb = (r−g)·b − p) ostaje neispisana, što je naročit propust jer numerička vježba na kraju traži upravo taj izračun. Naposljetku, kanonski modeli javne potrošnje koje zadatak izrijekom navodi (Bowen-Lindahl-Samuelson uvjet, potražnja medijanskog glasača za javnim dobrom, flypaper efekt) u poglavlju se uopće ne spominju, iako su to temeljni formalni okviri za pitanje 'koliko i na što država troši'.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Fiskalni multiplikator | Keynesijanski multiplikator državne potrošnje | core | low | [@keynes1936] | Stabilizacijska uloga javne potrošnje — uz odlomak |
| 2 | Dinamika javnog duga (uvjet r vs g) | Jednadžba kretanja omjera duga / dužničke din | core | medium | [@blanchard2017] | Stabilizacijska uloga javne potrošnje — odlomak ko |
| 3 | Baumolova bolest troškova | Model neuravnoteženog rasta (Baumol) | strong | medium | [@baumol1967] | Ekspanzija države u 20. stoljeću — odlomak o Baumo |
| 4 | Samuelsonov uvjet za optimalnu razinu javnog dobra | Bowen-Lindahl-Samuelson uvjet (Samuelson) | core | medium | [@samuelson1954] | Društvene koristi i rizici (prekomjerne) javne pot |
| 5 | Potražnja medijanskog glasača za javnim dobrom | Borcherding-Deacon / Bergstrom-Goodman model  | strong | medium | ⚠ MISSING | Ekspanzija države u 20. stoljeću — odlomak 'Tome s |
| 6 | Flypaper efekt | Flypaper effect — anomalija paušalnih transfe | optional | high | ⚠ MISSING | Razlike u javnoj potrošnji u svijetu — uz spomen k |

**[1] Fiskalni multiplikator**

```latex
$$
k=\frac{\Delta Y}{\Delta G}=\frac{1}{1-c\,(1-t)+m}
$$
```
*Zašto:* Poglavlje verbalno nabraja točno one determinante (sklonost štednji preko c, porezi preko t, uvoz preko m) koje se u ovoj jednoj formuli pojavljuju kao parametri. Ispisivanje multiplikatora pretvara nabrajanje u model iz kojeg student vidi zašto je multiplikator veći kad je c veći, a manji uz veće t i m. Notacija je elementarna i podupire postojeću numeričku vježbu (k=1,5).

**[2] Dinamika javnog duga (uvjet r vs g)**

```latex
$$
\Delta b_{t}=\underbrace{(r-g)}_{\text{efekt snježne grude}}\,b_{t-1}-p_{t}
$$
```
*Zašto:* Def-okruzenje javnog duga i zavrsna callout-vjezba oba se eksplicitno oslanjaju na uvjet r>g, ali jednadžba nigdje nije ispisana. Ova formula formalno razdvaja efekt snježne grude (r−g)·b od primarnog salda p i čini vježbu rješivom 'iz definicije'. Ekonomski je točna i standardna u svakom udžbeniku javnih financija. NAPOMENA RECENZENTA: jednadžba je točna kao standardna prvoredna aproksimacija egzaktnog izraza Δb=((r−g)/(1+g))·b−p; ako se želi egzaktnost, koristiti b_{t}=((1+r)/(1+g))·b_{t-1}−p_{t}. Ključno — ključ [@blanchard2017] u references.bib pokazuje na Blanchard (2018) 'On the Future of Macroeconomic Models', što NIJE izvor o dužničkoj dinamici; citat treba zamijeniti (vidi verificationNotes).

**[3] Baumolova bolest troškova**

```latex
$$
\frac{\dot{p}_{s}}{p_{s}}=\frac{\dot{w}}{w}-\frac{\dot{a}_{s}}{a_{s}}\;\xrightarrow{\;\dot{a}_{s}=0,\;\dot{w}/w=\dot{a}_{p}/a_{p}\;}\;\frac{\dot{p}_{s}}{p_{s}}=\frac{\dot{a}_{p}}{a_{p}}
$$
```
*Zašto:* Tekst tvrdi da relativna cijena radno intenzivnih usluga raste i kad se opseg ne mijenja, ali to ostaje na razini tvrdnje. Formula pokazuje mehanizam: ako produktivnost u uslužnom sektoru stagnira (ȧ_s=0) a plaće prate produktivni sektor, jedinični trošak usluge raste po stopi rasta produktivnosti u ostatku gospodarstva. To je upravo 'cost disease' u jednom retku i izravno objašnjava trajni pritisak na zdravstvo i obrazovanje.

**[4] Samuelsonov uvjet za optimalnu razinu javnog dobra**

```latex
$$
\sum_{i=1}^{n}\mathrm{MRS}^{i}_{G,x}=\mathrm{MRT}_{G,x}
$$
```
*Zašto:* Ovo je kanonski normativni odgovor na pitanje 'na što i koliko' koje poglavlje postavlja u uvodu, ali ga nigdje formalno ne daje. Za razliku od privatnog dobra (gdje se MRS izjednačava pojedinačno), kod javnog dobra zbrajaju se granične stope supstitucije svih korisnika jer ga svi konzumiraju istovremeno. Pruža mjeru optimuma naspram koje se mjere državni i tržišni neuspjesi; vezuje ovo poglavlje uz poglavlje o alokacijskoj funkciji.

**[5] Potražnja medijanskog glasača za javnim dobrom**

```latex
$$
G^{*}=\alpha\,Y_{m}^{\;\eta}\,P^{\;\varepsilon}\,N^{\;\gamma}
$$
```
*Zašto:* Poglavlje tvrdi da demokratizacija i rast dohotka podižu potrošnju, ali ne nudi vezu glasač→proračun. Ova log-linearna potražnja medijanskog glasača operacionalizira upravo te kanale: η je dohodovna elastičnost (η>1 čini javnu uslugu 'luksuznim dobrom', što tekst eksplicitno spominje), ε cjenovna (očekivano ε<0), γ učinak veličine populacije/zajedničkog korištenja. Empirijski je procjenjiva i premošćuje DIO II (javni izbor) s ovim poglavljem.

**[6] Flypaper efekt**

```latex
$$
\frac{\partial G}{\partial Z}\;\gg\;\frac{\partial G}{\partial Y_{m}}\qquad(\text{premda teorija predviđa }\;\tfrac{\partial G}{\partial Z}\approx\tfrac{\partial G}{\partial Y_{m}})
$$
```
*Zašto:* Zanimljiva i mjerljiva anomalija: paušalni transfer Z razini vlasti povećava javnu potrošnju mnogo jače nego ekvivalentni rast dohotka građana Y_m ('novac se lijepi tamo gdje padne'), suprotno predviđanju modela medijanskog glasača. Pedagoški vrijedna jer pokazuje granice racionalnog modela i veže se na fiskalni federalizam. Optional jer zahtijeva prethodno uvođenje medijanskog glasača i nije nužna referenca u references.bib.

**Gdje produbiti (izvodi / vježbe):** 1) WORKED DERIVATION uz dinamiku duga: proširiti zavrsnu callout-vjezba (koja vec postoji) tako da se rjesenje izvede iz jednadzbe Δb=(r−g)b−p. Pri b=0,8, r=0,02, g=0,03 dobiva se Δb=(−0,01)·0,8=−0,008, tj. omjer pada za 0,8 p.b. cak uz uravnotezen primarni saldo; to ucini uvjet r<g opipljivim brojem. (Recenzent provjerio aritmetiku — tocno.) Multiplikatorski dio (b) izravno koristi k=1,5 i ΔG=3% pa ΔY≈4,5%, sto se moze prosiriti pitanjem o ucinku na omjer duga. 2) FORMALNI OKVIR (prp-okruzenje) za Samuelsonov uvjet: uvesti ::: {#prp-samuelson} s jednadzbom Σ MRS = MRT i jednorecnicnim kontrastom prema privatnom dobru (MRS^i=MRT za svakog i). 3) NOVI CALLOUT-VJEZBA za medijanskog glasaca: zadati log-linearnu potraznju G*=α·Y_m^η·P^ε s η=1,3 i pitati je li javna usluga 'luksuzno dobro' te za koliko % raste trazena potrosnja uz rast medijanskog dohotka od 10% (odgovor: ~13%, recenzent potvrdio elasticnost·promjena = 1,3·10%), cime se numericki potkrepljuje vec napisana tvrdnja o uslugama s elasticnoscu vecom od 1. 4) NOVI CALLOUT-EMPIRIJA za Wagnerov zakon: ispisati regresijski oblik ln(G/Y)=α+β·ln(Y_pc) koji vec stoji u OJS/R kodu grafa fig-wagner, povezati β s 'zasicenjem' i pozvati se na [@bird1971] (provjereno — kljuc postoji u references.bib) za ogradu da β nije konstantan kroz razine razvoja.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

Recenzent (adverzarijalna provjera) — references.bib procitan u cijelosti, sve jednadzbe rucno provjerene na predznake, smjer nejednakosti i elasticnosti.

[1] Fiskalni multiplikator k=1/(1−c(1−t)+m): TOCNOST OK. Standardni otvoreni multiplikator s dohodovnim porezom; nazivnik je 1−c(1−t)+m (a NE 1+c) — predznaci ispravni: veci c diže multiplikator, veci t i m ga snizavaju. Granicni slucaj zatvorenog gospodarstva bez poreza svodi se na 1/(1−c). Konzistentno s vjezbom k=1,5. CITAT: [@keynes1936] present (book, Keynes 1936). RAZINA: core/low realno — algebra je dostupna brucosu.

[2] Dinamika duga Δb=(r−g)·b−p: TOCNOST OK (s napomenom). Tocna prvoredna aproksimacija egzaktne jednadzbe Δb=((r−g)/(1+g))·b−p; za udzbenik na ovoj razini aproksimacija je prihvatljiva i standardna. Predznak primarnog salda ispravan: primarni SUFICIT p umanjuje dug (−p). Underbrace (r−g) kao 'efekt snjezne grude' korektno postavljen. Aritmetika u worked-example (−0,008) tocna. CITAT: [@blanchard2017] — WRONG-KEY: kljuc u references.bib pokazuje na Blanchard (2018), 'On the Future of Macroeconomic Models', Oxford Review of Economic Policy — to NIJE izvor o duznickoj dinamici. Preporuka: dodati Domar (1944) ili Blanchard-ov udzbenik 'Macroeconomics' kao novi kljuc, ili citirati [@blanchard2017] samo za makro-kontekst a dinamiku duga ostaviti bez tog kljuca. RAZINA: core/medium realno.

[3] Baumolova bolest ṗ_s/p_s = ẇ/w − ȧ_s/a_s → (uz ȧ_s=0, ẇ/w=ȧ_p/a_p) = ȧ_p/a_p: TOCNOST OK. Izvedeno iz jedinicnog troska c=w/a pa je log-derivacija stopa rasta placa minus stopa rasta produktivnosti; predznaci ispravni. Uvjet stagnirajuce produktivnosti u uslugama (ȧ_s=0) i placa koje prate produktivni sektor daje rast relativne cijene jednak rastu produktivnosti u progresivnom sektoru — tocan 'cost disease' rezultat. LaTeX (\\dot, \\xrightarrow) renderira se ispravno. CITAT: [@baumol1967] present (Baumol 1967, AER) — tocno odgovara izvornom modelu neuravnotezenog rasta. RAZINA: strong/medium realno; notacija s tockama (vremenske derivacije) trazi kratku legendu za studente.

[4] Samuelsonov uvjet Σ MRS^i = MRT: TOCNOST OK. Kanonski BLS uvjet — vertikalno (a ne horizontalno) zbrajanje granicnih stopa supstitucije svih korisnika jednako granicnoj stopi transformacije; kljucni kontrast prema privatnom dobru (MRS^i=MRT za svakoga i) tocan. LaTeX ispravan. CITAT: [@samuelson1954] present (Samuelson 1954, REStat, 'The Pure Theory of Public Expenditure') — to je IZVORNI rad. RAZINA: core/medium realno.

[5] Potraznja medijanskog glasaca G*=α·Y_m^η·P^ε·N^γ: TOCNOST OK. Standardna log-linearna (Cobb-Douglas) specifikacija potraznje; η dohodovna, ε cjenovna (ocekivano ε<0), γ populacijska elasticnost. η>1 ⇒ luksuzno dobro, sto se poklapa s tvrdnjom u tekstu. Worked-example (η=1,3, +10% dohotka → ~+13%) aritmeticki tocan. LaTeX ispravan. CITAT: MISSING — ni Borcherding-Deacon (1972) ni Bergstrom-Goodman (1973) NISU u references.bib (potvrdjeno pretragom). Treba dodati barem jedan prije koristenja [@key]. RAZINA: strong/medium realno.

[6] Flypaper ∂G/∂Z ≫ ∂G/∂Y_m: TOCNOST OK. Ispravno karakterizira anomaliju: pausalni grant Z dize potrosnju jace nego ekvivalentni rast privatnog dohotka, suprotno teorijskom predvidjanju ∂G/∂Z≈∂G/∂Y_m. Smjer ≫ tocan ('novac se lijepi gdje padne'). LaTeX (\\gg, \\tfrac) renderira se ispravno. CITAT: MISSING — Hines-Thaler (1995, JEP) nije u references.bib (potvrdjeno). RAZINA: optional/high realno — pretpostavlja prethodno uveden medijanski glasac (#5), pa #5 mora uci prije #6.

ZBIRNI ZAKLJUCAK: sve s 6 jednadzbi matematicki/ekonomski tocne (nijedna nije imala pogresan predznak ni obrnutu nejednakost kao raniji Baron-Ferejohn slucaj). Glavni nalazi su citatni: 1 wrong-key ([@blanchard2017] za dinamiku duga) i 2 missing (#5 medijanski glasac, #6 flypaper). Preporuka prioriteta unosa: #1, #2, #3, #4 (svi citati osim blanchard2017 spremni) mogu odmah; #2 uz ispravak citata; #5 i #6 tek nakon dodavanja referenci u references.bib.

</details>

---

## 14-porezi.qmd (Porezi)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Sva theorem/prp/def okruženja (prp-ramsey, def-mrtvi-teret, def-porezni-klin, def-lafferova-krivulja, def-progresivnost) iskazana su VERBALNO ili s tek jednim inline izrazom (def-mrtvi-teret ima samo DWL≈½t(Q*−Qt)); nijedan kanonski rezultat nije postavljen kao samostalna display jednadžba, premda OJS/R kod grafova interno već implementira točne zatvorene formule (DWL=½t·ΔQ, t*=1/(1+ε) izveden iz R(t)=t·B0(1−t)^ε, incidencija preko buyerShare, Laffer).

**Jaz:** Poglavlje je iznimno bogato grafički i intuitivno (8 interaktivnih OJS grafova + PDF blizanci), ali matematika je posve sakrivena u kodu grafova i prozi. Šest kanonskih rezultata trenutno se objašnjava SAMO riječima ili se kao formula pojavljuje jedino u JS-komentaru/inline tekstu: (1) Ramseyjevo pravilo inverzne elastičnosti — prp-ramsey iskazana je čisto verbalno; (2) mrtvi teret kao Harbergerov trokut — def-mrtvi-teret ima samo linearnu aproksimaciju, ne i oblik s ε i t²; (3) porezna incidencija — udio prijenosa spominje se samo riječima (red. 352) iako ga graf računa; (4) Lafferov vrh t*=1/(1+ε) naveden je inline (red. 2085) i u OJS komentaru (red. 2116), ali nikad kao display jednadžba uz izvod; (5) Mirrlees/Saez optimalna gornja stopa — odjeljak (red. 1754) zaključuje verbalno, bez moderne ABC-formule; (6) Diamond-Mirrleesov teorem proizvodne efikasnosti — srž AI-sekcije (red. 2408), ali se nigdje ne imenuje ni formalizira. Provjerom je potvrđeno da postojeća proza i kod NE sadrže matematičkih grešaka; problem je isključivo izostanak formalnog iskaza.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Ramseyjevo pravilo (inverzna elastičnost) | Ramsey (1927), inverse-elasticity rule / Rams | core | medium | [@ramsey1927] | ### Ramseyevo pravilo — unutar ili neposredno nako |
| 2 | Mrtvi teret kao Harbergerov trokut | Harberger (1964) / Ramsey — kvadratna aproksi | core | low | [@gruber2019] | ### Mrtvi teret oporezivanja — unutar ::: {#def-mr |
| 3 | Porezna incidencija (formula prijenosa) | Standardni model ravnoteže parcijalnog tržišt | core | low | [@gruber2019] | ### Tko stvarno snosi porez — porezna incidencija  |
| 4 | Lafferov vrh (stopa koja maksimizira prihod) | Laffer / konstantno-elastična osnovica; izvod | strong | medium | [@saez2001] | ### Lafferova krivulja — neposredno nakon odlomka  |
| 5 | Optimalna gornja marginalna stopa (Mirrlees-Saez ABC formula) | Saez (2001) optimalna gornja stopa; moderna f | strong | high | [@saez2001] | ### Mirrleesov model i oporezivanje rada — nakon o |
| 6 | Diamond-Mirrleesov teorem proizvodne efikasnosti | Diamond i Mirrlees (1971), production efficie | strong | high | ⚠ MISSING | ### Optimalni instrumenti u Fazi 1 — nakon odlomka |

**[1] Ramseyjevo pravilo (inverzna elastičnost)**

```latex
$$
\frac{t_i}{1+t_i} = \frac{\lambda}{\varepsilon_i}, \qquad \frac{t_i}{t_j} = \frac{\varepsilon_j}{\varepsilon_i}
$$
```
*Zašto:* Propozicija prp-ramsey trenutno je posve verbalna ('postotno smanjenje količine jednako za sva dobra'), a to je upravo rezultat koji se najjasnije vidi kao formula. Oblik t_i/t_j = ε_j/ε_i čini eksplicitnim zašto neelastična dobra (gorivo, duhan) nose više poreza i izravno se vezuje uz već postojeći graf fig-ramsey-dwl. Inverzna elastičnost je intuitivna i grafički poduprta, idealna za udžbenik. NAPOMENA RECENZENTA: uz formulu navesti da je ε_i uzeta kao apsolutna vrijednost (pozitivna konvencija) elastičnosti potražnje, i da drugi izraz t_i/t_j=ε_j/ε_i slijedi iz prvog uz aproksimaciju t/(1+t)≈t za male stope te uz pretpostavku neovisnih (nepovezanih) potražnji — tada se opći Ramseyev sustav reducira na inverznu elastičnost.

**[2] Mrtvi teret kao Harbergerov trokut**

```latex
$$
DWL \approx \tfrac{1}{2}\,\varepsilon\,\frac{t^2}{p}\,q = \tfrac{1}{2}\,t\,\Delta Q, \qquad \frac{\partial^2 DWL}{\partial t^2} > 0
$$
```
*Zašto:* def-mrtvi-teret već sadrži ½t(Q*−Qt) i tekstualno tvrdi 'raste s kvadratom porezne stope i s elastičnošću'. Eksplicitan oblik ½·ε·(t²/p)·q čini tu tvrdnju vidljivom: DWL je proporcionalan ε i t². Izvod: ΔQ=ε·q·(t/p) (definicija elastičnosti uz Δp=t) → DWL=½·t·ΔQ=½·ε·(t²/p)·q. Graf fig-mrtvi-teret-skaliranje već numerički demonstrira t² skaliranje, pa jednadžba samo zaokružuje ono što student već vidi. RECENZENT: derivacija i dimenzijska konzistentnost provjerene i točne.

**[3] Porezna incidencija (formula prijenosa)**

```latex
$$
\frac{\partial P_c}{\partial t} = \frac{\varepsilon_s}{\varepsilon_s + |\varepsilon_d|}, \qquad \frac{\partial P_p}{\partial t} = \frac{-|\varepsilon_d|}{\varepsilon_s + |\varepsilon_d|}
$$
```
*Zašto:* Tvrdnja 'strana koja je manje elastična snosi veći dio tereta' (red. 352) iskazana je samo riječima, dok je graf fig-porezna-incidencija interno već računa preko buyerShare. Eksplicitna formula udjela kupaca εs/(εs+|εd|) jedna je od najpamtljivijih jednadžbi javnih financija, niske notacijske težine, i pretvara verbalno pravilo u provjerljiv izraz koji student može uvrstiti (εs=2, |εd|=0,5 → kupci nose 80 %). RECENZENT: dva udjela zbrajaju se u 1 (∂Pc/∂t − ∂Pp/∂t = 1, jer Pc−Pp raste za t), formula i predznaci točni.

**[4] Lafferov vrh (stopa koja maksimizira prihod)**

```latex
$$
R(t) = t\,B_0\,(1-t)^{\varepsilon} \;\Longrightarrow\; \frac{dR}{dt}=0 \;\Longrightarrow\; t^{*} = \frac{1}{1+\varepsilon}
$$
```
*Zašto:* Formula t*=1/(1+ε) već je u prozi (red. 2085) i u fig-cap, a model B(t)=B0(1−t)^ε doslovno je napisan u komentaru OJS koda fig-laffer (red. 2114-2116). Postavljanje punog lanca R(t)→dR/dt=0→t* kao display jednadžbe pretvara 'magičnu' formulu u kratak, izvediv rezultat i izravno povezuje Laffer s elastičnošću oporezive osnovice (Saez). RECENZENT: izvod dR/dt=B0(1−t)^(ε−1)[(1−t)−tε]=0 ⇒ t*=1/(1+ε) potvrđen; identičan formuli u OJS kodu i R kodu (red. 2211).

**[5] Optimalna gornja marginalna stopa (Mirrlees-Saez ABC formula)**

```latex
$$
\tau^{*} = \frac{1}{1 + a\,\varepsilon}, \qquad a = \frac{\bar{z}}{\bar{z}-z^{*}}
$$
```
*Zašto:* Mirrleesov odjeljak (red. 1754) zaključuje verbalno da 'optimalni sustav ne mora imati ekstremno visoke stope za najbogatije', a to je upravo Saezova formula τ*=1/(1+aε) koja taj zaključak čini operativnim: stopa pada s elastičnošću ε i raste s debljinom gornjeg repa (Paretov parametar a). saez2001 već je citiran u poglavlju. Notacija je zahtjevnija (Paretov parametar), pa zaslužuje kratko objašnjenje uz callout-vjezba; zato 'strong/high'. NAPOMENA RECENZENTA: ovo je pojednostavljeni (revenue-maximizing) oblik koji vrijedi uz pretpostavku zanemarive socijalne težine na vrhu (ḡ→0); opći Saezov izraz je τ=(1−ḡ)/(1−ḡ+aε). Pri uvođenju eksplicitno reći da je ḡ→0 (Rawlsovska/maksimizacija prihoda), inače formula nije potpuna. a=z̄/(z̄−z*) gdje je z̄=E[z|z>z*] prosječni dohodak iznad praga — točno.

**[6] Diamond-Mirrleesov teorem proizvodne efikasnosti**

```latex
$$
t_{\text{int}}^{*} = 0 \quad\Longrightarrow\quad MRT_{ij} = \frac{q_i}{q_j} \;\text{(jedinstvene proizvođačke cijene, gospodarstvo na PPF-u)}
$$
```
*Zašto:* Cijela AI-sekcija (Korinek-Lockwood) i tablica tbl-ai-faze počivaju na jednom klasičnom rezultatu koji se nikad ne imenuje: ne oporezuj međuinpute (compute, GPU, trening), oporezuj finalnu potrošnju, jer to čuva proizvodnu efikasnost. Imenovanje teorema i formalizacija t*_int=0 pokazuje studentu da preporuka 'NE na računarsku snagu' nije ad hoc nego izravna posljedica Diamond-Mirrleesa iz 1971. ISPRAVAK RECENZENTA: originalni latex je imao MRT_ij=MRS_ij, što je EKONOMSKI POGREŠNO — uz porez na finalna dobra potrošačeve cijene se razlikuju od proizvođačkih, pa MRS (=omjer potrošačkih cijena) NIJE jednak MRT (=omjer proizvođačkih cijena); upravo ta razlika JEST distorzija potrošnje. Proizvodna efikasnost znači samo da je proizvodna strana neiskrivljena (MRT=omjer proizvođačkih cijena q_i/q_j, gospodarstvo ostaje na granici proizvodnih mogućnosti, MRTS izjednačen među poduzećima), a ne MRT=MRS. Latex je ispravljen. Referenca diamond1971 NEDOSTAJE u references.bib — mora se dodati prije korištenja [@diamond1971].

**Gdje produbiti (izvodi / vježbe):** Tri konkretne prilike za prošireni tretman, sve provjerene kao matematički točne: (1) WORKED DERIVATION Lafferova vrha — postojeći odlomak (red. 2085) već tvrdi t*=1/(1+ε), a OJS komentar (red. 2114-2116) ima model B(t)=B0(1−t)^ε; idealno mjesto za 4-redni izvod R(t)=t·B0(1−t)^ε → dR/dt=B0(1−t)^(ε−1)[(1−t)−tε]=0 → t*=1/(1+ε), uz numerički primjer (ε=0,5 → t*=66,7 %; ε=1 → t*=50 %; ε=2 → t*=33 %), čime se povezuje Laffer s elastičnošću osnovice. NAPOMENA: ε=0,5 daje t*=1/1,5=66,7 %, NE 67 % zaokruženo na cijeli broj kako je analitičar napisao '67 %' — preciznije je 66,7 %. (2) callout-vjezba za incidenciju — uz formulu εs/(εs+|εd|), zadatak 'cigarete |εd|=0,4, εs=2,0: koliki postotak trošarine snose pušači?' (odgovor 2,0/2,4=83,3 %, RECENZENT POTVRDIO) izravno nadopunjuje graf fig-porezna-incidencija. (3) FORMALNI OKVIR uz def-mrtvi-teret — proširiti definiciju u mini-izvod Harbergerova trokuta DWL=½·(t²/p)·ε·q iz ΔQ=εq(t/p), čime se eksplicitno izvodi kvadratno skaliranje koje graf fig-mrtvi-teret-skaliranje već numerički prikazuje. Sve tri nadograđuju POSTOJEĆE grafove i okruženja, niskorizične su za čitljivost.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

RECENZIJA MATEMATIČKE TOČNOSTI (6 jednadžbi). Sintaksa LaTeX-a ispravna u svim prijedlozima (renderiraju se bez greške). PROVJERA CITATA protiv references.bib: ramsey1927 (red. 650) PRESENT; gruber2019 (red. 418) PRESENT; saez2001 (red. 748) PRESENT; mirrlees1971 (red. 548) PRESENT; harberger1954 (red. 1908) postoji ali nije korišten (Harberger prijedlog citira gruber2019). diamond1971 MISSING — mora se dodati u references.bib prije uporabe.\n\n1) RAMSEY [@ramsey1927 — present] — OK. Inverzno-elastični specijalni slučaj točan: t_i/t_j=ε_j/ε_i (neelastičnija dobra više oporezivana) je egzaktan; t_i/(1+t_i)=λ/ε_i je standardni ad-valorem oblik. UPOZORENJE (notacija, ne greška): drugi izraz slijedi iz prvog uz t/(1+t)≈t (male stope) i uz neovisne potražnje; ε_i tretirati kao apsolutnu vrijednost. Dodati tu rečenicu uz formulu. Tier core/medium — primjereno.\n\n2) HARBERGER DWL [@gruber2019 — present] — OK. Izvod ΔQ=εq(t/p) → DWL=½t·ΔQ=½ε(t²/p)q dimenzijski i algebarski potvrđen. ∂²DWL/∂t²>0 (konveksnost) točno. Tier core/low — primjereno.\n\n3) INCIDENCIJA [@gruber2019 — present] — OK. Predznaci točni (∂Pc/∂t>0, ∂Pp/∂t<0), udjeli se zbrajaju u 1, numerika 80 % i 83,3 % potvrđena. Tier core/low — primjereno.\n\n4) LAFFER [@saez2001 — present] — OK. Puni lanac dR/dt=B0(1−t)^(ε−1)[(1−t)−tε]=0 ⇒ t*=1/(1+ε) potvrđen; identičan kodu poglavlja (OJS red. 2116, R red. 2211). Tier strong/medium — primjereno.\n\n5) SAEZ ABC [@saez2001 — present] — UPOZORENJE (nepotpuna pretpostavka, ne greška). τ*=1/(1+aε) točan je SAMO kao revenue-maximizing slučaj uz socijalnu težinu na vrhu ḡ→0; opći Saezov rezultat je τ=(1−ḡ)/(1−ḡ+aε). Pri uvođenju OBVEZNO navesti pretpostavku ḡ→0 (Rawls/maksimizacija prihoda), inače je iskaz necjelovit. a=z̄/(z̄−z*), z̄=E[z|z>z*] — točno. Tier strong/high — primjereno (Paretov parametar zahtijeva objašnjenje).\n\n6) DIAMOND-MIRRLEES [@diamond1971 — MISSING] — ISPRAVLJENO. Originalni RHS 'MRT_ij=MRS_ij' EKONOMSKI POGREŠAN: uz porez na finalna dobra potrošačke cijene ≠ proizvođačke, pa MRS≠MRT u optimumu (ta razlika JE distorzija potrošnje). Proizvodna efikasnost znači neiskrivljenu PROIZVODNU stranu (MRT=omjer proizvođačkih cijena, MRTS izjednačen među poduzećima, gospodarstvo na PPF-u), NE jednakost MRT i MRS. Latex ispravljen na t_int*=0 ⇒ MRT_ij=q_i/q_j (jedinstvene proizvođačke cijene, PPF). Tier strong/high — primjereno. KRITIČNO: dodati diamond1971 u references.bib prije uporabe.

</details>

---

## chapters/15-eu-javne-financije.qmd — Javne financije Europske unije (EU public finances)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema niti jedne display jednadžbe ($$) niti inline matematike; tri definicijska okruženja (#def-fiskalna-unija, #def-europska-javna-dobra, #def-europski-semestar, #def-vlastita-sredstva) i sva theorem-slična mjesta iskazana su isključivo verbalno, a nema nijednog #thm- ni #prp- okruženja.

**Jaz:** Poglavlje imenuje sve kanonske formalne modele teme u prozi, ali nijedan ne formalizira. Konkretno: (1) Oatesov teorem decentralizacije i logika fiskalnog federalizma ('politike se financiraju na razini gdje se koristi i troškovi najbolje preklapaju') spominje se dvaput (@oates1972, @oates1999) bez ijedne jednadžbe; (2) teorija optimalnog valutnog područja (Mundell, Kenen) izložena je čisto narativno iako postoji standardni asimetrični-šok / dijeljenje-rizika okvir; (3) empirijski callout o apsorpciji regionalnih šokova u SAD-u (@sachssala1991, @sorensenyosha1998) navodi 'znatan dio pada dohotka se neutralizira' bez ijednog koeficijenta stabilizacije, premda je upravo to numerička srž tih radova i lako se iskazuje jednom regresijskom jednadžbom; (4) 'europska javna dobra' definiraju se preko neisključivosti i nekonkurentnosti te problema eksternalija i podinvestiranja, ali bez Samuelsonovog uvjeta koji formalno objašnjava ZAŠTO decentralizirano financiranje daje premalo dobra; (5) cijela 'institucionalna asimetrija' (zajednička monetarna, nacionalna fiskalna politika) i logika fiskalnih pravila počiva na dinamici duga koja se nigdje ne zapisuje, premda referentne vrijednosti 3% i 60% imaju izravnu jednadžbu stabilizacije omjera duga prema BDP-u.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Samuelsonov uvjet za (europska) javna dobra | Samuelsonov uvjet optimalne razine javnog dob | core | low | [@samuelson1954] | Europska javna dobra kao novi argument (uz #def-eu |
| 2 | Oatesov teorem decentralizacije | Oatesov teorem decentralizacije / fiskalni fe | strong | medium | [@oates1972; @oates1999] | Europska javna dobra kao novi argument (zadnji odl |
| 3 | Stabilizacija omjera javnog duga i maastrichtski kriteriji | Jednadžba dinamike omjera duga prema BDP-u; u | core | medium | [@degrauwe2022] | Kratka povijest fiskalnih pravila (kod odlomka o M |
| 4 | Koeficijent fiskalne stabilizacije (dijeljenje rizika) | Mjera fiskalne apsorpcije asimetričnih šokova | strong | medium | [@sachssala1991; @sorensenyosha1998] | ::: {.callout-empirija} u sekciji 'Europska javna  |
| 5 | Tieboutov mehanizam 'glasanja nogama' | Tieboutov model lokalne ponude javnih dobara  | optional | medium | ⚠ MISSING | Javne financije u nacionalnoj državi (odlomak o de |

**[1] Samuelsonov uvjet za (europska) javna dobra**

```latex
$$
\sum_{i=1}^{n} MRS_i \;=\; MRT \qquad \text{nasuprot decentraliziranom} \quad MRS_i = MRT
$$
```
*Zašto:* Daje formalnu jezgru cijeloj sekciji. Lijeva strana zbraja granične stope supstitucije SVIH zemalja koje uživaju korist, desna je granična stopa transformacije; kad svaka zemlja izjednačava samo VLASTITI MRS s MRT, financira premalo. Jedna jednadžba pretvara verbalno 'dio koristi odlazi drugima pa je ulaganje prenisko' u egzaktan uvjet i objašnjava zašto obrana, energetska i klimatska politika pripadaju europskoj razini. Knjiga već koristi Samuelsona u ranijim poglavljima (#samuelson1954 postoji u bibu), pa je notacija studentima poznata i grafički ilustrabilna vertikalnim zbrajanjem krivulja potražnje.

**[2] Oatesov teorem decentralizacije**

```latex
$$
W_{\text{dec}} \;\geq\; W_{\text{cen}} \quad\text{ako}\quad \text{nema prelijevanja koristi i preferencije se razlikuju među jedinicama}
$$
```
*Zašto:* Daje formalno pravilo dodjele razine vlasti koje poglavlje koristi implicitno na nekoliko mjesta (zašto lokalne usluge ostaju lokalne, a obrana ide na EU razinu). Iskazana kao propozicija (::: {#prp-decentralizacija}) s blagostanjem W pod decentralizacijom vs. centralizacijom i dvama uvjetima (odsutnost eksternalija + heterogenost preferencija) precizno razgraničava domenu nacionalnog od europskog financiranja. Verbalno blaga, notacijski skromna, izravno povezuje DIO V s alokacijskom funkcijom iz DIO I.

**[3] Stabilizacija omjera javnog duga i maastrichtski kriteriji**

```latex
$$
\Delta b_t \;=\; \underbrace{(r_t - g_t)\,b_{t-1}}_{\text{efekt kamata i rasta}} \;-\; pb_t, \qquad b^{*} = \frac{d}{g}
$$
```
*Zašto:* Pretvara 'magične brojke' 3% i 60% iz proizvoljnih granica u izvedeni rezultat. Druga relacija b*=d/g pokazuje da se uz deficit d=3% i nominalni rast g=5% omjer duga stabilizira na 60%, što je upravo originalna maastrichtska kalibracija — pedagoški 'aha' trenutak. Prva relacija (snowball efekt r-g) objašnjava zašto je dug opasniji u zemlji sa 140% nego sa 40% i time formalizira 'rizično utemeljen pristup' novog okvira iz 2024. koji poglavlje spominje. Iznimno visoka vrijednost jer povezuje povijesnu, pravilnu i reformsku raspravu u jednu jednadžbu.

**[4] Koeficijent fiskalne stabilizacije (dijeljenje rizika)**

```latex
$$
\beta \;=\; 1 - \frac{\partial\, (Y_i - T_i + Z_i)}{\partial\, Y_i}, \qquad 0 \le \beta \le 1
$$
```
*Zašto:* Callout tvrdi 'znatan dio pada dohotka se neutralizira' bez ijednog broja, a upravo je koeficijent beta numerička poanta oba citirana rada. beta pokazuje koliki se udio pada dohotka neke regije apsorbira porezima (T) i transferima (Z) savezne razine; za SAD ocjene su reda 0,2–0,3, za rano europodručje znatno niže. Jedna jednadžba kvantificira ključnu razliku između fiskalne federacije i EMU-a koju cijelo poglavlje gradi i daje studentima alat za 'Vježbu s podacima'. Ekonomski točno definiran kao 1 minus osjetljivost raspoloživog dohotka na regionalni šok.

**[5] Tieboutov mehanizam 'glasanja nogama'**

```latex
$$
i \;\text{bira jurisdikciju}\; j^{*} = \arg\max_{j}\; U_i\bigl(g_j,\, t_j\bigr) \quad\text{uz}\quad \textstyle\sum_{k \in j} t_k = c(g_j)
$$
```
*Zašto:* Tiebout je u zadatku naveden kao kanonski model, ali ga poglavlje uopće ne spominje, a referenca ne postoji u bibu. Mehanizam (pojedinac bira jurisdikciju koja najbolje odgovara njegovim preferencijama nad parom javno dobro g i porez t) objašnjava ZAŠTO niska mobilnost rada u EU — koju Mundell ističe kao uvjet OVP-a — slabi tržišni mehanizam discipliniranja i pojačava potrebu za pravilima. Optional jer zahtijeva novu bib referencu i blago širi opseg; uključiti samo ako se želi zaokružiti veza fiskalni federalizam–OVP. Ako se izostavi, ostala četiri prijedloga su samodostatna.

**Gdje produbiti (izvodi / vježbe):** Tri prirodna mjesta za prošireni formalni tretman bez narušavanja studentske čitljivosti: (1) Worked derivation maastrichtskih brojki — kratak izvod b*=d/g iz jednadžbe dinamike duga uz brojčani primjer (d=3%, g=5% -> b*=60%) idealno stoji kao numerička 'Politika u praksi' (.callout-praksa) ili boks uz @tbl-povijest; pretvara najpoznatije EU brojke iz dogme u rezultat. Pri izvodu izrijekom napomenuti da je d UKUPNI (a ne primarni) deficit, jer prva relacija u istoj jednadžbi koristi primarni saldo pb_t — student mora vidjeti da su to dva različita koncepta deficita inače izvod djeluje proturječno. (2) Numerička .callout-vjezba na koeficijentu beta — studentima dati hipotetske podatke o padu dohotka regije i promjeni poreza/transfera te tražiti da izračunaju beta za 'SAD' i 'rano europodručje' i usporede; nadovezuje se na postojeću vježbu o veličini EU proračuna i prirodno produbljuje empirijski callout (@sachssala1991, @sorensenyosha1998). (3) Mali formalni okvir uz Samuelsonov uvjet — vertikalno zbrajanje graničnih koristi (sum MRS = MRT) s grafičkom intuicijom (zbrajanje krivulja potražnje po vertikali) i jednom rečenicom zašto decentralizirano financiranje obrane/klime daje premalo; može dijeliti B&W/monospace grafikon-twin konvenciju knjige za prikaz vertikalnog zbrajanja. Sva tri okvira drže poglavlje pretežno kvalitativnim, ali daju studentu po jednu izračunljivu kotvu po ključnoj sekciji (pravila, federacija, javna dobra).

<details><summary>Provjera (adverzarijalni recenzent)</summary>

ADVERZARIJALNA PROVJERA — sažetak po jednadžbi. Status citata provjeren čitanjem references.bib (linije 1775, 1933, 1953, 1961, 1972, 1982, 1992, 2002).

1) SAMUELSONOV UVJET — TOČNOST: OK. LaTeX sintaksa valjana, renderira se. Sum_{i} MRS_i = MRT je kanonski Samuelsonov uvjet za čisto javno dobro (vertikalno zbrajanje graničnih koristi), a kontrast MRS_i = MRT točno hvata decentralizirano podinvestiranje (svaka zemlja izjednačava SAMO vlastiti MRS s MRT pa je suma < MRT i dobro je preniska). Ekonomski besprijekorno. CITAT: present (@samuelson1954, linija 1775, Review of Economics and Statistics 36(4), DOI 10.2307/1925895). RAZINA: valueTier=core i difficulty=low realni; notacija MRS/MRT studentima je već poznata iz alokacijskog poglavlja (DIO I), grafički ilustrabilno. Bez izmjena.

2) OATESOV TEOREM — TOČNOST: ISPRAVLJENO (logička, ne računska greška). Original je koristio biconditional \Longleftrightarrow (W_dec >= W_cen <=> nema prelijevanja I preferencije se razlikuju). To je prejaka tvrdnja: Oatesov teorem daje DOVOLJAN uvjet (ako nema eksternalija/spillovera i preferencije su heterogene, decentralizacija je slabo bolja), nije iff. Protuprimjer: ako su preferencije identične među jedinicama, i dalje vrijedi W_dec >= W_cen (jednakost), pa desna strana iff-a ne mora biti istinita da bi lijeva vrijedila — biconditional pada. Zamijenjen \Longleftrightarrow s 'ako' (implikacija dovoljnog uvjeta). Smjer nejednakosti W_dec >= W_cen je TOČAN (decentralizacija weakly dominira pod navedenim uvjetima). CITAT: present (@oates1972 linija 1953, Fiscal Federalism; @oates1999 linija 1961, JEL 37(3), DOI 10.1257/jel.37.3.1120). RAZINA: strong/medium realno; preporuka da se iskaže kao #prp- propozicija kako bi se uvjeti (odsutnost spillovera + heterogenost) jasno razdvojili od zaključka.

3) DINAMIKA DUGA + MAASTRICHT — TOČNOST: OK uz jednu obveznu napomenu. \Delta b_t = (r_t - g_t) b_{t-1} - pb_t je standardna (linearizirana, za mali g) jednadžba snowball efekta; predznaci točni — primarni SUFICIT pb_t smanjuje dug (zato -pb_t), a (r-g)>0 ga povećava. Egzaktni oblik ima nazivnik (1+g_t), ovdje opravdano izostavljen kao aproksimacija za udžbenik. b*=d/g je TOČAN steady-state: u ravnoteži B raste po stopi g, deficit d·Y održava omjer, pa g·b = d => b=d/g; uz d=0,03 i g=0,05 daje b*=0,60 (60%) — upravo maastrichtska kalibracija, provjereno. UPOZORENJE (nije greška, ali mora se eksplicirati u tekstu): prva relacija koristi PRIMARNI saldo pb_t, a b*=d/g koristi UKUPNI deficit d (uključuje kamate). Dva različita koncepta deficita u istoj jednadžbi; bez izričite napomene student bi mogao pomisliti da su isti. Dodati rečenicu 'd je ukupni deficit, pb primarni saldo'. CITAT: present (@degrauwe2022 linija 1933, Economics of Monetary Union, 14. izd.) — adekvatan izvor za snowball/maastrichtsku aritmetiku. RAZINA: core/medium realno.

4) KOEFICIJENT DIJELJENJA RIZIKA beta — TOČNOST: OK. beta = 1 - d(Y_i - T_i + Z_i)/dY_i je ispravno strukturiran: raspoloživi dohodak = bruto dohodak - porezi + transferi; udio šoka koji se PROPUSTI u raspoloživi dohodak je parcijalna derivacija, a apsorbirani (stabilizirani) udio je 1 minus to. Predznaci točni (T ulazi s minusom, Z s plusom). Granice 0<=beta<=1 razumne za stabilizirajući sustav. Slaže se s Sachs–Sala-i-Martin / Asdrubali-Sorensen-Yosha okvirom; navedeni red veličine 0,2–0,3 za federalni kanal u SAD-u je u skladu s literaturom. Minor: u empirijskim radovima to je regresijski koeficijent na promjenama (Δ), a ne doslovno parcijalna derivacija razina — ali kao pedagoška definicija osjetljivosti potpuno korektno; po želji dodati Δ notaciju. CITAT: present (@sachssala1991 linija 1992, NBER WP 3855; @sorensenyosha1998 linija 2002, J. Int. Economics 45(2)). RAZINA: strong/medium realno; idealno za .callout-vjezba.

5) TIEBOUT — TOČNOST: ISPRAVLJENO (sintaktička/notacijska greška u budžetskom ograničenju). Original: \sum_i t_j = c(g_j). Indeks zbrajanja i ne pojavljuje se u sumandu t_j (sumand ne ovisi o i), pa je \sum_i t_j formalno = (broj stanovnika)·t_j, što nije namjera. Ispravljeno u \sum_{k \in j} t_k = c(g_j) (zbroj poreza svih rezidenata jurisdikcije j pokriva trošak dobra) — sada indeks zbrajanja stvarno indeksira sumand. argmax formulacija j* = argmax_j U_i(g_j, t_j) je TOČNA i valjana ('glasanje nogama', sortiranje po snopu javno dobro/porez). Ostatak LaTeX-a renderira se. CITAT: missing — Tiebout (1956) NE postoji u references.bib (potvrđeno; pretraga 'tiebout/Local Expenditures/glasanje nogama' bez pogodaka). Treba dodati novu bib stavku prije uporabe ključa. Predloženi navod (JPE 64(5), 416–424, DOI 10.1086/257839) je točan. RAZINA: optional/medium realno — ispravno označen kao optional jer traži novu referencu i širi opseg; ostala četiri prijedloga samodostatna su bez njega.

ZAKLJUČAK: 2 jednadžbe ISPRAVLJENE (Oates biconditional->implikacija; Tiebout indeks zbrajanja), 1 s OBVEZNOM tekstualnom napomenom (dinamika duga: primarni vs. ukupni deficit), 2 OK bez izmjena. Svi citati osim Tiebouta present u references.bib; Tiebout missing i ispravno tako označen.

</details>

---

## 16-drzavni-neuspjesi (Državni neuspjesi i prepreke kvalitetnim javnim politikama)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje je u potpunosti kvalitativno — sadrži pet definicijskih okruženja (#def-) i nijedan #thm-/#prp-, sve iskazano isključivo verbalno bez ijedne display jednadžbe, uključujući i numerički zadatak u callout-vjezba koji je naveden samo riječima.

**Jaz:** Poglavlje imenom uvodi sve kanonske formalne modele teme (Tullockov mrtvi teret rent-seekinga [@tullock1967] u zaključku, regulatorno zarobljavanje [@stigler1971], Wolfovu teoriju netržišnog neuspjeha [@wolf1979], birokratski model [@niskanen1971]), ali nijedan ne dobiva niti jedan simbolički izraz. Konkretno: (1) Tullockova teza da puni društveni trošak rente nadmašuje Harbergerov trokut zato što se renta troši u natjecanju eksplicitno je iskazana riječima u zaključku ('puni društveni trošak neke mjere može nadmašiti tržišni gubitak'), ali bez nejednakosti koja to pokazuje — a upravo je to srž poglavlja. (2) Numerički zadatak u callout-vjezba traži od studenta da izračuna neto učinak intervencije (uklonjeni gubitak minus tri troška remedije), što je u biti nejednadžba uvjeta opravdanosti intervencije, ali poglavlje studentu nigdje ne daje tu nejednadžbu u zatvorenom obliku. (3) Politički neuspjeh kratkoročnosti [@nordhaus1975] i regulatorno zarobljavanje [@stigler1971; @olson1965] tretiraju se čisto verbalno premda imaju standardne formalizacije (vremenska nekonzistentnost, Beckerova/Stiglerova logika koncentrirane koristi). (4) Koncept 'snage države' i kvazifiskalnih troškova nema formalni izraz. Poglavlje je dobar kandidat za umjereno formaliziranje jer su modeli intuitivno objašnjivi i grafički predstavljivi (trokut + pravokutnik), a ne zahtijevaju tešku notaciju.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Uvjet opravdanosti intervencije (test neto koristi remedije) | Komparativna analiza neuspjeha — Wolf, A Theo | core | low | [@wolf1979] | Što znači neuspjeh države? (uz def-drzavni-neuspje |
| 2 | Tullockov mrtvi teret rent-seekinga (renta iznad Harbergerova trokuta) | Tullock — The Welfare Costs of Tariffs, Monop | core | medium | [@tullock1967] | Zaključno — ne protiv države, nego za bolju državu |
| 3 | Regulatorno zarobljavanje kao asimetrija poticaja za organiziranje | Stigler/Olson — koncentrirana korist nasuprot | strong | low | [@stigler1971] | Regulatorni neuspjesi (uz def-regulatorni-neuspjeh |
| 4 | Problem vremenske nekonzistentnosti optimalnih politika | Kydland–Prescott — Rules Rather than Discreti | strong | high | [@kydland1977] | Politički neuspjesi (uz def-politicki-neuspjeh) —  |
| 5 | Indeks otpornosti politike (formalizacija testa državnog neuspjeha) | Aditivni indeks po dimenzijama (operacionaliz | optional | low | ⚠ MISSING | Test državnog neuspjeha (neposredno prije OJS graf |
| 6 | Kvazifiskalni trošak skrivene intervencije | Implicitni (kvazifiskalni) trošak — Tanzi, Go | optional | low | [@tanzi2011] | Fiskalni neuspjesi (uz odlomak o kvazifiskalnim ak |

**[1] Uvjet opravdanosti intervencije (test neto koristi remedije)**

```latex
$$
\Delta W \;=\; \underbrace{B_{\text{rem}}}_{\text{uklonjeni tržišni gubitak}} \;-\; \underbrace{\big(A + D_{g} + C\big)}_{\text{trošak državnog neuspjeha}} \;>\; 0
$$
```
*Zašto:* Ovo je formalna srž cijelog poglavlja i izravno operacionalizira numerički zadatak iz callout-vjezba: intervencija je opravdana tek kad uklonjeni dio tržišnog gubitka B_rem nadmaši zbroj administrativnog (A), distorzijskog (D_g) i troška usklađivanja (C). Daje studentu zatvoreni izraz za 'usporedbu dvaju nesavršenih mehanizama' koju poglavlje propovijeda riječima. Notacija je minimalna (zbroj četiriju članova), a savršeno preslikava postojeću vježbu (B_rem=70, A=15, D_g=25, C=20 → ΔW = 70 − 60 = +10).

**[2] Tullockov mrtvi teret rent-seekinga (renta iznad Harbergerova trokuta)**

```latex
$$
SC \;=\; \underbrace{DWL}_{\text{Harbergerov trokut}} \;+\; \underbrace{\theta\, R}_{\text{rasipanje rente},\;0<\theta\le 1} \;>\; DWL
$$
```
*Zašto:* Zaključak već verbalno tvrdi da 'puni društveni trošak može nadmašiti tržišni gubitak' i citira Tullocka, ali bez izraza koji to dokazuje. Ova jednadžba pokazuje zašto državni neuspjeh može biti teži od tržišnog: uz mrtvi teret DWL dodaje se i dio (ili cijela) renta R koja se rasipa u natjecanju za povlasticu. Parametar θ obuhvaća raspon od potpune disipacije (θ=1, Posner) do djelomične. Grafički se objašnjava kao trokut + pravokutnik, idealno za udžbenik. Veže se na već postojeću napomenu da se mehanika razrađuje u poglavlju o interesnim skupinama.

**[3] Regulatorno zarobljavanje kao asimetrija poticaja za organiziranje**

```latex
$$
\frac{B}{n_b} \;\gg\; \frac{C}{n_t} \quad\Longrightarrow\quad \text{lobiranje korisno samo koncentriranoj skupini}
$$
```
*Zašto:* Poglavlje dvaput verbalno iznosi logiku 'koncentrirana korist, raspršeni trošak' (kod političkih i regulatornih neuspjeha) ali je nigdje ne kvantificira. Ova nejednakost pokazuje zašto mala industrija (n_b malen) ima jaku po-glavi korist B/n_b dok velika javnost (n_t velik) ima zanemarivu po-glavi štetu C/n_t — čak i kad je ukupni trošak C veći od koristi B. Najjasnije moguće sažimanje Stiglerove i Olsonove teze, lako intuitivno objašnjivo studentu. Notacija trivijalna.

**[4] Problem vremenske nekonzistentnosti optimalnih politika**

```latex
$$
\pi^{*}_{t}\;\big(\text{ex ante}\big) \;\neq\; \underbrace{\arg\max_{\pi}\; U\big(\pi \mid \pi^{e}=\pi^{*}_{t}\big)}_{=\;\pi^{d}_{t}\;(\text{ex post})}
$$
```
*Zašto:* Kanonski model teme (naveden u zadatku) koji poglavlje uopće ne spominje eksplicitno premda mu je kratkoročnost središnja tema. Jednadžba pokazuje srž problema: politika optimalna kada se najavi (π*) nije ona koju je akteru optimalno provesti kada dođe trenutak (π^d), pa bez mehanizma obvezivanja diskrecija sustavno odstupa od optimuma. Povezuje ch16 s ch04 (politički ciklusi) i ch11 (konstitucionalna ekonomika, pravila). Difficulty=high jer traži pojam očekivanja π^e i razlike ex ante/ex post; preporuka je staviti je u callout ili fusnotu uz verbalno objašnjenje, ne u glavni tok.

**[5] Indeks otpornosti politike (formalizacija testa državnog neuspjeha)**

```latex
$$
R \;=\; \frac{1}{3J}\sum_{j=1}^{J} s_j \;\in\; [0,1], \qquad s_j\in\{0,1,2,3\},\; J=8
$$
```
*Zašto:* Interaktivni graf već računa pct = round(total/24*100) ali studentu ta formula nije eksplicitno dana u tekstu. Eksplicitno iskazivanje indeksa R (prosjek osam ocjena normaliziran na maksimum 3) učinilo bi vezu između osam pitanja i ukupne presude transparentnom i ponovljivom bez interaktivnog alata (npr. u PDF-u). Niska vrijednost jer je više didaktička transparentnost nego nova teorija; označeno optional da se ne preformalizira ono što je u biti heuristika.

**[6] Kvazifiskalni trošak skrivene intervencije**

```latex
$$
TC \;=\; G_{\text{budget}} \;+\; \underbrace{QF}_{\text{kvazifiskalno: } |\Delta p| \cdot Q + L + \dots}
$$
```
*Zašto:* Poglavlje snažno tvrdi 'ono što nije u proračunu nije nužno besplatno', ali to ostaje slogan. Ova identičnost razdvaja vidljivi proračunski trošak (G_budget) od skrivenog kvazifiskalnog tereta QF (npr. gubitak od kontrole cijena |Δp|·Q, vrijednost jamstava L), pokazujući da ukupni trošak TC ostaje isti bez obzira na to gdje se knjiži. Pedagoški korisna jer 'opovrgava iluziju besplatnosti' jednim izrazom. Optional jer je više računovodstvena identičnost nego model; difficulty=low.

**Gdje produbiti (izvodi / vježbe):** Tri prirodna mjesta za prošireni analitički tretman. (1) NAJBOLJA prilika — postojeći callout-vjezba na kraju već postavlja potpun numerički scenarij (monopol, gubitak 100, remedija uklanja 70 uz troškove 15+25+20). Treba ga eksplicitno vezati uz prijedlog #1 (uvjet ΔW = B_rem − (A + D_g + C) > 0): dodati izvedbu u kojoj se brojevi uvrste (ΔW = 70 − 60 = +10, dakle neto korist 10 mln), i proširiti zadatak prag-pitanjem 'pri kojem bi distorzijskom trošku D_g intervencija postala neto štetna?'. VERIFICIRANO: prag je D_g > 35, jer 70 − (15 + D_g + 20) < 0 ⇔ D_g > 35; pri zadanome D_g=25 marža do praga iznosi 10. Time se uvodi prag-analiza bez nove teorije. (2) Worked derivation Tullockove nejednakosti SC = DWL + θR u zaključku — pokazati grafički (trokut + pravokutnik renta) i brojčano usporediti scenarij čistog monopola (samo DWL) sa scenarijem regulatorne rente gdje se kvota brani lobiranjem (DWL + θR), čime se zaključna teza 'državni neuspjeh teži od tržišnog' dobiva i kvantitativno; idealno kao callout-empirija s uputom na Krugerove [@krueger1974] procjene udjela rente u BDP-u. (3) Formalni okvir za politički neuspjeh — kratki box (callout-praksa ili fusnota) s Kydland–Prescott pojmom obvezivanja, koji povezuje kratkoročnost iz ovog poglavlja s pravilima iz ch11 (konstitucionalna ekonomika) i fiskalnim pravilima iz ch04; ovdje preporučam ostati na razini intuicije i jedne nejednakosti (π* ≠ π^d) jer je puni model previše za ovaj uvodni udžbenik. Napomena o ravnoteži: poglavlje ne treba postati matematičko — prijedloge #1–#3 ugraditi u glavni tok, a #4–#6 ostaviti kao opcionalne callout/fusnota umetke da se zadrži dominantno kvalitativni karakter teme.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

CITATI: svih osam citiranih ključeva PRESENT u references.bib i odgovaraju navedenim djelima — tullock1967 (Western Economic Journal 1967, present), wolf1979 (J. Law & Econ 1979, present), stigler1971 (present), kydland1977 (JPE 1977 'Rules Rather than Discretion', present, točan ključ), olson1965 (present), tanzi2011 (Government versus Markets, present), krueger1974 (AER 1974, present), nordhaus1975/niskanen1971 (present). Nijedan wrong-key. Prijedlog #5 ispravno označava da citat nije potreban (interna operacionalizacija).

PO JEDNADŽBI:

#1 ΔW = B_rem − (A + D_g + C) > 0 — TOČNOST: OK. LaTeX valjan (underbrace/big parentheses renderiraju se bez greške). Ekonomski ispravno: intervencija opravdana iff uklonjeni tržišni gubitak nadmaši zbroj triju troškova remedije. Brojčano provjereno: 70 − 60 = +10, slaže se s vježbom. Citat present. RAZINA: core/low realno za studente. (Rationale izvornog prijedloga sadržavao je suvišan izračun '100 = B+30' koji ne odgovara strukturi zadatka; uklonjen radi jasnoće — ne mijenja jednadžbu.)

#2 SC = DWL + θR > DWL, 0<θ≤1 — TOČNOST: OK. LaTeX valjan. Ekonomski ispravno: socijalni trošak = Harbergerov trokut + disipirana renta; uz θ∈(0,1] vrijedi θR>0 pa SC>DWL. θ=1 = Posnerova potpuna disipacija. Smjer nejednakosti TOČAN. Citat present. RAZINA: core/medium opravdano (uvodi novi pojam disipacije rente). NAPOMENA: pri grafičkom prikazu naglasiti da je R rektangl rente, a DWL trokut — ne preklopiti ih.

#3 B/n_b ≫ C/n_t ⟹ lobiranje korisno samo koncentriranoj skupini — TOČNOST: OK. LaTeX valjan. Ekonomski ispravno: per-capita asimetrija (Olson/Stigler). Ključni Olsonov uvid — nejednakost može vrijediti i kad je ukupni C>B, jer n_t≫n_b — korektno reflektiran. Citat present. RAZINA: strong/low realno; notacija trivijalna.

#4 π*_t ≠ argmax U(π|π^e=π*_t) = π^d_t — TOČNOST: OK (uz pojašnjenje, latex blago doučvršćen: argmax i =π^d sada unutar zajedničkog underbrace radi jednoznačnog vezivanja). LaTeX valjan. Ekonomski ispravno: uvjet vremenske nekonzistentnosti — pravilo π* nije najbolji odgovor na samoga sebe pri fiksiranim očekivanjima, pa postoji poticaj na devijaciju π^d (Barro-Gordon 'cheating' rješenje). UPOZORENJE (konceptualno, ne greška): π^d ovdje je devijacija uz očekivanja usidrena na pravilu, NIJE vremenski konzistentna ravnoteža (gdje π=π^e=π^d); to je legitiman i standardan način prikaza izvora problema, ali pri ugradnji treba u tekstu jasno reći da je riječ o 'iskušenju devijacije', a ne o ravnotežnoj inflaciji. Citat present (kydland1977, točan ključ). RAZINA: difficulty=high TOČNO; preporuka prijedloga da ide u callout/fusnotu, ne u glavni tok, ispravna za uvodni udžbenik. (Izvorni prijedlog je imao valueTier=strong — zadržano; obrana: model je kanonski ali tangencijalan središnjem testu poglavlja, pa nije core.)

#5 R = (1/3J)Σ s_j ∈ [0,1], s_j∈{0,1,2,3}, J=8 — TOČNOST: OK. LaTeX valjan. Matematički ispravno i TOČNO se slaže s OJS kodom: total=Σs_j, max=3·8=24, pa R=total/24; 1/(3J)=1/24. Raspon [0,1] korektan. Citat ispravno označen kao nepotreban (MISSING prihvatljiv). RAZINA: optional/low realno — didaktička transparentnost, ne nova teorija.

#6 TC = G_budget + QF, QF=|Δp|·Q + L + … — TOČNOST: OK (ISPRAVLJENO: izvorni 'Δp·Q' zamijenjen s '|Δp|·Q' jer je trošak/teret kontrole cijena nenegativan bez obzira na predznak promjene cijene; bez apsolutne vrijednosti izraz bi pri Δp<0 dao negativan 'trošak', što je pojmovno pogrešno). Inače je riječ o računovodstvenoj identičnosti/dekompoziciji, ne formalnom modelu — što rationale ispravno priznaje. L (vrijednost jamstava) i implicitni transfer |Δp|·Q razumne komponente. Citat present (tanzi2011). RAZINA: optional/low realno.

ZAKLJUČAK: Sve jednadžbe matematički i ekonomski zdrave. Dvije manje intervencije: #4 latex grupiran underbraceom radi nedvosmislenosti (sadržaj nepromijenjen); #6 dodana apsolutna vrijednost |Δp|. Smjerovi svih nejednakosti (#1 >0, #2 SC>DWL, #3 ≫) provjereni i točni — nema obrnutog predznaka poput ranije pogreške 'udio raste s n'. Prag D_g>35 iz detailedAnalysisOpportunities neovisno verificiran.

</details>

---

## 17-novi-javni-menadzment (Novi javni menadžment)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; sva četiri okruženja su #def- (NPM, upravljanje prema rezultatima, vrijednost za novac, Goodhartov zakon, agencifikacija) i iskazana su isključivo verbalno, bez ijednog formalnog #prp-/#thm- okvira.

**Jaz:** Poglavlje je teorijski bogato i točno, ali cijeli formalni aparat teorije poticaja koji STOJI IZA NPM-a postoji samo u prozi. Konkretno: (1) sekcija o ostatnom dohotku i preslikavanju tržišnih sila u bonuse opisuje optimalni linearni ugovor (sila poticaja vs. rizik i trošak napora) bez ijedne jednadžbe; (2) Goodhartov zakon i 'problem mjerenja' su VERBALNI iskaz Holmström-Milgromovog multitasking modela — knjiga objašnjava taktičku prilagodbu i izvrtanje napora prema mjerljivoj dimenziji riječima, dok za to postoji egzaktan komparativno-statički rezultat (jaka poticajna mjera na jednoj dimenziji povlači napor s nemjerljive dimenzije); (3) agencifikacija i kvazi-tržište 'naručitelj-pružatelj' su udžbenički primjer principal-agent strukture s moralnim hazardom, opisani bez participation/incentive-compatibility uvjeta; (4) 'vrijednost za novac' (ekonomičnost/učinkovitost/efektivnost) je kvalitativno definirana, a ima jednostavan formalni izraz omjera ishoda i troška. Niti jedan od ovih kanonskih modela (Holmström-Milgrom 1991, Holmström 1979, Laffont-Tirole 1993, Dixit 2002 'incentives in organizations') nema matematičko sidro u poglavlju, niti su odgovarajuće reference u references.bib.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Optimalni linearni poticajni ugovor (princip-agent s rizikom) | Holmströmov model agencije s linearnim ugovor | core | medium | ⚠ MISSING | Marketizacija javnog sektora (nakon odlomka koji o |
| 2 | Multitasking i izvrtanje napora prema mjerljivom (formalni temelj Goodhartova zakona) | Holmström-Milgromov multitasking model (Holms | core | high | ⚠ MISSING | Korporativno upravljanje i upravljanje prema rezul |
| 3 | Participation i incentive-compatibility uvjet (zašto poticaj uopće mora postojati) | Standardni principal-agent okvir s moralnim h | strong | medium | ⚠ MISSING | Agencifikacija i razdvajanje politike od provedbe  |
| 4 | Vrijednost za novac kao formalni omjer ishoda i troška (3E) | Kanonski okvir učinkovitosti javne potrošnje  | strong | low | @pollitt2017 | Korporativno upravljanje i upravljanje prema rezul |
| 5 | Niskanenov birokrat koji maksimizira proračun (teorijski poticaj za NPM) | Niskanenov model maksimizacije proračuna (Nis | optional | medium | @niskanen1971 | Odakle Novi javni menadžment (uz odlomak o Niskane |

**[1] Optimalni linearni poticajni ugovor (princip-agent s rizikom)**

```latex
$$
w(y) = \alpha + \beta\, y, \qquad y = e + \varepsilon,\ \ \varepsilon \sim \mathcal{N}(0,\sigma^2)\\[4pt] \beta^{*} = \frac{1}{1 + r\,\sigma^{2}\,C''(e)}
$$
```
*Zašto:* Daje matematičku okosnicu cijele NPM logike 'pay-for-performance'. Formula β* pokazuje da optimalna jačina poticaja PADA s rizikom mjere (σ²), averzijom prema riziku (r) i konveksnošću troška napora — što izravno objašnjava zašto se tržišni poticaji u javnom sektoru, gdje je ishod bučan i višedimenzionalan, namjerno drže slabima. Ekonomski je točna i intuitivno čitljiva: β=1 znači puni ostatni dohodak (privatni vlasnik), β=0 znači fiksnu plaću (klasični birokrat), pa povezuje tri mehanizma iz već postojeće sekcije.

**[2] Multitasking i izvrtanje napora prema mjerljivom (formalni temelj Goodhartova zakona)**

```latex
$$
w = \alpha + \beta_1 y_1 + \beta_2 y_2, \qquad y_j = e_j + \varepsilon_j\\[4pt] \frac{\partial e_1^{*}}{\partial \beta_2} < 0 \quad \text{kada su zadaće supstituti u trošku napora}\;\bigl(C_{12}>0\bigr)
$$
```
*Zašto:* Goodhartov zakon je u poglavlju iskazan VERBALNO, a ovo je njegov egzaktni mikroekonomski temelj. Rezultat ∂e₁*/∂β₂ < 0 formalno pokazuje da pojačavanje poticaja na mjerljivoj zadaći (y₂, npr. broj zahvata, rezultat na maturi) povlači napor s nemjerljive (y₁, kvaliteta skrbi, kritičko mišljenje) — točno mehanizam koji poglavlje opisuje na primjeru bolnice, škole i policije. Daje i normativnu pouku knjige (kad je jedna dimenzija nemjerljiva, optimalni β₂ se SNIŽAVA, do nule), čime opravdava postojeću preporuku o višestrukosti mjera. Visoka težina jer traži dvije zadaće i pojam supstitucije u trošku, pa pripada u prošireni izvedbeni okvir, ne u glavni tok.

**[3] Participation i incentive-compatibility uvjet (zašto poticaj uopće mora postojati)**

```latex
$$
\max_{\alpha,\beta}\ \mathbb{E}\bigl[y - w(y)\bigr] \quad \text{uz}\\[4pt] (\text{IR})\ \ \mathbb{E}[u(w)] - C(e) \ge \bar{u}, \qquad (\text{IC})\ \ e \in \arg\max_{e'} \ \mathbb{E}[u(w)] - C(e')
$$
```
*Zašto:* Agencifikacija i kvazi-tržište su udžbenički primjer principal-agent ugovaranja, ali poglavlje to nigdje ne formalizira. Ova dva uvjeta pokazuju ZAŠTO se javlja napetost: (IR) jamči da agent prihvati posao, (IC) da odabere napor koji principal želi — a kad ishod nije savršeno mjerljiv, IC zahtijeva izlaganje agenta riziku, što je trošak. Time se demistificira termin 'ugovor o učinku' iz sekcije o upravljanju prema rezultatima i povezuje s ranijim poglavljima o moralnom hazardu (ch02). Srednja težina jer su to standardni optimizacijski uvjeti bez izvođenja.

**[4] Vrijednost za novac kao formalni omjer ishoda i troška (3E)**

```latex
$$
\text{Učinkovitost} = \frac{\text{Output}}{\text{Input}}, \qquad \text{Efektivnost} = \frac{\text{Ishod}}{\text{Output}}\\[4pt] \text{Vrijednost za novac} = \frac{\text{Ishod}}{\text{Trošak}} = \underbrace{\frac{1}{c_{\text{in}}}}_{\text{ekonomičnost}} \cdot \underbrace{\frac{\text{Output}}{\text{Input}}}_{\text{učinkovitost}} \cdot \underbrace{\frac{\text{Ishod}}{\text{Output}}}_{\text{efektivnost}}
$$
```
*Zašto:* Definicija #def-value-for-money već nabraja ekonomičnost, učinkovitost i efektivnost riječima — ova jednadžba ih spaja u jedan multiplikativni razklad koji studentu odmah pokazuje da vrijednost za novac pada ako zakaže BILO KOJI od triju faktora (jeftin input + visok output ne jamči vrijednost ako output ne stvara ishod). Niska težina, izravno se nadovezuje na postojeću definiciju i može se ilustrirati grafički/numerički. Pedagoški povezuje NPM mjerila s CBA poglavljem (ch18).

**[5] Niskanenov birokrat koji maksimizira proračun (teorijski poticaj za NPM)**

```latex
$$
\max_{Q}\ Q \quad \text{uz}\quad B(Q) \ge C(Q)\\[4pt] B(Q_N) = C(Q_N) \ \Rightarrow\ Q_N > Q^{*},\ \text{gdje}\ B'(Q^{*}) = C'(Q^{*})
$$
```
*Zašto:* Poglavlje izričito navodi Niskanena kao teorijski temelj NPM-a, ali samo verbalno ('birokrati imaju poticaj povećavati proračun'). ISPRAVLJENO: birokrat maksimizira veličinu usluge/proračun (max Q), a ravnotežni Q_N određuje VEZUJUĆE proračunsko ograničenje na kojem se UKUPNA korist izjednačuje s UKUPNIM troškom B(Q_N)=C(Q_N) — a NE marginalni uvjet B'=C', koji vrijedi za društveni optimum Q*. Upravo iscrpljivanje cijelog viška kroz 'uzmi ili ostavi' ponudu daje Q_N>Q*. Optional jer je to primarno tema ch09 (Birokracija), koja VEĆ ima potpun formalni model (def-niskanenov-model, fig-niskanen s Qₙ=2Q*, te numerička vježba) s točnim uvjetom ukupna korist=ukupni trošak — ovdje stoga zadržati samo kratku cross-ref jednadžbu, bez dupliciranja.

**Gdje produbiti (izvodi / vježbe):** Tri prirodna mjesta za proširenje. (1) Worked derivation linearnog ugovora u sekciji 'Marketizacija': krenuti od certainty-equivalent korisnosti agenta CE = α + βe − ½ r β² σ² − C(e), izvesti optimalni napor C'(e)=β i potom β* = 1/(1+rσ²C''), čime se u jednom okviru dobiva i intuicija β∈[0,1] kao kontinuum od birokrata (β=0) do vlasnika (β=1). Idealno kao novi #prp-poticajni-ugovor s 4–5 redaka izvođenja. (2) Formalni analitički okvir uz Goodhartov zakon u sekciji 'Korporativno upravljanje': multitasking #prp- s dvije zadaće i komparativnom statikom ∂e₁*/∂β₂<0, koji matematički opravdava postojeću preporuku o višestrukosti mjera i 'low-powered' poticajima u javnom sektoru. (3) Numerička callout-vjezba koja nadograđuje POSTOJEĆU vježbu o listama čekanja: zadati agentu funkciju troška C(e)=½e², šum σ², averziju r, te tražiti da student izračuna β* za dvije vrijednosti σ² (pouzdana vs. bučna mjera) i pokaže da bučnija mjera daje slabiji optimalni poticaj — empirijski povezano s NHS primjerom iz callout-praksa. Alternativno, kratka callout-empirija mogla bi citirati dokaze o 'teaching to the test' i bolničkom upcodingu kao izmjerene manifestacije multitasking distorzije. NAPOMENA: kad je C(e)=½e², C''(e)=1, pa se β*=1/(1+rσ²) — uredan zatvoreni izraz idealan za numeričku vježbu.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

ADVERZARIJALNA PROVJERA (5 jednadžbi):

[1] Holmström linearni ugovor, β*=1/(1+rσ²C''(e)) — TOČNOST: OK. Kanonski LEN-rezultat (CARA korisnost, normalan šum, konveksan C). Predznaci ispravni: β* pada u r, σ² i C''. LaTeX valjan, renderira se. Granice β=1 (vlasnik) i β=0 (birokrat) korektno objašnjene. CITAT: holmstrom1979 = MISSING; holmstrommilgrom1987 = MISSING (u references.bib NEMA ni jednog Holmström unosa). RAZINA: 'core'/'medium' realno — formula je 'crna kutija' bez izvođenja, čitljiva studentu.

[2] Multitasking, ∂e₁*/∂β₂<0 kada C₁₂>0 — TOČNOST: OK. Iz agentove FOC ∂C/∂eⱼ=βⱼ slijedi ∂e/∂β=(Hessijan C)⁻¹; za 2×2 pozitivno definitan Hessijan off-diagonala inverza ima predznak −C₁₂/det, dakle ∂e₁*/∂β₂<0 kada C₁₂>0 (efforts supstituti u trošku). Predznak i uvjet točni, gloss 'supstituti u trošku napora (C₁₂>0)' ispravan. LaTeX valjan. CITAT: holmstrommilgrom1991 = MISSING. RAZINA: 'core'/'high' realno; ispravno preporučeno u prošireni okvir, ne u glavni tok (traži pojam križne derivacije troška).

[3] IR + IC uvjeti — TOČNOST: OK. Standardni hidden-action program: max E[y−w] uz (IR) E[u(w)]−C(e)≥ū i (IC) e∈argmax. Konvencionalno i točno; nema izvođenja koje bi se moglo pogriješiti. LaTeX valjan. CITAT: laffonttirole1993 = MISSING; laffontmartimort2002 = MISSING (nijedan Laffont/Tirole/Martimort unos ne postoji). RAZINA: 'strong'/'medium' realno.

[4] Vrijednost za novac, 3E razklad — TOČNOST: OK. Multiplikativni lanac telescopira ispravno: (1/c_in)·(Output/Input)·(Ishod/Output)=Ishod/(c_in·Input)=Ishod/Trošak uz konvenciju Trošak=c_in·Input (c_in=jedinična cijena inputa). Dimenzionalno konzistentno; oznaka 'ekonomičnost=1/c_in' branjiva konvencija 3E okvira. Računovodstveni identitet (ne bihevioralni model) — preporuka: u prozi naglasiti da je riječ o definicijskom razkladu. LaTeX valjan. CITAT: pollitt2017 = PRESENT (linija 1355). RAZINA: 'strong'/'low' realno.

[5] Niskanen — TOČNOST: ISPRAVLJENO (ovo je bila prava greška, tipa kakav je zadatak tražio uloviti). Prijedlog je naveo ravnotežni uvjet kao B'(Q_N)=C'(Q_N), što je MARGINALNI uvjet i vrijedi za DRUŠTVENI OPTIMUM Q*, a NE za Niskanenov ishod. Izvorni iskaz je k tome interno proturječan: ako vrijedi i B'(Q_N)=C'(Q_N) i B'(Q*)=C'(Q*), tada Q_N=Q*, što je u kontradikciji s Q_N>Q*. Točan Niskanenov uvjet je VEZUJUĆE proračunsko ograničenje, tj. UKUPNA korist = UKUPNI trošak: B(Q_N)=C(Q_N), odakle (uz konkavnu B iznad C do te točke) slijedi Q_N>Q*. Također ispravljen cilj maksimizacije iz 'max B(Q)' u 'max Q' (birokrat maksimizira veličinu/proračun, ne korist sponzora). Ispravljeni LaTeX: max_Q Q uz B(Q)≥C(Q); B(Q_N)=C(Q_N) ⟹ Q_N>Q*, gdje B'(Q*)=C'(Q*). POTVRDA: ch09-birokracija već ima potpun i TOČAN formalni model (def-niskanenov-model, fig-niskanen s Qₙ=2·Q*=ukupna korist=ukupni trošak, vježba 282) — pa je 'optional' tier i preporuka 'samo cross-ref, ne duplicirati' potpuno opravdana. CITAT: niskanen1971 = PRESENT (linija 595). RAZINA: 'optional'/'medium' realno.

SAŽETAK CITATA: 2 prisutna (pollitt2017, niskanen1971), 5 nedostaje (holmstrom1979, holmstrommilgrom1987, holmstrommilgrom1991, laffonttirole1993, laffontmartimort2002). Prije uvrštavanja prijedloga 1–3 OBAVEZNO dodati te unose u references.bib s TODO(coauthor) oznakom, u skladu s pravilom 'verify-citations-before-drafting'.

</details>

---

## 18-novo-upravljanje.qmd — Od novog javnog menadžmenta prema novom upravljanju (Novo / mrežno upravljanje)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu i nema #thm-/#prp- okruženja; sva četiri postojeća #def- okruženja (mrežno upravljanje, whole-of-government, mreže javnih politika, digitalna država) iskazana su isključivo verbalno, bez ijednog formalnog izraza.

**Jaz:** Nekoliko tvrdnji koje poglavlje već iznosi prozom imaju standardni, lagani formalni tretman u teoriji igara i institucionalnoj ekonomici, ali su ostavljene potpuno verbalno: (1) zašto suradnja uspijeva tek kad se interakcija ponavlja 'dovoljno dugo' (rečenica na kraju sekcije 'Mreže javnih politika' i u callout-vjezbi) jest doslovno uvjet iz teorije ponovljenih igara (δ-prag folk-teorema), ali nije iskazana; (2) sama struktura tvrdokornog koordinacijskog problema u kojem nijedan akter nema isključivu nadležnost jest koordinacijska/assurance igra s dvama ravnotežama (suradnja vs. nesuradnja) — kanonski 'lagani formalni dodatak' koji preporuka za temu izričito dopušta, a poglavlje ga opisuje samo riječima; (3) zašto rizik u JPP-u 'sklizne natrag na državu' (sekcija o partnerstvima) objašnjeno je narativno preko nepotpunih ugovora, ali se očekivani trošak države kod prešutnog jamstva može zapisati u jednoj liniji; (4) pristranost participacije ('ishod odražava preferencije onih koji sudjeluju, a ne medijanskog građanina') ima jednostavan zapis kao pristranost ponderiranog prosjeka preferencija. Mrežno upravljanje legitimno ostaje pretežno kvalitativno, pa matematiku treba držati minimalnom i intuitivnom; ne predlažem formalizaciju definicija mrežnog upravljanja, whole-of-governmenta ni digitalne države jer bi to bilo umjetno i zastrašujuće.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Koordinacijska (assurance) igra suradnje | Koordinacijska / assurance igra s dvjema Nash | core | low | [@osborne2004] | Tvrdokorni problemi i potreba za suradnjom (nakon  |
| 2 | Prag suradnje u ponovljenoj igri (zašto se interakcija mora ponavljati 'dovoljno dugo') | Folk-teorem / suradnja u ponovljenom zatvoren | strong | medium | [@ostrom1990] | Mreže javnih politika i partnerstva (uz rečenicu ' |
| 3 | Prešutno jamstvo i prijenos rizika u javno-privatnom partnerstvu | Nepotpuni ugovori i alokacija rezidualnog riz | strong | medium | [@williamson1985] | Mreže javnih politika i partnerstva (uz odlomak 'Z |
| 4 | Pristranost participacije (samoodabir sudionika) | Pristranost ponderiranog prosjeka preferencij | optional | low | [@sorensen2007] | Uključivanje građana (uz rečenicu 'ishod može odra |

**[1] Koordinacijska (assurance) igra suradnje**

```latex
$$
\begin{array}{c|cc} & S & N \\ \hline S & (a,\,a) & (d,\,c) \\ N & (c,\,d) & (b,\,b) \end{array} \qquad a > c,\quad b > d,\quad a > b
$$
```
*Zašto:* Ovo je upravo 'lagani formalni dodatak (koordinacijske igre)' koji kanonska preporuka za temu predviđa. Matrica 2x2 pokazuje da mreža ima DVIJE ravnoteže: zajedničku suradnju (S,S) koja je za sve bolja, i obostranu nesuradnju (N,N) u kojoj nitko ne ulaže prvi. Time se intuitivno i grafički objašnjava zašto je državi potrebna uloga koordinatora/jamca pravila (pomak s loše na dobru ravnotežu) koju poglavlje već naglašava — bez ijednog naprednog koncepta, samo usporedbom isplata.

**[2] Prag suradnje u ponovljenoj igri (zašto se interakcija mora ponavljati 'dovoljno dugo')**

```latex
$$
\frac{a}{1-\delta} \;\ge\; T + \frac{\delta\,b}{1-\delta} \quad\Longleftrightarrow\quad \delta \;\ge\; \frac{T-a}{T-b}, \qquad T > a > b
$$
```
*Zašto:* Poglavlje već tvrdi da mrežna prednost ovisi o tome ponavlja li se interakcija 'dovoljno dugo'; ovo tu rečenicu pretvara u precizan uvjet. δ (strpljenje / vjerojatnost nastavka odnosa) mora prijeći prag da bi dugoročna korist suradnje nadmašila jednokratni dobitak od oportunizma T. Izravno objašnjava zašto suradnja propada kod jednokratnih, anonimnih ili duboko podijeljenih aktera (mali δ) — što poglavlje navodi prozom. Notacija je umjerena i potpuno se naslanja na već citiranog Ostroma i na ch05a (teorija igara). NAPOMENA: izvorni LHS imao je pogrešnu vremensku usklađenost (nedostajao δ na kazni); ispravljeno na δ·b/(1−δ) i dodan poredak isplata T>a>b da prag δ bude u (0,1).

**[3] Prešutno jamstvo i prijenos rizika u javno-privatnom partnerstvu**

```latex
$$
\mathbb{E}[C_{\text{drzava}}] \;=\; p\,(L - R) \;+\; (1-p)\cdot 0, \qquad R < L
$$
```
*Zašto:* Formalizira ključnu tvrdnju odlomka da privatni partner zadržava dobit dok ide dobro, a država preuzima najteže gubitke. p je vjerojatnost loma usluge, L gubitak, R ugovorom prenesena (ograničena) odgovornost privatnog partnera; budući da država ne može dopustiti propast usluge, rezidual L−R pada na proračun. Jedna linija pokazuje da vrijednost JPP-a ne ovisi o tome tko je nositelj, nego o tome je li R postavljen tako da rizik snosi strana koja njime upravlja — što je upravo zaključak poglavlja. Niska do srednja notacijska zahtjevnost (očekivana vrijednost).

**[4] Pristranost participacije (samoodabir sudionika)**

```latex
$$
\bar{x}_{\text{sudionici}} \;=\; \frac{\sum_i \pi_i\, x_i}{\sum_i \pi_i} \;\neq\; \bar{x}_{\text{stanovnistvo}} \quad\text{kada}\ \operatorname{Cov}(\pi_i,\,x_i)\neq 0
$$
```
*Zašto:* Pretvara verbalnu tvrdnju o pristranosti participacije u jednu liniju: ako vjerojatnost sudjelovanja π_i korelira s preferencijom x_i (obrazovaniji, gradski, angažiraniji sudjeluju više), ponderirani prosjek sudionika sustavno odstupa od prosjeka stanovništva. Povezuje poglavlje s medijanskim glasačem iz ch07 i daje precizan kriterij (Cov ≠ 0) za to kada 'jednak pristup' ne znači 'jednaku zastupljenost'. Vrlo niska zahtjevnost; lako se ilustrira brojčano u vježbi. NAPOMENA: izvorni zapis usporedio je ponderirani prosjek s x_med (medijanom); kovarijantni identitet točno opisuje odstupanje od PROSJEKA stanovništva, pa je referenca promijenjena u x̄_stanovništvo. Veza s medijanskim građaninom vrijedi uz dodatnu pretpostavku simetrične razdiobe i tako se može spomenuti u prozi.

**Gdje produbiti (izvodi / vježbe):** Najprirodnije mjesto za proširenu izvedbu jest sekcija 'Mreže javnih politika i partnerstva'. Tamo se može umetnuti kratak ::: {#prp-} okvir koji spaja koordinacijsku igru (prijedlog 1) i δ-prag suradnje (prijedlog 2) u jedan zaokružen argument: tvrdokorni problem je koordinacijska igra s lošom i dobrom ravnotežom, a ponavljanje interakcije (visok δ) je ono što omogućuje izbor dobre ravnoteže i izgradnju povjerenja, dok državna uloga jamca pravila pomiče sustav prema njoj. To je 'worked' poveznica koja objašnjava zašto mreže rade ondje gdje hijerarhija i tržište zakažu, a već citira Ostroma i Osbornea (ch05a). Drugo, postojeća .callout-vjezba o riječnom slivu (tri općine) idealna je za laganu numeričku nadogradnju u zasebnoj .callout-vjezba: zadati konkretne isplate (npr. a=10, b=4, T=12, d=1 uz poredak T>a>b) i diskontni faktor δ, te tražiti od studenta da (i) prepozna obje ravnoteže u 2x2 matrici i (ii) izračuna prelazi li δ prag suradnje iz prijedloga 2 — čime se apstraktni uvjet veže uz već postavljeni scenarij bez uvođenja hrvatskih primjera. Pri tome treba paziti da brojčane vrijednosti zadovolje T>a>b kako bi prag δ=(T−a)/(T−b) ležao u (0,1); izvorno predloženi skup (a=10,b=4,c=12,d=1) zapravo postavlja c kao temptaciju, pa T u prijedlogu 2 treba poistovjetiti s tom devijacijskom isplatom (c) — tada δ=(12−10)/(12−4)=0,25. Treće, odlomak o JPP-u podnosi mini-zadatak s prijedlogom 3: za zadane p, L i dvije vrijednosti ugovorne odgovornosti R, izračunati očekivani trošak proračuna i pokazati kako prijenos rizika mijenja fiskalnu cijenu partnerstva. Sve ostalo (digitalna država, tri logike, whole-of-government) treba ostati kvalitativno.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

P1 (koordinacijska igra, [@osborne2004]): TOČNOST OK. Citat present (osborne2004, 'An Introduction to Game Theory', OUP 2004 — točan izvor za 2x2 igre). LaTeX array sintaksa valjana, renderira se bez greške. Provjereno ćelija po ćeliju uz konvenciju (red, stupac): (S,S)=(a,a) je NE jer devijant na N dobiva c<a → uvjet a>c točan; (N,N)=(b,b) je NE jer devijant na S dobiva d<b → uvjet b>d točan; a>b daje Pareto-dominaciju dobre ravnoteže. Tri nejednakosti su dostatne i međusobno konzistentne za tvrdnju o dvjema ravnotežama i payoff-dominaciji. Razina (core/low) realna za studente — matrica isplata je standardni alat. — P2 (δ-prag, [@ostrom1990]): ISPRAVLJENO. Citat present (ostrom1990, 'Governing the Commons' — primjeren za ponovljenu suradnju oko zajedničkih resursa). GREŠKA: izvorni LHS a/(1−δ) ≥ T + b/(1−δ) ispustio je diskontni faktor δ na kaznenom članu; pravilna vremenska usklađenost je T jednokratno SADA, pa kazna b od SLJEDEĆEG razdoblja → T + δb/(1−δ). Dokaz nedosljednosti izvornika: njegov LHS daje 1−δ ≤ (a−b)/T, što NIJE ekvivalentno desnoj strani δ ≥ (T−a)/(T−b); dakle dvije polovice izvornog prijedloga nisu algebarski ekvivalentne. Ispravljeni LHS (s δ) korektno vodi na δ ≥ (T−a)/(T−b) (množenjem s (1−δ): a ≥ T(1−δ)+δb → a−T ≥ δ(b−T) → δ ≥ (T−a)/(T−b) jer T>b). Desna strana (δ ≥ (T−a)/(T−b)) bila je TOČNA i zadržana. Dodan poredak isplata T>a>b da prag bude u (0,1) i da bude konzistentan s a>b iz P1. Razina (strong/medium) realna uz oslon na ch05a. — P3 (JPP rezidualni rizik, [@williamson1985]): TOČNOST OK. Citat present (williamson1985, 'Economic Institutions of Capitalism' — ispravan za nepotpune ugovore i alokaciju rezidualnog rizika; bib ima TODO o godini, ali ključ i sadržaj odgovaraju). E[C]=p(L−R)+(1−p)·0 uz R<L je korektna očekivana vrijednost; L−R>0 je rezidual koji pada na proračun. LaTeX \\mathbb{E} i \\text{} valjani. Stilizirana pretpostavka (trošak u stanju bez loma = 0, zanemaruje availability-payments) prikladna za ilustraciju i jasno navedena u rationale. Razina (strong/medium) realna. — P4 (pristranost participacije, [@sorensen2007]): ISPRAVLJENO (manja korekcija reference, ne algebre). Citat present (sorensen2007, editori Sørensen & Torfing, 'Theories of Democratic Network Governance' — primjeren za mrežnu demokraciju i pristranost participacije). Kovarijantni identitet E[πx]/E[π] = E[x] + Cov(π,x)/E[π] je TOČAN i znači da ponderirani prosjek sudionika odstupa od PROSJEKA stanovništva iff Cov(π,x)≠0. GREŠKA u izvorniku: usporedba je bila s x_med (medijanom), a kovarijantni uvjet strogo upravlja odstupanjem od prosjeka, ne medijana; referenca promijenjena u x̄_stanovništvo. Poistovjećenje s medijanskim građaninom vrijedi samo uz simetričnu razdiobu — to treba ostaviti za prozu/fusnotu, ne za samu jednadžbu. LaTeX valjan. Razina (optional/low) realna; lako numerički ilustrirati.

</details>

---

## 19-cba-evaluacija (Cost-benefit analiza i evaluacija javnih politika)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; sva theorem/def okruženja (#def-npv, #def-diskontna-stopa, #def-kontrafaktual, #def-rct) iskazana su isključivo verbalno, uz jedini inline izraz 1/(1+r)^t unutar definicije NPV-a.

**Jaz:** Niz kanonskih formula tema CBA opisan je riječima, no nikada zapisan kao jednadžba, iako studenti u callout-vjezbi (linije 293-299) moraju ručno računati NPV i IRR bez ijedne formule u tekstu. Konkretno: (1) Neto sadašnja vrijednost je definirana samo opisno (#def-npv, linija 47-49) i opisuje koeficijent 1/(1+r)^t, ali nikada ne piše punu sumu ΣB_t/(1+r)^t koju vježba traži da student izračuna. (2) Društvena diskontna stopa rastavljena je doslovno riječ-po-riječ na 'stopu čistog vremenskog preferiranja' i 'rast dohotka pomnožen brzinom kojom dodatni dohodak gubi na vrijednosti' (linija 63) — to je Ramseyjeva formula r=δ+ηg ispisana proznim opisom umjesto jednadžbom, što je idealan kandidat za formalizaciju. (3) Vrijednost statističkog života opisana je kao 'dodatak na plaću podijeljen rizikom' (linija 233) — to je egzaktno VSL = Δw/Δp, no nije zapisano. (4) Difference-in-differences opisan je verbalno kao 'promjena ishoda kod tretirane i netretirane skupine prije i poslije' (linija 281) — to je 2x2 DiD procjenitelj koji se trivijalno zapisuje. (5) Uzročni učinak / kontrafaktual (#def-kontrafaktual) opisuje razliku stvarnog i kontrafaktualnog ishoda bez Y(1)-Y(0) zapisa. (6) Omjer koristi i troška (BCR) i interna stopa povrata (IRR) spominju se (graf, vježba) bez definicijske jednadžbe. Poglavlje je inače dobro napisano i intuitivno; nedostaje mu most između proze i formule koji bi studentu omogućio da prati izračun.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Neto sadašnja vrijednost (NSV/NPV) | Diskontirani novčani tok, kanonska CBA formul | core | low | [@boardman2018] | Definicija #def-npv (linija 47-49), kao display je |
| 2 | Ramseyjevo pravilo društvene diskontne stope | Ramseyjeva jednadžba diskontiranja, r = δ + η | core | medium | [@hmtreasury2022] | Sekcija 'Posebnosti cost-benefit analize u javnom  |
| 3 | Vrijednost statističkog života (VSL) | Hedonički/kompenzacijska premija na plaću, VS | strong | low | [@boardman2018] | Sekcija 'Ograničenja cost-benefit analize', odloma |
| 4 | Procjenitelj razlike u razlikama (difference-in-differences) | DiD 2x2 procjenitelj (Angrist i Pischke) | core | medium | [@angrist2009] | Sekcija 'Vrste i metode evaluacije', odlomak o kva |
| 5 | Uzročni učinak i kontrafaktual (potencijalni ishodi) | Rubinov okvir potencijalnih ishoda / prosječn | strong | medium | [@angrist2009] | Definicija #def-kontrafaktual (linija 261-263), ka |
| 6 | Omjer koristi i troška i interna stopa povrata (BCR i IRR) | Kriteriji odlučivanja u CBA (Boardman et al.) | optional | low | [@boardman2018] | Sekcija 'Koraci u provedbi cost-benefit analize',  |

**[1] Neto sadašnja vrijednost (NSV/NPV)**

```latex
$$
\text{NSV} = \sum_{t=0}^{T} \frac{B_t - C_t}{(1+r)^t}
$$
```
*Zašto:* Nezaobilazna jednadžba cijelog poglavlja koju vježba na kraju (linije 293-299) traži da student izračuna, ali ju tekst nigdje ne ispisuje u punom obliku. Definicija opisuje samo koeficijent 1/(1+r)^t; puna suma B_t i C_t kroz razdoblja t=0..T daje studentu izravan recept za račun i poklapa se s OJS grafom NSV o diskontnoj stopi. Niska notacijska zahtjevnost, lako se objašnjava grafički.

**[2] Ramseyjevo pravilo društvene diskontne stope**

```latex
$$
r = \delta + \eta \, g
$$
```
*Zašto:* Odlomak na liniji 63 doslovno proznim riječima opisuje sva tri člana Ramseyjeve formule (δ kao čisto vremensko preferiranje, η·g kao rast dohotka pomnožen elastičnošću granične korisnosti) bez ijednog simbola. Formalizacija razdvaja vrijednosni član (δ) od mjerljivog (η·g) i čini eksplicitnim zašto se klimatske/mirovinske rasprave svode na jednu etičku pretpostavku. Green Book ju izričito propisuje, pa je citat siguran. Napomena: za potpunu atribuciju izvornom autoru poželjna je i referenca Ramsey 1928 (vidi MISSING niže).

**[3] Vrijednost statističkog života (VSL)**

```latex
$$
\text{VSL} = \frac{\Delta w}{\Delta p}
$$
```
*Zašto:* Linija 233 verbalno opisuje točno ovaj omjer — 'dodatak na plaću' (Δw) za 'godišnji rizik smrti od jedan prema deset tisuća' (Δp=1/10000) — pa je formalizacija prirodan korak koji omogućuje numerički primjer (npr. Δw=700€, Δp=0,0001 daje VSL=7 mil. €). Pokazuje studentu kako se 'cijena života' uopće dobiva i zašto je krhka, što potkrepljuje kritiku monetizacije koja slijedi. Vrlo niska notacija.

**[4] Procjenitelj razlike u razlikama (difference-in-differences)**

```latex
$$
\hat{\delta}_{DiD} = \big(\bar{Y}^{T}_{post} - \bar{Y}^{T}_{pre}\big) - \big(\bar{Y}^{C}_{post} - \bar{Y}^{C}_{pre}\big)
$$
```
*Zašto:* Linija 281 verbalno opisuje točno ovaj dvostruki diferencijal ('promjena ishoda kod tretirane i netretirane skupine prije i poslije'), a to je središnja kvazi-eksperimentalna metoda navedena u kanonskom popisu teme. Formula čini eksplicitnim zašto pretpostavka paralelnih trendova (drugi diferencijal kao kontrafakt) određuje vjerodostojnost — povezuje se izravno s #def-kontrafaktual. Notacija s indeksima T/C i pre/post zahtijeva kratku pripremu, ali je standardna i intuitivna na 2x2 tablici.

**[5] Uzročni učinak i kontrafaktual (potencijalni ishodi)**

```latex
$$
\tau = E\big[Y_i(1) - Y_i(0)\big]
$$
```
*Zašto:* Definicija (linija 261-263) verbalno iskazuje da je uzročni učinak 'razlika između stvarno opaženog ishoda i kontrafakta', što je doslovno Y_i(1)-Y_i(0). Jedna jednadžba uvodi notaciju potencijalnih ishoda koja objedinjuje cijelu sekciju o metodama (RCT, DiD, RDD svi procjenjuju isti τ različitom vjerodostojnošću) i objašnjava 'temeljni problem uzročne inferencije' — da se za istu jedinicu nikada ne opažaju oba ishoda. Pedagoški snažno jer daje zajednički jezik za hijerarhiju metoda.

**[6] Omjer koristi i troška i interna stopa povrata (BCR i IRR)**

```latex
$$
\text{BCR} = \frac{\sum_t B_t/(1+r)^t}{\sum_t C_t/(1+r)^t}, \qquad \text{IRR}: \sum_{t=0}^{T} \frac{B_t - C_t}{(1+\text{IRR})^t} = 0
$$
```
*Zašto:* IRR se spominje na grafu i u vježbi (zadatak c traži stopu pri kojoj je NSV=0 i njezin naziv), ali nigdje nije definiran jednadžbom; BCR je standardni drugi kriterij koji poglavlje ne navodi. Dodavanje povezuje tri kriterija (NSV, BCR, IRR) u koherentan okvir i izravno opskrbljuje studenta za zadatak c. Označen kao optional jer NSV jednadžba (prijedlog 1) nosi glavni teret; ovo je dopuna za potpunost, ne smije pretrpati definicijski blok.

**Gdje produbiti (izvodi / vježbe):** 1) Proširena izvedba uz callout-vjezbu (linije 293-299): postojeća vježba traži ručni izračun NSV-a pri 5% i 10% te IRR-a, ali tekst ne nudi formulu ni riješen primjer. Idealno je dodati worked derivation neposredno iza #def-npv. NAPOMENA RECENZENTA O BROJKAMA: provjeren je primjer iz vježbe (ulaganje 100 mil. €, neto korist 30 mil. €/god kroz 4 godine). Pri 5% NSV = -100 + 30·(1,05^-1+1,05^-2+1,05^-3+1,05^-4) = -100 + 30·3,5460 ≈ 6,38 mil. € (graf na liniji 182 navodi ≈ 6,4 mil. €, što je TOČNO). Pri 10% NSV = -100 + 30·3,1699 ≈ -4,90 mil. € (negativno, projekt neopravdan). IRR (NSV=0) je ≈ 7,7% (između 5% i 10%, bliže gornjoj granici), što potvrđuje predznak iz vježbe i graf. Worked derivation može koristiti baš te brojeve. 2) Formalni analitički okvir za diskontiranje: oko callout-empirija na liniji 65-67 može se dodati izvod faktora 1/(1+r)^50; PROVJERA: pri 1% to je 1/1,01^50 = 0,608 ≈ 60% (TOČNO), pri 6% je 1/1,06^50 = 0,054 ≈ 5% (TOČNO) — brojke u callout-u su konzistentne s formulom, pa je veza sigurna. 3) Nova callout-vjezba uz Ramseyjevo pravilo: δ=1,5%, η=1, g=2% daje r = 1,5% + 1·2% = 3,5% (TOČNO); rasprava o spuštanju δ na 0 (Sternova pretpostavka) povezuje formalni okvir s etičkom raspravom. 4) Numerički primjer VSL-a: Δw=700€, Δp=1/10.000 daje VSL = 700/0,0001 = 7 mil. € (TOČNO). 5) Mogući callout-vjezba na 2x2 DiD tablici: četiri prosjeka ishoda iz kojih student izračuna DiD procjenitelj i procijeni vjerodostojnost paralelnih trendova.

<details><summary>Provjera (adverzarijalni recenzent)</summary>

ZAKLJUČAK: svih 6 jednadžbi je matematički/ekonomski TOČNO, LaTeX sintaksa renderira se bez greške, nijedna ne treba ispravak. Detaljno po prijedlogu:

[1] NSV = Σ_{t=0..T} (B_t - C_t)/(1+r)^t — TOČNOST: OK. Predznak i struktura ispravni; suma kreće od t=0 pa je član za t=0 nediskontiran (divizor (1+r)^0=1), što reproducira početni izdatak -C_0 i poklapa se s OJS/R kodom u poglavlju (-cost na t=0 + diskontirani tokovi t=1..4). Provjereni brojevi vježbe daju NSV(5%)≈6,38 mil.€, što odgovara grafu (≈6,4 mil.€). LaTeX OK (\\text, \\sum, \\frac valjani). CITAT: boardman2018 — PRESENT (linija 219-226 references.bib). RAZINA: core/low realno za studente.

[2] r = δ + η·g — TOČNOST: OK. Standardno Ramseyjevo pravilo društvene diskontne stope (čisto vremensko preferiranje + elastičnost granične korisnosti × rast potrošnje); decompozicija je upravo ona koju Green Book propisuje. Brojčani test δ=1,5%+1·2%=3,5% konzistentan. LaTeX OK (\\delta, \\eta, tanki razmak \\, valjani). CITAT: hmtreasury2022 — PRESENT (linija 461-468). UPOZORENJE O ATRIBUCIJI: prijedlog ispravno označava 'Ramsey 1928' kao MISSING. VAŽNO: u references.bib POSTOJI ramsey1927 ('A Contribution to the Theory of Taxation', Economic Journal 1927), ALI to je Ramseyjev POREZNI rad, NE rad o štednji/rastu iz kojeg slijedi pravilo diskontiranja ('A Mathematical Theory of Saving', Economic Journal 38(152), 1928). Citiranje ramsey1927 za ovo pravilo bilo bi WRONG-KEY. Preporuka: zadržati hmtreasury2022 kao primarni citat; ako se želi atribucija izvorniku, dodati NOVI bib unos (MISSING: @article{ramsey1928, author={Ramsey, Frank P.}, title={A Mathematical Theory of Saving}, journal={Economic Journal}, year={1928}, volume={38}, number={152}, pages={543--559}, doi={10.2307/2224098}}). RAZINA: core/medium realno; legenda članova (δ, η, g) obavezna jer je notacija nova za studenta.

[3] VSL = Δw/Δp — TOČNOST: OK. Kompenzacijska premija na plaću podijeljena s prirastom rizika smrtnosti; brojčani test Δw=700€, Δp=0,0001 → 7 mil.€ TOČAN. LaTeX OK (\\Delta, \\frac valjani). CITAT: boardman2018 — PRESENT. RAZINA: strong/low realno; vrlo niska notacija, prirodan brojčani primjer.

[4] δ̂_DiD = (Ȳ^T_post − Ȳ^T_pre) − (Ȳ^C_post − Ȳ^C_pre) — TOČNOST: OK. Kanonski 2×2 DiD procjenitelj (drugi diferencijal kontrolne skupine kao kontrafakt promjene tretirane); redoslijed zagrada i predznaci ispravni. LaTeX OK (\\hat, \\bar, \\big, indeksi T/C i pre/post valjani). CITAT: angrist2009 — PRESENT (linija 1433-1439; nosi TODO(coauthor) provjeriti, ali ključ postoji u bib-u). RAZINA: core/medium realno; preporuka uz formulu priložiti 2×2 tablicu radi intuicije.

[5] τ = E[Y_i(1) − Y_i(0)] — TOČNOST: OK. Prosječni učinak tretmana u Rubinovu okviru potencijalnih ishoda; ispravno hvata 'temeljni problem uzročne inferencije'. LaTeX OK (E[...], \\big, indeks i, oznake (1)/(0) valjani). CITAT: angrist2009 — PRESENT. RAZINA: strong/medium realno; objedinjuje sekciju (RCT/DiD/RDD svi ciljaju isti τ).

[6] BCR = (Σ_t B_t/(1+r)^t)/(Σ_t C_t/(1+r)^t) ; IRR: Σ_{t=0..T} (B_t−C_t)/(1+IRR)^t = 0 — TOČNOST: OK. Oba kriterija ispravna; BCR kao omjer diskontiranih koristi i troškova, IRR kao stopa koja izjednačava NSV s nulom. Provjereni IRR za primjer vježbe ≈7,7% leži između 5% (NSV>0) i 10% (NSV<0), konzistentno. LaTeX OK (\\frac sa sumama u brojniku/nazivniku, \\qquad razmak, \\text{IRR} valjani). NAPOMENA: notacijska usklađenost — koristi isti (B_t−C_t)/(1+r)^t oblik kao prijedlog 1, pa preporučiti da se BCR i NSV zapišu istom konvencijom (B_t, C_t, r, t) radi koherentnosti. CITAT: boardman2018 — PRESENT. RAZINA: optional/low realno; ispravno označen optional da ne pretrpa definicijski blok.

OPĆE: nijedna jednadžba ne pati od grešaka tipa 'predznak/smjer/elastičnost' (usp. raniju knjišku grešku o udjelu predlagatelja). Svi citati osim flagirane Ramsey-atribucije su PRESENT. Jedina akcija prije unosa: razriješiti Ramsey 1928 (dodati novi bib unos ILI ostaviti samo hmtreasury2022 i NE citirati ramsey1927).

</details>

---

## 20-reforme (Reforme u javnom sektoru)

**Trenutno:** 0 display jednadžbi · formalni modeli: ne  
Poglavlje nema nijednu display jednadžbu; svih pet okruženja su #def- definicije iskazane isključivo verbalno (kompenzacijska shema, sekvenciranje, vanjsko sidro, šok-terapija/gradualizam, reformski zamor), a callout-vjezba sadrži numerički Fernández-Rodrik zadatak ali bez ijedne formalizirane jednadžbe očekivane vrijednosti u tekstu.

**Jaz:** Tri kanonska modela teme reformi već su citirana ali tretirana samo prozno. (1) Fernández-Rodrik status-quo pristranost — središnji mehanizam poglavlja ("racionalni birač preferira status quo... čak i kada bi mu očekivani ishod bio pozitivan") opisan je riječima, iako je riječ o jednostavnoj usporedbi očekivanih vrijednosti koju callout-vjezba već numerički provodi; nedostaje formalni uvjet glasanja za status quo i prag individualne vjerojatnosti dobitka. (2) Alesina-Drazen rat iscrpljivanja ("odgađanje je racionalno čekanje, a okončava ga onaj kome je daljnja kriza preskupa") nema formalizaciju ravnoteže — vrijeme popuštanja kao funkcija troška čekanja i raspodjele tereta. (3) Kompenzacijska shema (#def-kompenzacijska-shema) tvrdi da naknada "povećava izglede prolaza ne mijenjajući supstancu" ali bez nejednakosti koja pokazuje koliko velika naknada poništava status-quo pristranost. (4) J-krivulja reformi (privremeni pad pa oporavak outputa) uopće se ne spominje eksplicitno iako je standardni okvir tranzicijskih troškova i izravno povezuje "socijalne troškove" gradualizma vs. šok-terapije iz odjeljka o SIE. (5) Kaldor-Hicksov kriterij spominje se samo u vježbi (zadatak a) bez definicije u tekstu.

| # | Koncept | Model | Tier | Težina | Citat | Umetnuti u |
|---|---------|-------|------|--------|-------|------------|
| 1 | Status-quo pristranost pod individualno specifičnom neizvjesnošću (uvjet glasanja za reformu) | Fernández–Rodrik (1991), individual-specific  | core | low | [@fernandez1991] | Zašto su reforme javnog sektora nužne (uz odlomak  |
| 2 | Kompenzacijska shema kao smanjenje praga prolaza | Fernández–Rodrik (1991), kompenzacija gubitni | strong | medium | [@fernandez1991] | Definicija #def-kompenzacijska-shema (kao formalni |
| 3 | Rat iscrpljivanja i optimalno vrijeme popuštanja | Alesina–Drazen (1991), war of attrition / odg | strong | high | [@alesinadrazen1991] | Zašto su reforme javnog sektora nužne (odlomak o A |
| 4 | J-krivulja reformi (tranzicijski trošak prilagodbe) | J-curve tranzicije / Blanchard-Kremer-tip meh | optional | medium | ⚠ MISSING | Iskustvo srednje i istočne Europe (uz raspravu šok |
| 5 | Kaldor-Hicksov kriterij potencijalnog poboljšanja | Kaldor (1939) – Hicks (1939), kompenzacijski  | optional | low | ⚠ MISSING | callout-vjezba (zadatak a) ili odlomak o agregatno |

**[1] Status-quo pristranost pod individualno specifičnom neizvjesnošću (uvjet glasanja za reformu)**

```latex
$$
\mathbb{E}[u_i] = p_i\,g + (1-p_i)\,\ell \;>\; 0 \quad\Longleftrightarrow\quad p_i \;>\; \frac{-\ell}{g-\ell}=\frac{|\ell|}{g+|\ell|}
$$
```
*Zašto:* Ovo je formalna srž cijelog poglavlja i izravno pretače već prisutnu prozu ('preferira status quo iako je očekivani ishod pozitivan') u jedan prag. Pokazuje da reformu blokira individualna vjerojatnost dobitka p_i ispod kritičnog praga |ℓ|/(g+|ℓ|), a NE prosječni predznak. Notacija je minimalna (dobitak g>0, gubitak ℓ<0), grafički se trivijalno prikazuje na pravcu vjerojatnosti, i savršeno se slaže s brojevima u postojećoj callout-vjezbi (g=50, ℓ=−60 → prag p>0,545>0,5, pa birač glasa protiv), čime vježba dobiva svoju teorijsku jednadžbu.

**[2] Kompenzacijska shema kao smanjenje praga prolaza**

```latex
$$
\mathbb{E}[u_i] = p_i\,g + (1-p_i)\,(\ell + t) \;>\; 0 \quad\Longleftrightarrow\quad t \;>\; -\ell-\frac{p_i}{1-p_i}\,g
$$
```
*Zašto:* Formalizira ključnu tvrdnju definicije da naknada t isplaćena gubitnicima 'povećava izglede prolaza bez mijenjanja ekonomske supstance'. Jednadžba pokazuje minimalnu naknadu t koja prevrće glas pri zadanom p_i, čime se vidi da kompenzacija djeluje preko raspodjele rizika, a ne preko agregatnog viška. Izravno opravdava točku (c) postojeće vježbe (t=25) i daje studentu provjerljiv uvjet. Drži se iste notacije kao prethodna jednadžba, pa je inkrementalni teret nizak.

**[3] Rat iscrpljivanja i optimalno vrijeme popuštanja**

```latex
$$
c_i\,\mathrm{d}t = h_j(t)\,(\theta_i-\theta_j)\,K\,\mathrm{d}t \;\Longrightarrow\; h_j(t)=\frac{c_i}{(\theta_i-\theta_j)\,K},\qquad \frac{\partial T_i^{*}}{\partial c_i}<0,\quad \frac{\partial T_i^{*}}{\partial \theta_i}>0
$$
```
*Zašto:* Formalizira intuiciju da 'odgađanje je racionalno čekanje, a okončava ga onaj kome je daljnja kriza preskupa': u ravnoteži rata iscrpljivanja skupina s višim trenutnim troškom čekanja c_i popušta ranije (∂T*/∂c_i<0), a skupina koja bi pri popuštanju nosila veći udio tereta θ_i čeka dulje (∂T*/∂θ_i>0). Uvjet je indiferentnosti na margini popuštanja: trošak čekanja dt jednak je vjerojatnosti da protivnik popusti (hazard h_j) puta dobitak (θ_i−θ_j)K koji se time izbjegne. ISPRAVLJENO u odnosu na izvorni prijedlog: izvorni jednoagentni arg max [(1−e^{-rT})(−c_i)+e^{-rT}(b−θ_iK)] je monoton u T (f'(T)=−re^{-rT}[c_i+b−θ_iK], stalnog predznaka) pa NEMA unutarnji maksimum — arg max je rubni (T=0 ili ∞), a tražena komparativna statika ∂T*/∂θ_i iz njega nije definirana. Interior se u ratu iscrpljivanja dobiva tek iz uvjeta indiferentnosti gdje marginalnu korist čekanja daje hazard da PROTIVNIK popusti, što je ovdje i upisano.

**[4] J-krivulja reformi (tranzicijski trošak prilagodbe)**

```latex
$$
Y_t = Y_0\Big[1-\alpha\,e^{-\delta t}\big(1-e^{-\delta t}\big)\Big]+\gamma\big(1-e^{-\delta t}\big),\qquad \min_t Y_t < Y_0 < \lim_{t\to\infty} Y_t
$$
```
*Zašto:* J-krivulja je izričito navedena u zadatku kao jedan od tri kanonska modela teme, a poglavlje je uopće ne formalizira. Stilizirana jednadžba hvata bit: output najprije pada (član prijelazne dezorganizacije α) pa se oporavlja iznad polazišta (γ), uz minimum ispod Y_0. Povezuje 'manje socijalnih troškova' gradualizma (manji, plići pad) sa šok-terapijom (dublji pad, brži oporavak) iz postojeće proze i izravno se vizualizira. Optional jer zahtijeva novu referencu i jer je primarno ilustrativna, ne izvedena iz mikrotemelja u tekstu. NAPOMENA: nejednakost min Y_t<Y_0 vrijedi samo uz restrikciju parametara (α dovoljno velik u odnosu na γ); inače γ(1−e^{-δt}) može odmah nadvladati pad pa minimuma ispod Y_0 nema — pri umetanju navesti uvjet ili odabrati ilustrativne vrijednosti (npr. α=0,4, γ=0,1) koje daju vidljiv dip.

**[5] Kaldor-Hicksov kriterij potencijalnog poboljšanja**

```latex
$$
\sum_{i\in W} g_i \;>\; \sum_{j\in L} |\ell_j| \quad\Longleftrightarrow\quad \sum_i \Delta u_i > 0
$$
```
*Zašto:* Vježba već traži od studenta da 'potvrdi Kaldor-Hicksovo poboljšanje' (zadatak a), ali kriterij nigdje nije definiran ni zapisan. Jedna nejednakost (zbroj dobitaka dobitnika veći od zbroja gubitaka gubitnika) daje pojmu egzaktnu definiciju i povezuje ga s kompenzacijskom shemom — jer kompenzacija je upravo mehanizam koji potencijalno poboljšanje pretvara u stvarno. Vrlo niska notacijska cijena; jedini trošak je dodavanje reference.

**Gdje produbiti (izvodi / vježbe):** Najprirodnije mjesto za proširenu izvedbu jest odlomak o Fernández-Rodriku u odjeljku "Zašto su reforme nužne". Ondje bi se mogao umetnuti kratak formalni okvir (display jednadžba praga p_i > |ℓ|/(g+|ℓ|)) s izvedbom u dva-tri reda, čime postojeća callout-vjezba prestaje biti izolirani aritmetički zadatak i postaje primjena izvedenog praga (uz g=50, ℓ=−60 prag je 0,545, pa rizično-neutralan birač s p=0,5 glasa protiv — točno podudaranje s točkom b vježbe). Druga prilika je nova callout-vjezba uz Alesina-Drazen: numerički zadatak s dvije skupine različitih troškova čekanja c_1<c_2 u kojem student izračuna tko popušta prvi i kako pad praga (rast troška krize) skraćuje odgodu, čime se kvantificira "kriza dižući cijenu čekanja prekida pat-poziciju". Treća prilika je formalni analitički okvir uz J-krivulju u odjeljku o SIE: stilizirana putanja outputa Y_t s eksplicitnim minimumom, koja bi se mogla i grafički prikazati (postojeći OJS/PDF obrazac grafova) i tako vizualno suprotstaviti plići-ali-sporiji gradualistički put dubljem-ali-bržem šok-terapijskom putu — time se "socijalni troškovi" iz proze pretvaraju u mjerljivu površinu ispod Y_0. Kompenzacijsku jednadžbu (prijedlog 2) vrijedi spojiti s vježbom kroz minimalnu naknadu t* koja prevrće glas, pa student najprije izvede t*, a zatim provjeri da t=25 iz zadatka zadovoljava uvjet (t*>10 pri p=0,5, g=50, ℓ=−60).

<details><summary>Provjera (adverzarijalni recenzent)</summary>

P1 (Fernández-Rodrik prag): OK — algebra točna. E[u_i]=p_i g+(1−p_i)ℓ>0 ⇔ p_i(g−ℓ)>−ℓ ⇔ p_i>−ℓ/(g−ℓ)=|ℓ|/(g+|ℓ|) (jer ℓ<0). Numerika se slaže: g=50, ℓ=−60 → prag 60/110=0,545; p=0,5<0,545 → protiv, kao u vježbi. LaTeX renderira bez greške. Citat [@fernandez1991]: PRESENT (Fernandez & Rodrik, AER 1991, 81(5):1146–1155). Tier core / difficulty low realno za studente.

P2 (Kompenzacija t): OK — algebra točna. (1−p_i)t>−p_i g−(1−p_i)ℓ ⇒ t>−ℓ−[p_i/(1−p_i)]g. Provjera: p=0,5, g=50, ℓ=−60 → t>60−50=10; t=25>10 prolazi, E[u]=0,5·50+0,5(−60+25)=7,5>0. Slaže se s točkom (c) vježbe. LaTeX OK. Citat [@fernandez1991]: PRESENT. Tier strong / difficulty medium realno (jedan korak algebre više od P1).

P3 (Alesina-Drazen): ISPRAVLJENO. Smjerovi komparativne statike u izvornom prijedlogu su TOČNI i potvrđeni (∂T*/∂c_i<0 — viši trošak čekanja popušta ranije; ∂T*/∂θ_i>0 — veći teret pri popuštanju čeka dulje; hazard λ_i=c_i/v_j, war-of-attrition standard). ALI izvorni LaTeX, jednoagentni arg max_T [(1−e^{-rT})(−c_i)+e^{-rT}(b−θ_iK)], je MATEMATIČKI NEISPRAVAN kao izvor unutarnjeg T*: f'(T)=−re^{-rT}[c_i+b−θ_iK] ima stalan predznak za sve T, pa funkcija je monotona i arg max je rubni (T=0 ili ∞) — nema interior optimuma iz kojeg bi ∂T*/∂θ_i bila definirana. Zamijenjeno ispravnim uvjetom indiferentnosti rata iscrpljivanja (marginalni trošak čekanja c_i dt = hazard da protivnik popusti h_j puta dobitak izbjegavanja većeg tereta (θ_i−θ_j)K), koji stvarno daje interior i nosi obje tražene komparativne statike. Novi LaTeX renderira bez greške. Citat [@alesinadrazen1991]: PRESENT (Alesina & Drazen, AER 1991, 81(5):1170–1188). Tier strong / difficulty high realno — za studentsku publiku preporuka iz prijedloga (svesti na verbalnu komparativnu statiku) i dalje vrijedi; ako se zadrži jednadžba, mora ići ispravljena verzija, ne arg max.

P4 (J-krivulja): OK uz UPOZORENJE. LaTeX renderira; granični uvjeti točni — pri t=0 je Y_0 (x=1 poništava oba člana), pri t→∞ je Y_0+γ>Y_0. Oblik je ispravno J. Ali tvrdnja min_t Y_t<Y_0 NIJE bezuvjetna: vrijedi samo ako je α (dezorganizacijski pad) dovoljno velik u odnosu na γ (trajni dobitak); za mali α / veći γ rastući član odmah nadvladava pad i minimuma ispod Y_0 nema. Pri umetanju navesti restrikciju ili fiksne ilustrativne parametre (npr. α=0,4, δ=0,5, γ=0,1) koji daju vidljiv dip. Stilizirano, ne izvedeno iz mikrotemelja — prihvatljivo za optional ilustraciju. Citat: MISSING — ni 'blanchard&kremer', ni 'kremer', ni 'roland', ni 'kaldor'/'hicks' nisu u references.bib (postoje samo blanchard2013 i blanchard2017, koji NISU 'Disorganization' i ne pokrivaju ovaj sadržaj — ne koristiti kao zamjenu). Treba dodati Blanchard & Kremer (1997, QJE) ili Roland (2000) prije korištenja. Tier optional / difficulty medium realno.

P5 (Kaldor-Hicks): OK — identitet točan. ∑Δu_i=∑_{W}g_i+∑_{L}ℓ_j=∑_{W}g_i−∑_{L}|ℓ_j|, pa >0 ⇔ ∑g_i>∑|ℓ_j|. Numerika vježbe: 60·50=3000>40·60=2400, neto +600>0. LaTeX OK. Ovo je potencijalno-kompenzacijski (sum-of-money) oblik kriterija, primjeren udžbeniku. Citat: MISSING — 'kaldor' nije u references.bib; dodati Kaldor (1939, Economic Journal 49(195):549–552) (po želji i Hicks 1939). Tier optional / difficulty low realno.

ZBIRNI STATUS CITATA: PRESENT: fernandez1991, alesinadrazen1991. MISSING (treba dodati u references.bib prije korištenja): Kaldor (1939); Blanchard & Kremer (1997) ili Roland (2000). Nijedan wrong-key.

</details>

---

## Dodatak — nedostajući citati za `references.bib`

Po pravilu projekta (`verify-citations-before-drafting`, STYLE.md) dodati prije nacrta, uz `TODO(coauthor)`:

- **01-uloga-drzave** — Bergson-Samuelsonova funkcija društvenog blagostanja: MISSING: Bergson, A. (1938). A Reformulation of Certain Aspects of Welfare Economics. Quarterly Journal of Economics 52(2), 310-334, doi:10.2307/1881737 — predlažem ključ @bergson1938. Alternativno Samuelson (1947), Foundations of Economic Analysis. (NAPOMENA recenzenta: u references.bib NE postoji ni bergson1938 ni samuelson1947; postoji samuelson1954 — Pure Theory of Public Expenditure — što NIJE prava referenca za SWF. Treba dodati novi unos.)
- **02-alokacijska-funkcija** — Lindahlove cijene kao cjenovni dual Samuelsonova uvjeta: MISSING: @lindahl1919 — Lindahl, E. (1919/1958), 'Just Taxation: A Positive Solution', u Musgrave & Peacock (ur.), Classics in the Theory of Public Finance, Macmillan
- **02-alokacijska-funkcija** — Mrtvi teret monopola i Lernerov indeks tržišne moći: MISSING: @lerner1934 — Lerner, A. P. (1934), 'The Concept of Monopoly and the Measurement of Monopoly Power', Review of Economic Studies 1(3), 157–175. Za DWL dio može se citirati already-present [@harberger1954].
- **03-distribucijska-funkcija** — Funkcije društvenog blagostanja kao kontinuum (utilitarizam ↔ Rawls): MISSING: Atkinson, A. B. (1970). On the Measurement of Inequality. Journal of Economic Theory, 2(3), 244–263. — predlažem novi ključ atkinson1970
- **03-distribucijska-funkcija** — Atkinsonov indeks nejednakosti i ekvivalentni jednako-raspodijeljeni dohodak: MISSING: Atkinson, A. B. (1970). On the Measurement of Inequality. JET 2(3), 244–263. — isti predloženi ključ atkinson1970
- **03-distribucijska-funkcija** — Theilov indeks (entropijska mjera i dekompozicija): MISSING: Theil, H. (1967). Economics and Information Theory. North-Holland. — predlažem ključ theil1967
- **06-kolektivni-izbor** — Mayev teorem o prostoj vecini: MISSING: @may1952 — May, K. O. (1952). A Set of Independent Necessary and Sufficient Conditions for Simple Majority Decision. Econometrica 20(4), 680-684. doi:10.2307/1907651
- **07-stranke-izbori** — Probabilistički model glasanja i vaganje biračkih skupina: MISSING: dodati u references.bib — Lindbeck, A. & Weibull, J. (1987), "Balanced-budget redistribution as the outcome of political competition", Public Choice 52(3), 273–297 (ključ npr. lindbeck1987); Persson, T. & Tabellini, G. (2000), Political Economics: Explaining Economic Policy, MIT Press (ključ npr. persson2000)
- **07-stranke-izbori** — Citizen-candidate i nesavršena konvergencija: MISSING: dodati u references.bib — Osborne, M. J. & Slivinski, A. (1996), "A model of political competition with citizen-candidates", QJE 111(1), 65–96 (NAPOMENA: postojeći ključ @osborne2004 je DRUGO djelo — Osborne, An Introduction to Game Theory — NE koristiti ga za citizen-candidate; uvesti novi ključ npr. osborne1996); Besley, T. & Coate, A. (1997), "An economic model of representative democracy", QJE 112(1), 85–114 (ključ npr. besley1997)
- **09-birokracija** — Diskrecijski proračun i korisna funkcija birokrata: MISSING: @miguebelanger1974 — Migué, Jean-Luc i Bélanger, Gérard (1974), 'Toward a General Theory of Managerial Discretion', Public Choice 17(1), 27–47, doi:10.1007/BF01718995
- **09-birokracija** — Princip–agent ugovor s asimetrijom informacija: MISSING: @laffontmartimort2002 — Laffont, Jean-Jacques i Martimort, David (2002), 'The Theory of Incentives: The Principal-Agent Model', Princeton University Press
- **10-institucionalna-ekonomika** — Optimalni ugovor s poticajima (linearni princip kompenzacije): MISSING: Holmström, B. (1979), "Moral Hazard and Observability", Bell Journal of Economics 10(1), 74–91 — predlažem dodati @holmstrom1979. NAPOMENA RECENZENTA: zatvorena formula b* = 1/(1+rσ²/m) je rezultat Holmström-Milgrom (1987), "Aggregation and Linearity in the Provision of Intertemporal Incentives", Econometrica 55(2), 303–328 — ako se citira formula b*, ispravnije je dodati @holmstromMilgrom1987; ako se zadrži samo @holmstrom1979, on je izvor ideje ali ne i linearne formule.
- **12-instrumenti** — Cijene ili količine pod neizvjesnošću (Weitzmanovo pravilo): MISSING: @article{weitzman1974, author={Weitzman, Martin L.}, title={Prices vs. Quantities}, journal={Review of Economic Studies}, year={1974}, volume={41}, number={4}, pages={477--491}, doi={10.2307/2296698}}
- **13-javna-potrosnja** — Potražnja medijanskog glasača za javnim dobrom: MISSING: Borcherding, T. E. & Deacon, R. T. (1972), 'The Demand for the Services of Non-Federal Governments', American Economic Review 62(5), 891-901; alt. Bergstrom, T. C. & Goodman, R. P. (1973), 'Private Demands for Public Goods', AER 63(3), 280-296
- **13-javna-potrosnja** — Flypaper efekt: MISSING: Hines, J. R. & Thaler, R. H. (1995), 'The Flypaper Effect', Journal of Economic Perspectives 9(4), 217-226
- **14-porezi** — Diamond-Mirrleesov teorem proizvodne efikasnosti: MISSING: Diamond, P. A. i Mirrlees, J. A. (1971). Optimal Taxation and Public Production I-II. American Economic Review 61(1,3). predloženi ključ: diamond1971
- **15-eu-javne-financije** — Tieboutov mehanizam 'glasanja nogama': MISSING: Tiebout, Charles M. (1956). A Pure Theory of Local Expenditures. Journal of Political Economy 64(5), 416–424. doi:10.1086/257839
- **16-drzavni-neuspjesi** — Indeks otpornosti politike (formalizacija testa državnog neuspjeha): MISSING: nije potreban citat — ovo je interna operacionalizacija autorskog testa; eventualno [@wolf1979] kao konceptualno uporište
- **17-novi-javni-menadzment** — Optimalni linearni poticajni ugovor (princip-agent s rizikom): MISSING: @holmstrom1979 (Holmström, B. (1979). Moral Hazard and Observability. Bell Journal of Economics, 10(1), 74–91) i @holmstrommilgrom1987 (Holmström, B. & Milgrom, P. (1987). Aggregation and Linearity in the Provision of Intertemporal Incentives. Econometrica, 55(2), 303–328)
- **17-novi-javni-menadzment** — Multitasking i izvrtanje napora prema mjerljivom (formalni temelj Goodhartova zakona): MISSING: @holmstrommilgrom1991 (Holmström, B. & Milgrom, P. (1991). Multitask Principal-Agent Analyses: Incentive Contracts, Asset Ownership, and Job Design. Journal of Law, Economics, & Organization, 7, 24–52)
- **17-novi-javni-menadzment** — Participation i incentive-compatibility uvjet (zašto poticaj uopće mora postojati): MISSING: @laffonttirole1993 (Laffont, J.-J. & Tirole, J. (1993). A Theory of Incentives in Procurement and Regulation. MIT Press) ili @laffontmartimort2002 (Laffont, J.-J. & Martimort, D. (2002). The Theory of Incentives: The Principal-Agent Model. Princeton University Press)
- **20-reforme** — J-krivulja reformi (tranzicijski trošak prilagodbe): MISSING: Blanchard & Kremer (1997), 'Disorganization', Quarterly Journal of Economics 112(4):1091–1126 — ili Roland (2000), 'Transition and Economics'
- **20-reforme** — Kaldor-Hicksov kriterij potencijalnog poboljšanja: MISSING: Kaldor (1939), 'Welfare Propositions of Economics and Interpersonal Comparisons of Utility', Economic Journal 49(195):549–552
