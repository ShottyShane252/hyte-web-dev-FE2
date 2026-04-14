# Testaus tehtävät

## Tehtävä 1 - Robot Framework asennus

 Kuvaus
Asensin seuraavat työkalut:

- Robot Framework
- Browser Library
- Requests Library
- CryptoLibrary
- Robotidy

Käytin VS Code terminaalia pip install komennolla

---
 Asennus
Suoritin seuraavat komennot:

```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-requests
pip install robotframework-crypto
pip install robotframework-tidy
```

Virtuaaliympäristö (.venv)

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
##  Tehtävä 3 - Web Form -testaus

Testasin WebForm esimerkkisivua eteenpäin lisäsin automaatioon pari testiä lisää
- dropdown valikko
- checkbox

Komennoilla:
```bash
Select Options By    [name="my-select"]    value    2
Check Checkbox    selector=[id="my-check-2"]
```

 .env tiedoston luonti
Loin .env-tiedoston projektin juureen
.env.sample tiedoston sisältö:

```bash
API_KEY=mysecretapikey
BASE_URL=http://localhost:3000
```
Asensin kirjaston:

```bash
pip install python-dotenv
```
Loin tiedoston load_env.py
Tiedoston sisältö:
```bash
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv('API_KEY')
BASE_URL = os.getenv('BASE_URL')
```
Lisäsin muuttujat robottiin

```bash
*** Settings ***
Variables    load_env.py
```
```bash
Log    ${API_KEY}
Log    ${BASE_URL}
```

 Tietojen salaaminen
CryptoLibrary tietojen salaamiseen
asensin komennolla:
```bash
pip install --upgrade robotframework-crypto
```
generoin avaimet:
```bash
python -m CryptoLibrary
```
Valitsin:
- Open Config
- Configure key pair
- Generate key pair

Syötin salattavat tiedot (Käyttjätunnus ja salasana)
```bash
python -m CryptoClient
```

sain tulokseksi häshätyn merkkijonon
syötin ne
[Keywords.robot](../test/front/Keywords.robot)tiedostoon

```bash
*** Settings ***
Library    Browser
Library    CryptoLibrary    variable_decryption=True
```
ja Keywords.robot tiedostoon
```bash
*** Variables ***
${Username}    crypt:xxxxxxxxxxxx
${Password}    crypt:yyyyyyyyyyyy
```
## Tehtävä 4 - Päiväkirjamerkinnän testaus

Testin toiminta
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
Fill Text      id=notes    This entry was made by robot!!
Click          css=button[type="submit"]
```
## Tehtävä 5 - Kirjautuminen .env-tiedostolla

Loin .env-tiedoston projektin juureen.

.env-tiedoston sisältö:

```bash
USERNAME=oma_kayttajatunnus
PASSWORD=oma_salasana
```
```bash
pip install python-dotenv
```
Loin tiedoston load_env.py, joka lukee ympäristömuuttujat:
```python
import os
from dotenv import load_dotenv

load_dotenv()

Username = os.getenv("USERNAME")
Password = os.getenv("PASSWORD")
```
Lisäsin muuttujat Robot Frameworkiin:
```robot
*** Settings ***
Variables    load_env.py
```

Linkit:
- [testit](test/front/)
- [tulokset](outputs/)
## Tehtävä 6 - Tietojen salaaminen CryptoLibrarylla

Tässä tehtävässä salasin käyttäjätunnuksen ja salasanan CryptoLibraryn avulla.

Asensin CryptoLibraryn:

```bash
pip install --upgrade robotframework-crypto
```

Generoin avainparin:

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
```

- [tulokset](outputs/)
## Tehtävä 7 Lokitidostot outputs kansioon
Parin ensimmäisen tehtävän aikana huomasin että testaukset tallentavat tiedostoja esim.playwright-log-1774342903702113800.txt ja mietin heti että tämä ei voi olla paras käytäntö varsinki kun minulla on terveys sovellukseni myös samassa projekti kansiossa. Kysyin tekoälyltä joka ehdotti minulle komentoa joka ohjaa turhat output tiedostot suoraa outputs-kansioon.
Käytän tätä komentoa aina kun ajan testin muutan tiedoston nimeä tarpeen mukaan mutta loppuosa komennosta pysyy samana
Komento:
```bash
robot -d outputs test/front/browser_demo.robot
```
Myös tiedostot
- output.xml
- log.html
- report.html
 tallentutuvat suoraan [outputs](../outputs/) kansioon
## Tehtävä 8 Github.io

Tässä tehtävässä julkaisin testien raportit Github Pageissa
Asetin sen käyttämään testaus2 haaraa ja juurkansiota (/root)
Raportit löydät näistä linkeistä:
- [log](../hytefe2/outputs/log.html)
- [report](../hytefe2/outputs/report.html)
