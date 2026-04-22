# Testaus tehtävät

## Tehtävä 1 - Robot Framework asennus

### Kuvaus

Asensin seuraavat työkalut:

- Robot Framework
- Browser Library
- Requests Library
- CryptoLibrary
- Robotidy

Käytin VS Code terminaalia pip install komennolla

---
### Asennus

Suoritin seuraavat komennot:

```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-requests
pip install robotframework-crypto
pip install robotframework-tidy
```

### Virtuaaliympäristö (.venv)

 Loin projektiin virtuaaliympäriston komennolla:
```bash
python -m venv .venv
```

 Aktivoin sen
 ```bash
.venv\Scripts\activate
```
 Päivitin pipin:
```bash
python -m pip install --upgrade pip
```
 Alustin Browser Libraryn komenolla:
```bash
rfbrowser init
```
 Tarkistin Robot Framework version komennolla:
```bash
python -m robot --version
```
 Loin riippuvuustiedoston:
 ```bash
pip freeze | Out-File -Encoding utf8 requirements.txt
```
Hain komennon tekoälyltä koska pip freeze > requirements.txt ei tulostanut oikeaa tietoa tiedostoon
##  Tehtävä 2 - Kirjautumistesti

### Kuvaus

Tässä tehtävässä toteutin automaattisen kirjautumistestin sovelluksellani käyttäen Robot Frameworkkia
Testissä
- Avataan login-sivu
- Syötetään käyttäjätunnus ja salasana
- Suoritetaan kirjautuminen painamlla nappia

### Linkit

- [Testi](../test/front/task2.robot)
- [Log](../outputs/task2/log.html)
- [Report](../outputs/task2/report.html)
##  Tehtävä 3 - Web Form -testaus

### Kuvaus

Tässä tehtävässä testasin Web Form esimerkki ja sen eri toimintojen käyttöä

---

### Testin toiminta

Testissä toteutuin
- Sivun avaus
- Valittiin arvo dropdown-valikosta
- Valittiin checkbox

---

### Testin komennot

```robot
    Select Options By    [name="my-select"]    value    2
    Check Checkbox    selector=[id="my-check-2"]
```

### Linkit

- [Testi](../test/front/task3.robot)
- [Log](../outputs/task3/log.html)
- [Report](../outputs/task3/report.html)
## Tehtävä 4 - Päiväkirjamerkinnän testaus

### Kuvaus

Tässä tehätävässä täytin sovellukseni päiväkirjaan yhden merkinnän

### Testin toiminta

- Avaa sovelluksen (Dear Diary)
- Kirjautuu sisään
- Siirtyy Diary sivulle
- Täyttää päiväkirjamerkinnät
- date, mood, sleep, notes
- Tallentaa merkinnän painamalla SaveEntry painikketta
Testin komennot
```robot
Fill Text      id=entryDate    2026-03-31
Select Options By    id=mood    value    great
Fill Text      id=sleep    8
Fill Text      id=notes    Task 4 robot entry second attempt
Click          css=button[type="submit"]
```

### Linkit

- [Testi](../test/front/task4.robot)
- [Log](../outputs/task4/log.html)
- [Report](../outputs/task4/report.html)
## Tehtävä 5 - Kirjautuminen .env-tiedostolla

### Kuvaus

Tässä tehtävssä toteutin kirjautumisen käyttämällä muuttujia jotka säilytin .env tiedostossa
Tätä metodia on järkevä käyttää koska TIETOTURVALLISUUS

#### .env tiedoston luonti

Loin .env-tiedoston joka sisältää käyttäjätiedot projektin juureen.

.env-tiedoston sisältö(Korvattu .env.sample tiedoilla):

```bash
APP_USERNAME=oma_kayttajatunnus
APP_PASSWORD=oma_salasana
```
Latasin python-dotenv komenolla:

```bash
pip install python-dotenv
```
Loin tiedoston load_env.py, joka lukee ympäristömuuttujat:

```python
import os
from dotenv import load_dotenv

load_dotenv()

Username = os.getenv("APP_USERNAME")
Password = os.getenv("APP_PASSWORD")

```
Lisäsin muuttujat Robot Frameworkiin:

```robot
*** Settings ***
Variables    load_env.py
```

Testissä käytin muuttijia näin

