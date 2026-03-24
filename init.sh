#!/usr/bin/env bash
# Initialisiert das Template mit einem Projektnamen.
# Nutzung: ./init.sh mein_projekt

set -euo pipefail

NAME="${1:?Nutzung: ./init.sh <projektname>}"

# Nur Kleinbuchstaben, Zahlen und Unterstriche erlauben
if [[ ! "$NAME" =~ ^[a-z][a-z0-9_]*$ ]]; then
    echo "Fehler: Projektname darf nur Kleinbuchstaben, Zahlen und Unterstriche enthalten."
    exit 1
fi

sedi() {
    if [[ "$(uname)" == "Darwin" ]]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

# pyproject.toml: nur name = und packages = ersetzen (nicht [project])
sedi "s/name = \"project\"/name = \"$NAME\"/" pyproject.toml
sedi "s|src/project|src/$NAME|" pyproject.toml

# Alle anderen Dateien: "project" im Import/Code ersetzen
for f in README.md scripts/example.py tests/test_utils.py src/project/utils.py notebooks/example.ipynb; do
    sedi "s/project/$NAME/g" "$f"
done

# Paketverzeichnis umbenennen
mv "src/project" "src/$NAME"

# README-Titel setzen
sedi "s/^# Projektname/# $NAME/" README.md

# Git-Repo zurücksetzen
rm -rf .git
git init
git add -A
git commit -m "initial commit"

# venv initialisieren
uv sync

# Dieses Skript entfernen
rm -- "$0"

echo "Projekt '$NAME' initialisiert."
