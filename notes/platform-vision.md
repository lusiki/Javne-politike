# Platforma "Javne politike" — vizionarski konceptualni pregled

*Strateški memo za autore. Svibanj 2026.*

---

## Gdje smo danas, naprama čemu

Trenutna platforma je **kvalitetan akademski Quarto-udžbenik s nadgradnjom**: 20 poglavlja u 5 dijelova, popraćena s tri stranice (Vodič — još u izradi; Resursi — kuratorirani indeks od 200+ vanjskih izvora; Alat — stub) i jednim pravim interaktivnim proizvodom (DJP-Atlas: dashboard usporedbi fiskalnih pokazatelja s Eurostat podacima). U poglavljima ima nešto OJS-slidera (javna dobra, porezi), tri pedagoška callouta (praksa, empirija, vježba), Hypothesis anotacije i sidebar pretraživanje. PDF se izdaje, EPUB i audio ne postoje.

To je čvrsta osnova. Ali ako pitanje glasi *"što danas znači biti avangardna digitalna publikacija?"*, vrijedi pogledati sedam živih benchmarka:

- **Our World in Data** — svaka tvrdnja ima vlastitu vizualizaciju i preuzimljiv dataset; tekst je *tanji* od grafova.
- **Distill.pub** — esej kao interaktivni objekt; čitatelj manipulira modelima koje tekst opisuje.
- **Bartosz Ciechanowski** — kompleksni koncepti (mehanika satova, GPS) preko in-line animacija kojima čitatelj može mijenjati parametre; tekst je tu da animaciji da kontekst, ne obrnuto.
- **Brookings Tax Policy Center** — kalkulatori s vlastitim podacima koje novinari i policymakeri citiraju.
- **Stratechery / Astral Codex Ten** — autorski glas + komentarna zajednica koja često bude inteligentnija od posta.
- **MIT OpenCourseWare / Khan Academy** — kompletno-otvoreno učenje s problem setovima i automatskom provjerom.
- **Pew Research Center** — istraživanje + interaktivne vizualizacije + javno dostupni mikropodaci, sve u jednom ciklusu objavljivanja.

Naša platforma već dotiče dva od ovih (OWID tip kroz Atlas, donekle Brookings tip kroz Resurse), ali u svakoj kategoriji ima prostor za pomak. Sljedeća lista mapira *kamo* — 24 stavke, raspoređene u sedam kategorija, svaka s ocjenama **impact (1–5)** i **effort (1–5)**.

Skala:
- Impact: 1 = kozmetika; 3 = primjetno mijenja doživljaj; 5 = mijenja narav platforme.
- Effort: 1 = vikend rada; 3 = mjesec dana posvećenosti; 5 = veliki projekt s vanjskim resursima.

---

## 1. Interaktivnost i objašnjavanje

### 1.1 Explorable explanations po cijeloj knjizi
**Što je:** Svako poglavlje dobiva barem jedan "Bret Victor-style" eksperiment — model s parametrima koje čitatelj vrti, gdje tekst opisuje *što se događa kad povučeš X*. Primjeri: Lafferova krivulja gdje vrtnja porezne stope mijenja prihod; medijanski glasač s pomicanjem distribucije birača; tax incidence s elastičnostima ponude i potražnje.
**Zašto cutting edge:** Ciechanowski i Distill su ovo pretvorili u standard ozbiljnih digitalnih eseja; akademski udžbenici zaostaju jer rade na PDF-u.
**Impact:** 5 — fundamentalno mijenja što znači "čitati" ovu knjigu.
**Effort:** 5 — 20-ak custom OJS modula, dizajn-rad, testiranje na različitim uređajima.

### 1.2 Hover-na-pojam glosar
**Što je:** Termini definirani u jednom poglavlju (npr. "transakcijski troškovi") postaju hoverable kroz cijelu knjigu; kratka definicija + link na izvorno mjesto.
**Zašto cutting edge:** Tufte sidenotes su standard u Distillu i Gwern-style esejima; nitko to još ne radi sustavno u udzbenicima na hrvatskom.
**Impact:** 4 — masivno snizuje barijeru ulaska za laike i studente koji su preskočili poglavlje.
**Effort:** 3 — treba glosar-kao-podatak (YAML/JSON), JS injekcija u render pipeline.

