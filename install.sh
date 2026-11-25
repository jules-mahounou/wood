#!/data/data/com.termux/files/usr/bin/bash
# Installe la commande `wood` dans Termux.
set -e

echo ">> Dépendances (python, termux-api)..."
pkg install -y python termux-api

echo ">> Module d'affichage (rich)..."
pip install --upgrade rich

SRC="$(cd "$(dirname "$0")" && pwd)"

echo ">> Installation du binaire wood dans \$PREFIX/bin..."
install -m 755 "$SRC/bin/wood" "$PREFIX/bin/wood"
termux-fix-shebang "$PREFIX/bin/wood" 2>/dev/null || true

# mémorise l'emplacement du dépôt pour 'wood upgrade'
mkdir -p "$HOME/.wood"
echo "$SRC" > "$HOME/.wood/source"

echo
echo "Terminé. Tape 'wood' pour lancer le dashboard temps réel."
echo
echo "À faire UNE fois :"
echo "  1. Appli compagnon 'Termux:API' installée depuis F-Droid (même source que Termux)."
echo "  2. Localisation autorisée pour Termux:API + GPS activé."
echo "  3. TEMPS RÉEL : Options développeur -> désactive 'Limitation recherche Wi-Fi'"
echo "     (sinon Android bride à ~4 scans / 2 min)."
