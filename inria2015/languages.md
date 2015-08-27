\newpage
Les langages
============

[Cours de Mr Cousineau]{http://www.pps.univ-paris-diderot.fr/~cousinea/Cours/Licence/Cours.pdf}

Mais pourquoi je m'embarque la dedans.... Probablement pour faire plus de contenu

BREF.

WTF IZ DIZ
----------

Un langage en informatique peut etre vu comme composé de 3 parties:
 - Une syntaxe abstraite
 - Une syntaxe concrete
 - Une semantique

La syntaxe abstraite correspond au règles qui définissent la grammaire (ou le metamodele, ca depends du mode de representation)
La syntaxe concrete c'est le representation de l'AS (c'est l'editeur (?): texte, diagramme, un mix, ...)
Et la semantique c'est le sens du code. En gros comment tu interprete ce qui est ecris (generalement c'est un compilo ou un interpreteur)

En gros voila ce qu'il faut pour faire un langage.

Un exemple de langage: 
 LE YAKA (cours de compilo de 3INFO)

 On a définit une grammaire (l'AS) ecrite selon la syntaxe du metalangage EBNF (et ransformé en ast java grace a javacc),
 En ce qui concerne la syntaxe concrete, on a choisi (imposé) la forme textuelle, l'editeur eclipse (mwe...).
 et le compilateur (semantique) a été généré par javacc a partir de la grammaire.


note: metalangage: EBNF ou MOF


L'apport de Melange a la science
--------------------------------

(on ne va parler que de model-based programming languages par la suite)

En gros une fois qu'on a des jolis modeles ben on est bien content.

Melange genere des editeurs pour ces models et des plugins eclipse dediés avec plein de trucs comme une outline, un completion provider, ...

Ce qu'on peut se dire apr la suite c'est que l'on peut merge plusieurs modeles pour reutiliser des fonctionnalités sans avoir a les recoder
pratique.
en réalité c'est un poil plus technique et c'est bien expliqué ici [inserer biblio ici]
En gros il faut creer un lien (s'il n'existe pas) et le merge comme ca.

Ensuite on peut vouloir ne garder que des morceaux interessants de models et n'avor rien a faire du reste
mais on ne veux pas tout garder apceque ca ne serta rien.
Du coup on peut imaginer "decouper" les models (slice) selon une certaine feature et ne garder que le minimum necessaire au bon
fonctionnement de cette feature. Du coup on se retrouve avec un model reduit (lol) que l'on peut incorporer grace au mecanisme
de merge que l'on a developper 
