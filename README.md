# Daten für "RoBERTa-RILE"

In diesem Repository wurden die allgemeinen Manifesto-Daten auf einen Trainingsdatensatz zusammengeschnitten.

## Trainingsdaten

Die Trainingsdaten sind wie folgt verteilt:

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 48.719 |
| 1          | Links        | 33.951 |
| 2          | Rechts       | 23.969 |

Deutlich wird, dass es sich nicht um einen balancierten Datensatz handelt.
## Validierungsdaten

Der Validierungsdatensatz wurden per Zufallsauswahl aus dem Trainingsdatensatz gebildet.

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 12.090 |
| 1          | Links        | 8.602 |
| 2          | Rechts       | 5.968 |

Deutlich wird, dass es sich nicht um einen balancierten Datensatz handelt.

## Testdaten

Als Testdaten stehen alle kanadischen Daten zur Verfügung.
Hieraus ergeben sich 14 Wahlprogramme aus einem Zeitraum von 2004-2008 und aus dem Jahr 2015.

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 5.469 |
| 1          | Links        | 3.801 |
| 2          | Rechts       | 3.087 |

Auch hier besteht keien Balance zwischen den Labels.
Interessanter wird es allerdings, für die 14 Wahlprogramme den RILE-Index vorherzusagen und im Zeitverlauf zu beobachten.

