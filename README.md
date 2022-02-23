# Daten für "RoBERTa-RILE"

In diesem Repository wurden die allgemeinen Manifesto-Daten auf einen Trainingsdatensatz zusammengeschnitten.

## Trainingsdaten

Die Trainingsdaten sind wie folgt verteilt:

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 60.809 |
| 1          | Links        | 42.553 |
| 2          | Rechts       | 29.937 |

Deutlich wird, dass es sich nicht um einen balancierten Datensatz handelt.
## Validierungsdaten

Der Validierungsdatensatz wird per Zufallsauswahl aus dem Trainingsdatensatz gebildet.

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

