# Projektname

Kurzbeschreibung des Projekts.

## Setup

Beschreibung wie das Projekt nach dem Klonen aufgesetzt und genutzt werden kann. Gerne auch durch Beipielcode für Kernfunktionen ergänzen. 

Um dieses Projekt mit eigenem Namen aufzusetzten kann das init.sh skript genutzt werden. Dieses ersetzt den Platzhalter Projekt durch den gewählten Namen, erstellt ein entsprechendes Python Modul und initialisiert ein Virtuelles Environment in dem dieses Verfügbar ist. Außerdem wird ein neues Git-Repo initialisiert:

```bash
init.sh {dein_projektname}
```

dann venv initialisieren:

```bash
uv sync
source .venv/bin/activate
```

### Beipiel

```bash
python scripts/example.py
```

## Projektstruktur

```
├── configs/         ← YAML-Konfigurationen
├── data/            ← Daten (per default nicht getrackt, wenn gewünscht aus .gitignore löschen, bei großen Daten lfs oder dvc erwägen)
├── models/          ← Gespeicherte Modelle
├── notebooks/       ← Jupyter Notebooks
├── scripts/         ← Standalone-Skripte
├── src/project/     ← Python-Package
├── tests/           ← Tests
└── pyproject.toml
```