```robot
Type Text      id=login-username    ${Username}
Type Secret    id=login-password    $Password
```

Huomio! tekoäly neuvoi asettamaan salasan myöskin muotoon:

```robot
Type Secret    id=login-password    ${Password}
```

Mutta se ei suostunut asettamaan salasanaa kenttään joten valitsen ensimmäisen vaihtoehdon jolloin testi suoriutui

### Linkit

Linkit:
- [Testit](../test/front/task5.robot)
- [Log](../outputs/task5/log.html)
- [Report](../outputs/task5/report.html)
## Tehtävä 6 - Tietojen salaaminen CryptoLibrarylla

### Kuvaus

Tässä tehtävässä salasin käyttäjätunnuksen ja salasanan CryptoLibraryn avulla.


### Avainten luonti

Loin CryptoLibraryn avainparin komenolla:

```bash
python -m CryptoLibrary
```
Valitsin:
 - Open Config
 - Configure key pair
 - Generate key pair

 Salasin käyttäjätunnuksen ja salasanan:
 ```bash
 python -m CryptoClient
 ```
Sain tulokseksi salatut merkkijonot, jotka lisäsin Keywords.robot tiedostoon:

```robot
*** Variables ***
${Username}    crypt:xxxxxxxxxxxx
${Password}    crypt:yyyyyyyyyyyy
```

Otin CryptoLibraryn käyttöön Robot Frameworkissa:

```robot
*** Settings ***
Library    Browser
Library    CryptoLibrary    variable_decryption=True
Resource    Keywords.robot
```

### Linkit

- [Testi](../test/front/task6.robot)
- [Log](../outputs/task6/log.html)
- [Report](../outputs/task6/report.html)
## Tehtävä 7 - Lokitidostot outputs kansioon

Parin ensimmäisen tehtävän aikana huomasin että testaukset tallentavat tiedostoja esim.playwright-log-1774342903702113800.txt ja mietin heti että tämä ei voi olla paras käytäntö varsinki kun minulla on terveys sovellukseni myös samassa projekti kansiossa. Kysyin tekoälyltä joka ehdotti minulle komentoa joka ohjaa turhat output tiedostot suoraa outputs-kansioon.
Käytän tätä komentoa aina kun ajan testin muutan tiedoston nimeä tarpeen mukaan mutta loppuosa komennosta pysyy samana

Komento:

```bash
robot -d outputs/taskX test/front/taskX.robot
```

Jokaisen testi myös tallentaa:
- output.xml
- log.html
- report.html
Nyt jokainen testi saa omat tiedostot omaan outputs kansioon

Esimerkkipolku:

(../outputs/taskX)
## Tehtävä 8 - Github.io

Tässä tehtävässä julkaisin testien raportit Github Pageissa
Asetin sen käyttämään testaus2 haaraa ja juurikansiota (/root)

Outputs löydät näistä linkeistä:
- [Outputs](../hytefe2/outputs/) (Lisää linkkiin taskX esim https://shottyshane252.github.io/hyte-web-dev-FE2/hytefe2/hytefe2/outputs/task2)
## Tehtävä 9 - Backend testaus (API)

### Kuvaus

Tässä tehtävässä testasin sovelluksen backendin toimintaa Robot Frameworkin RequestsLibraryn avulla.

Testien tarkoituksena oli varmistaa, että backendin API-endpointit toimivat oikein ja että suojatut reitit toimivat JWT-tokenin avulla.

---

### Testatut endpointit

Testasin seuraavat backendin reitit:

- GET /api/users/login-test
- POST /api/users/login
- GET /api/users/me
- GET /api/entries

---

### Testin toiminta

Testeissä:
- luodaan yhteys backend-palvelimeen
- suoritetaan login ja haetaan token
- käytetään tokenia suojattujen reittien testaamiseen
- tarkistetaan että palvelin palauttaa oikean statuskoodin (200)

---

### Käytetyt kirjastot

```robot
Library    RequestsLibrary
Library    Collections
```

Esimerkki testistä

```robot
${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
${response}=    POST On Session    backend    /api/users/login    json=${body}
Status Should Be    200    ${response}
```

### Linkit

- [Testi](../test/back/task9.robot)
- [Log](../outputs/task9/log.html)
- [Report](../outputs/task9/report.html)

