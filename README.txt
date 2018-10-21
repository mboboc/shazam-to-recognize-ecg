BOBOC MADALINA 323CD

ex2:
ex2.m 
-checkerul-
Trece prin toate fisiere persoanelor si dechide baza de date 1m.mat.
In functie de valoarea lui israw va fi selectat semnalul
filtrat sau cel cu zgomot.
Se apeleaza functia pentru toate persoanele, matchurile sunt numarate
si afisate la sfarsit.
Daca nu sunt matchuri se afiseaza 0.

ecg_function.m
Functia primeste doi parametrii. Semnalul si tipul acestuia 
(raw sau filtrat).
Daca ecg-ul este deja filtrat am facut fft pe functie, am calculat
spectrul si dupa cu functia maxk am selectat cele mai mari
n (am luat n = 20) aplitudini pentru vectorul caracteristic.
Match-ul e in proportie de 100%.
Cand primesc un semnal nefiltrat cu acelasi algoritm indiferent
de filtru pe care il aplic match-ul este doar de 4/90. Am
presupus dupa ce am incercat mai multe filtre ca acest lucru 
nu tine de filtru ci de vectorul caracteristic si de faptul
ca cel mai probabil nu creez un vector caracteristic care sa
contina informatia corecta. Am decis sa ma folosesc de
functia spectogram din matlab care imi face vectorul 
caracteristic. Ca functie window am ales sa folosesc
kaiser(1000). Match-ul obtinut este de 66/100.
Ca metoda de comparare, am folosit de distanta
euclidiana.