### 1.3 Animirane krivulje umjesto statičnih grafova
**Što je:** Klasične ekonomske krivulje (D, S, Phillips, Lorenz, Laffer) postaju animacije s play/pause kontrolama; čitatelj vidi *kako* se krivulja pomiče pod stvarnim šokom umjesto da gleda dvije statične slike.
**Zašto cutting edge:** OWID je ovo pretvorio u svoju distinkciju.
**Impact:** 4
**Effort:** 3 — postojeća OJS infrastruktura podržava, treba dizajnerska disciplina.

### 1.4 Interaktivni dijagram Musgraveovog okvira
**Što je:** Centralni vizualni objekt koji se proteže kroz cijelu knjigu — tri Musgraveove funkcije (alokacija, distribucija, stabilizacija) kao klikabilan dijagram koji uvijek pokazuje "gdje smo sad u knjizi" i kako se trenutno poglavlje veže na cijeli okvir.
**Zašto cutting edge:** Wait-but-why dijagrami koji se vraćaju kroz dugu seriju eseja; pomažu čitatelju zadržati strukturu.
**Impact:** 3
**Effort:** 2 — jedna kvalitetna SVG komponenta + state management.

---

## 2. AI i personalizacija

### 2.1 Chat-with-the-book (RAG)
**Što je:** Sidebar widget — pitaj knjigu pitanje, dobi odgovor s citiranjem konkretnih poglavlja i pasusa. Pod haubom: embedanje cijelog korpusa, RAG nad Claude/GPT, granica striktno na sadržaj knjige.
**Zašto cutting edge:** Trenutni standard za 2025/2026 — Notion, Mintlify, Stripe docs svi to imaju. Akademski udzbenici tek hvataju.
**Impact:** 5 — radikalno mijenja što znači "konzultirati knjigu"; nadomještava potrebu da znaš strukturu da bi je koristio.
**Effort:** 4 — treba embed pipeline, hosting (Cloudflare Workers + Vector DB), API ključeve, prompt inženjering da ostane na temi.

### 2.2 Personalizirani sažeci po pretpostavljenom znanju
**Što je:** Na vrhu poglavlja: "kako želiš da ti ovo objasnim?" — birač s opcijama (laik / student ekonomije / čitatelj koji se već susreo s mikroekonomijom). Klikom se mijenja in-line objašnjenja, primjeri, dubina formula.
**Zašto cutting edge:** Eksperimentalno; nitko u akademiji to ne radi dobro. Khan Academy se kreće u smjeru, ali na razini cijelih lekcija.
**Impact:** 4
**Effort:** 5 — traži paralelne verzije sadržaja, ili vrlo dobar LLM rewrite koji ne gubi preciznost.

### 2.3 Automatska pitanja za samoprovjeru
**Što je:** Na dnu svakog poglavlja: AI-generirana pitanja s automatskom evaluacijom odgovora čitatelja (otvorena pitanja, ne MCQ). Daje povratnu informaciju tipa "nisi spomenuo da..."
**Zašto cutting edge:** Spaja LLM evaluaciju i pedagoški scaffolding; pojavljuje se u alpha verzijama Anthropic-ovog Claude.ai za obrazovanje.
**Impact:** 4
**Effort:** 3 — relativno jednostavna integracija ako je već postavljen RAG.

### 2.4 AI vodič za prvu knjigu
**Što je:** Posebna ulazna točka za nekoga tko prvi put otvara knjigu — kratka konverzacijska anketa ("što te dovelo ovamo?", "što već znaš?") koja preporuča putanju kroz knjigu. Ne zamijenjuje sadržaj, dirigira čitanje.
**Zašto cutting edge:** Onboardingi-as-conversation polako postaju norma za kompleksne digitalne proizvode.
**Impact:** 3
**Effort:** 2 — relativno jeftino ako postoji LLM backend.

---

## 3. Podaci kao first-class artefakti

### 3.1 Svaki broj u knjizi je link na dataset
**Što je:** Sustavna disciplina — kad u tekstu stoji "javna potrošnja u Hrvatskoj 2024. iznosila je X% BDP-a", broj je hiperlink na CSV/JSON s izvorom, metodologijom i grafom.
**Zašto cutting edge:** OWID je ovo pretvorio u brand. Pew također. Akademski udzbenici to nikad ne rade.
**Impact:** 5 — od pasivnog teksta prema "živom dokumentu"; podiže vjerodostojnost na nivo časopisa, ne udzbenika.
**Effort:** 4 — traži sistematsku reviziju cijele knjige i datastore za sve brojeve.

