# wood

Collecteur **passif** de réseaux Wi-Fi pour **Termux** (Android).

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

```bash
git clone https://github.com/jules-mahounou/wood
cd wood
bash install.sh
```

Puis, une seule fois :

1. Installe l'appli compagnon **Termux:API** depuis F-Droid.
2. Autorise la **localisation** pour Termux:API.
3. Active le **GPS** du téléphone (sans localisation activée, Android renvoie
   une liste de réseaux vide depuis Android 9).

## Utilisation

| Commande       | Rôle                                                        |
|----------------|-------------------------------------------------------------|
| `wood`         | affiche l'aide                                              |
| `wood update`  | un scan unique immédiat, l'affiche et l'enregistre          |
| `wood start`   | collecte en continu (à laisser tourner en déplacement)      |
| `wood watch`   | affiche en direct les nouveaux relevés (2ᵉ onglet)          |
| `wood stats`   | bilan : bornes uniques, répartition par sécurité, top bornes |

Pour collecter écran éteint :

```bash
termux-wake-lock
wood start
```

## Note technique

Android **bride la fréquence des scans** (~4 scans / 2 min depuis Android 9) ;
la même liste peut donc se répéter entre deux fenêtres. Capter le trafic réel
(mode *monitor*, façon Wireshark) demanderait le **root** + une puce compatible
ou un adaptateur Wi-Fi USB externe — hors périmètre de ce projet.
