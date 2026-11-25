# wood

Collecteur **passif** de réseaux Wi-Fi pour **Termux** (Android), avec un
**dashboard temps réel** dans le terminal.

`wood` écoute les *beacons* — les signaux que chaque borne Wi-Fi diffuse en
permanence dans l'air — et enregistre, avec ta position GPS et l'heure :

- le nom du réseau (SSID),
- l'identifiant matériel de la borne (BSSID),
- le canal et la fréquence,
- le type de sécurité (ouvert / WEP / WPA2 / WPA3),
- la puissance du signal (RSSI).

Tout est rangé dans une base SQLite locale (`~/.wood/wood.db`).

> **Cadre légal.** `wood` est 100 % passif : il ne fait que *recevoir* des
> ondes diffusées publiquement, exactement comme ton téléphone quand il liste
> les réseaux disponibles. Il ne se connecte à aucun réseau, ne scanne aucun
> port, n'envoie rien. Il n'inclut volontairement aucune capacité d'intrusion.

## Installation (Termux)

Termux **et** Termux:API doivent venir de **F-Droid** (même source, sinon les
signatures ne correspondent pas et le pont matériel refuse de fonctionner).

```bash
pkg install git -y
git clone https://github.com/jules-mahounou/wood
cd wood
bash install.sh
```

Puis, une seule fois :

1. Installe l'appli compagnon **Termux:API** depuis F-Droid.
2. Autorise la **localisation** pour Termux:API, et **active le GPS**.

## Temps réel (important)

Par défaut Android **bride les scans Wi-Fi** à ~4 toutes les 2 min : le
dashboard semblerait figé. Pour un vrai temps réel, **sans root** :

1. Réglages → À propos → tape 7× sur « Numéro de build » (active le mode dev).
2. Réglages → Système → **Options pour les développeurs**.
3. Désactive **« Limitation de la recherche Wi-Fi »** (*Wi-Fi scan throttling*).

Après ça, `wood` rafraîchit en continu. (Certaines surcouches constructeur
cachent ce réglage ; sans lui, le plafond des 4 scans / 2 min s'applique, et
le vrai sniffing continu demanderait le root + une puce compatible.)

## Utilisation

| Commande       | Rôle                                                        |
|----------------|-------------------------------------------------------------|
| `wood`         | **dashboard temps réel** (bornes triées par signal, live)   |
| `wood update`  | un scan unique immédiat, l'affiche et l'enregistre          |
| `wood stats`   | bilan : bornes uniques, répartition par sécurité, top bornes |

Pour collecter écran éteint :

```bash
termux-wake-lock
wood
```

## Note technique

Capter le **trafic réel** (mode *monitor*, façon Wireshark) demanderait le
**root** + une puce compatible ou un adaptateur Wi-Fi USB externe — hors
périmètre de ce projet, qui reste volontairement passif et légal.