### 3.2 Atlas se otvara prema "embed this chart"
**Što je:** Svaki Atlas graf dobiva "Embed" gumb koji generira iframe-snippet ili sliku-link za korištenje u medijima/blogovima. S atribucijom natrag na Atlas.
**Zašto cutting edge:** OWID, Datawrapper, Flourish — to je razlog zašto se njihovi grafovi pojavljuju u svim novinama. Mreža backlink-ova.
**Impact:** 4 — pretvara Atlas u izvor citata, distribuira platformu organski.
**Effort:** 2 — tehnički nije teško; treba urediti dizajn embeda i terms of use.

### 3.3 DOI za svaku verziju Atlas dataseta
**Što je:** Atlas dataseti dobivaju verzionirane DOI-jeve (npr. preko Zenoda); citate-this-dataset widget; "kako citirati" upute.
**Zašto cutting edge:** Standardno u prirodnim znanostima, gotovo nepostojeće u hrvatskoj društvenoj znanosti.
**Impact:** 3 — postavlja platformu kao citirajući izvor; podiže akademsku vjerodostojnost.
**Effort:** 2 — Zenodo + GitHub release workflow.

### 3.4 Reproducible R notebook po poglavlju
**Što je:** Svako empirijsko poglavlje ima dugme "otvori u RStudio Cloud / Binder" koji učita exact R notebook s podacima i kodom kojim su grafovi i tablice generirani.
**Zašto cutting edge:** Distill, R Markdown ekosustav, Quarto manuscripts; standard za vrhunsku reproducibilnu znanost.
**Impact:** 4 — pretvara studente i istraživače u aktivne korisnike, ne pasivne čitatelje.
**Effort:** 3 — kod je već u Quartu, treba ga osloboditi i hostirati.

---

## 4. Pedagoški scaffolding 2.0

### 4.1 Vježbe s automatskom provjerom
**Što je:** Postojeći `callout-vjezba` blokovi dobivaju funkcionalnu formu — interaktivno polje (numerički unos, kratki tekst), evaluacija odgovora (deterministička za brojeve, LLM-evaluacija za tekst), neposredna povratna informacija.
**Zašto cutting edge:** Khan Academy, Brilliant.org, MIT OCW — sve nudi to. Hrvatski udzbenici nikad.
**Impact:** 5 — pretvara udzbenik u aktivno učenje, što je razlog što ga onda profesori usvajaju.
**Effort:** 4 — treba tipologija vježbi, render-time UI komponente, validation engine.

### 4.2 Čitateljske putanje (tracks)
**Što je:** Na samom početku — birač "tko si ti?" s opcijama (student ekonomije / student političkih znanosti / nastavnik / novinar / građanin) koji preporuča redoslijed čitanja i skriva/ističe poglavlja. Putanje su unaprijed definirane od autora.
**Zašto cutting edge:** Stripe docs, Linear docs, mnoge SaaS dokumentacije rade to. Akademski tekstovi gotovo nikad.
**Impact:** 4 — knjiga prestaje biti monolitna, postaje multi-pristup.
**Effort:** 3 — više kuratorski rad nego inženjerski, ali dizajn UI-ja je netrivijalan.

### 4.3 Spaced-repetition kartice za pojmove
**Što je:** Svaki pojam iz glosara dobiva flashcard. Studenti mogu otvoriti "deck" za poglavlje ili cijelu knjigu, izvoziti u Anki, ili učiti in-browser.
**Zašto cutting edge:** Brilliant, Quizlet, Anki ekosustav; učenje umjesto čitanja.
**Impact:** 3
**Effort:** 2 — derivat 1.2 (hover-glosar); ako postoji glosar-kao-podatak, ovo je sljedeći korak.

### 4.4 Glosar koji se sam puni iz callout-praksa
**Što je:** Konvencija — sve definicije u `callout-praksa` automatski indeksirane u centralni glosar. Mijenja pisanje: autori više ne moraju duplicirati pojmove u dva izvora.
**Zašto cutting edge:** "Single source of truth" filozofija dokumentacije; standardno u modernim tech docs.
**Impact:** 3 — operativno, ne efektno, ali oslobađa autorski rad.
**Effort:** 2 — Lua filter ili Pandoc plugin u render pipelineu.

---

## 5. Zajednica i participacija

### 5.1 Autorski blog: "iz radionice udzbenika"
**Što je:** Posebna sekcija (poseban Quarto blog) gdje autori objavljuju kraće tekstove — komentar na aktualnu politiku, ažuriranje brojeva, "zašto smo promijenili ovu interpretaciju", itd. Hrani knjigu, knjiga hrani blog.
**Zašto cutting edge:** Stratechery, Astral Codex Ten, Marginal Revolution — autorski glas + ažurnost čine platformu živom. Hrvatska nema akademski ekvivalent.
**Impact:** 4 — platforma više ne živi od jednog "izdanja"; postaje stalna prisutnost.
**Effort:** 3 — manje tehnički, više obavezujući za autore (kontinuirano pisanje).

