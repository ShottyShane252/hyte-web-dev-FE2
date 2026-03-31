# Testaus tehtävät

## Robot Framework asennus

## Kuvaus
Asensin seuraavat työkalut:

- Robot Framework
- Browser Library
- Requests Library
- CryptoLibrary
- Robotidy

Käytin VS Code terminaalia pip install komennolla

---
## Asennus
Suoritin seuraavat komennot:

```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-requests
pip install robotframework-crypto
pip install robotframework-tidy
```

## Virtuaaliympäristö (.venv)

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

##  Web Form -testaus


Testasin WebForm esimerkkisivua eteenpäin lisäsin automaatioon pari testiä lisää
- dropdown valikko
- checkbox

Komennoilla:
```bash
Select Options By    [name="my-select"]    value    2
Check Checkbox    selector=[id="my-check-2"]
```

## .env tiedoston luonti
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

## Tietojen salaaminen
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
