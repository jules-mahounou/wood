#!/data/data/com.termux/files/usr/bin/bash
# Installe la commande `wood` dans Termux.
set -e

echo ">> Dépendances (python, termux-api)..."
pkg install -y python termux-api

echo ">> Module d'affichage (rich)..."
pip install --upgrade rich

echo ">> Installation du binaire wood dans \$PREFIX/bin..."
install -m 755 "$(dirname "$0")/bin/wood" "$PREFIX/bin/wood"
termux-fix-shebang "$PREFIX/bin/wood" 2>/dev/null || true

echo
echo "Terminé. Tape 'wood' pour lancer le dashboard temps réel."
echo
echo "À faire UNE fois :"
echo "  1. Appli compagnon 'Termux:API' installée depuis F-Droid (même source que Termux)."
echo "  2. Localisation autorisée pour Termux:API + GPS activé."
echo "  3. TEMPS RÉEL : Options développeur -> désactive 'Limitation recherche Wi-Fi'"
echo "     (sinon Android bride à ~4 scans / 2 min)."