### 5.2 Newsletter
**Što je:** Mjesečni newsletter — što je novo u svijetu javnih politika, novi dataset u Atlasu, novi blog post, "pitanje mjeseca". Distribucija preko ButtonDown/Substack/Buttondown ili Hrvatske SES alternative.
**Zašto cutting edge:** Stratechery dokazao model; OWID, Brookings to koriste sustavno.
**Impact:** 4 — direktan kanal prema čitatelju, ne preko algoritma.
**Effort:** 2 — tehnički jednostavno; effort je u redovitosti.

### 5.3 Pull-request platforma za vanjske briefove
**Što je:** Definirana procedura kako *drugi* akademici mogu predložiti "policy brief" koji se objavljuje pod platformom (s atribucijom). De facto malo otvoreno izdavaštvo, knjiga je urednički okvir.
**Zašto cutting edge:** Distill je radio s vanjskim doprinositeljima; OpenReview u ML zajednici. U društvenim znanostima rijetko.
**Impact:** 4 — pretvara platformu iz "naša knjiga" u "naš čvor u zajednici"; mreža autora.
**Effort:** 4 — traži uredničku discipline, peer-review proceduru, jasnu attribuciju.

### 5.4 Citiraj-nas widget
**Što je:** Na svakoj stranici, "Cite this" gumb koji generira BibTeX / RIS / APA / Chicago citatu te konkretne stranice (s datumom verzije). Akademska higijena.
**Zašto cutting edge:** Standardno u vrhunskim časopisima i preprint serverima; akademski blogovi i udzbenici tek hvataju.
**Impact:** 3 — niska barijera, povećava broj citata.
**Effort:** 1 — Quarto plugin ili nekoliko redaka YAML/JS-a.

---

## 6. Distribucija i format

### 6.1 EPUB s istom interaktivnošću koliko je moguće
**Što je:** Drugi format (uz HTML i PDF) — EPUB za e-čitače, s grafovima kao SVG/PNG umjesto interaktivnih. Bolje od PDF-a za mobilno čitanje.
**Zašto cutting edge:** Manje cutting edge, više hygiene — EPUB očekivanje za suvremenu knjigu.
**Impact:** 2
**Effort:** 1 — Quarto ima EPUB profile.

### 6.2 Audio verzija
**Što je:** TTS-generirana audio verzija svakog poglavlja s human-curated izgovorom imena i tehničkih termina. Distribucija kao podcast feed.
**Zašto cutting edge:** Astral Codex Ten ima profesionalnu audio verziju koju mnogi koriste umjesto čitanja. ElevenLabs i sl. su učinili TTS dovoljno dobrim.
**Impact:** 4 — otvara čitanje na cestama, šetnjama, vježbi.
**Effort:** 3 — TTS pipeline, urednički sloj za tehničke termine.

### 6.3 Slajdovi po poglavlju za nastavnike
**Što je:** Svako poglavlje dolazi s preuzimljivim slide-deckom (Reveal.js u Quartu + PowerPoint export) koji nastavnik može koristiti za predavanje, s atribucijom natrag na knjigu.
**Zašto cutting edge:** Mankiw, Krugman, Acemoglu — svi udzbenici imaju instructor materials. Adoptionski driver.
**Impact:** 5 — direktan put do toga da kolegij usvoji knjigu kao udzbenik.
**Effort:** 4 — traži ne samo generaciju, nego kvalitetan dizajn za svako poglavlje.

### 6.4 Social share cards s ključnim tezama
**Što je:** Svaka stranica generira open-graph sliku s ključnom tezom poglavlja ili konkretnog odlomka. "Tweetable" momenti dobivaju vlastiti gumb za dijeljenje.
**Zašto cutting edge:** Standard u modernoj web-tipografiji; Linear, Notion, sve velike platforme imaju.
**Impact:** 3 — pomaže distribuciji kroz društvene mreže.
**Effort:** 2 — automatizacija preko OG image generatora.

---

## 7. Otkrivanje i navigacija

### 7.1 Pojmovnik s hover-definicijama
**Što je:** Centralna stranica `pojmovnik.qmd` + svaki pojam u tekstu hoverable. Konceptualno blisko 1.2 i 4.4; ovo je usisni izlazni point.
**Zašto cutting edge:** Tufte sidenotes pattern; Gwern.
**Impact:** 4
**Effort:** 2 — ako su 1.2 i 4.4 napravljeni, ovo je samo render.

