# Daten für "RoBERTa-RILE"

In diesem Repository wurden die allgemeinen Manifesto-Daten auf einen Trainingsdatensatz zusammengeschnitten.

## Trainingsdaten

Die Trainingsdaten sind wie folgt verteilt:

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 52.910 |
| 1          | Links        | 37.231 |
| 2          | Rechts       | 26.575 |

Deutlich wird, dass es sich nicht um einen balancierten Datensatz handelt.
## Validierungsdaten

Der Validierungsdatensatz wurden per Zufallsauswahl aus dem Trainingsdatensatz gebildet.

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 9.474 |
| 1          | Links        | 6.512 |
| 2          | Rechts       | 4.611 |

Deutlich wird, dass es sich nicht um einen balancierten Datensatz handelt.

## Testdaten

Als Testdaten stehen  kanadischen Daten aus einem Zeitraum von 2004-2008 zur Verfügung.

| left_right | Beschreibung | Anzahl |
|------------|--------------|--------|
| 0          | Neutral      | 3.894 |
| 1          | Links        | 2.611 |
| 2          | Rechts       | 1.838 |

Auch hier besteht keien Balance zwischen den Labels.
Interessanter wird es allerdings, für die Wahlprogramme den RILE-Index vorherzusagen und im Zeitverlauf zu beobachten.

