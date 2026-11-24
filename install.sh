#!/data/data/com.termux/files/usr/bin/bash
# Installe la commande `wood` dans Termux.
set -e

echo ">> Installation des dépendances (python, termux-api)..."
pkg install -y python termux-api

echo ">> Installation du binaire wood dans \$PREFIX/bin..."
install -m 755 "$(dirname "$0")/bin/wood" "$PREFIX/bin/wood"
termux-fix-shebang "$PREFIX/bin/wood" 2>/dev/null || true

echo
echo "Terminé. Tape 'wood' pour voir l'aide."
echo
echo "IMPORTANT, à faire une seule fois :"
echo "  1. Installe l'appli compagnon 'Termux:API' depuis F-Droid."
echo "  2. Autorise la localisation pour Termux:API dans les réglages Android."
echo "  3. Active le GPS du téléphone (sinon le scan Wi-Fi renvoie une liste vide)."