### 7.2 Citation graph: koji teorem koristi koji
**Što je:** Vizualni graf međuovisnosti teorema/koncepata u knjizi. Klikneš teorem, vidiš što ga koristi i što on koristi.
**Zašto cutting edge:** Bret Victor *Up and Down the Ladder of Abstraction*; *The Periodic Table of Software* — vizualizacija konceptualne strukture.
**Impact:** 3 — više za studente koji žele "mapu znanja"; možda i marketinški.
**Effort:** 3 — traži ručno markiranje veza ili automatsko nakon dobre konvencije.

### 7.3 Reverse-index "gdje se ovaj koncept pojavljuje"
**Što je:** Tradicionalni index iz back-of-book postaje interaktivan — kliknem pojam i vidim listu mjesta gdje se javlja, s preview snippeta.
**Zašto cutting edge:** Ne baš avangardno, ali iznenađujuće rijetko u digitalnim udzbenicima.
**Impact:** 3
**Effort:** 2 — derivat 7.1.

### 7.4 "Related chapters" preporuke
**Što je:** Na dnu svakog poglavlja: "Sljedeće za čitati: ovisno o tome je li te zanimao X ili Y, idi na poglavlje Z." Ručno kuratiran, ne ML.
**Zašto cutting edge:** Wikipedia "See also", Stripe docs, Notion — preporuka kao kuratorski rad, ne algoritamska.
**Impact:** 3
**Effort:** 1 — autorski rad, jednostavna YAML konvencija.

---

## Zaključak: ako bismo birali samo tri stvari

Ova lista ima 24 prijedloga. Većina se međusobno kombinira (glosar hrani spaced-repetition; RAG hrani vježbe; data-as-artifact hrani embed). Ali ako se sljedećih 6 mjeseci mora svesti na **tri koherentne investicije**, ovo bi bile preporuke koje balansiraju impact, effort i međusobno ojačavaju:

### Preporuka 1: Eksplorabilne ekspozicije + glosar (stavke 1.1, 1.2, 4.4, 7.1)
**Zašto zajedno:** Stavlja na stol *vidljivu* razliku između ovog i bilo kojeg drugog hrvatskog udzbenika. Eksplorabilne ekspozicije = vizualni hook; glosar = praktična korisnost; spojeno = "ovo nije obična knjiga". Ujedno je tehnički savršeno dosegnut s postojećom Quarto + OJS infrastrukturom.
**Procjena rada:** 3–4 mjeseca koncentriranog rada, najbolje s jednim dizajnerom/JS programerom.

### Preporuka 2: Chat-with-the-book (stavka 2.1)
**Zašto sam:** Najveći pojedinačni impact u 2026. Mijenja što znači "imati knjigu" — knjiga postaje konzultabilan ekspert, ne samo arhiv. Tehnički je dovoljno zreo (RAG + Claude/GPT API). Marketinški jedan jaki diferencijator: "prva hrvatska AI knjiga o javnim politikama". I jednom kad postoji backend, otvara put za 2.3 (auto-pitanja) i 4.1 (vježbe s evaluacijom).
**Procjena rada:** 2–3 mjeseca, najbolje s jednim full-stack inženjerom + autorska disciplina za prompt engineering.

### Preporuka 3: Atlas-kao-citatabilni-izvor (stavke 3.2, 3.3, 3.4 + 5.4)
**Zašto zajedno:** Pretvara Atlas iz "naše interne stvari" u **distribucijski kanal**. Embed-gumb stavlja grafove u novinske članke; DOI-jevi ih stavljaju u znanstvene papire; citiraj-nas widget u sva ostala mjesta. Niska tehnička barijera, srednji impact, **vrlo visok strateški značaj** — radi mrežu autoriteta oko platforme.
**Procjena rada:** 1–2 mjeseca, uglavnom inženjerski.

**Kombinacija sve tri u 12 mjeseci** bi platformu pomakla iz "ozbiljan akademski Quarto-projekt" u "prvi hrvatski primjer onoga što digitalna publikacija danas može biti". To je realan cilj — tri prepoznatljiva poteza, svaki s vlastitim demo-momentom, koji zajedno pričaju jedinstvenu priču.

---

*Kraj memo-a. Svi prijedlozi su otvoreni za reviziju; ocjene su autorska procjena Claudea (Opus 4.7) na temelju trenutne analize platforme. Ovaj dokument nije za javnu objavu — interni je strateški memo.*
