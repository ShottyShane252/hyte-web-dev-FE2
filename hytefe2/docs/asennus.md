# Robot Framework asennus

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


