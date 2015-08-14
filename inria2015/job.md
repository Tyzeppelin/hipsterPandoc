Réalisation
===========

Apprenstissage des outils
-------------------------

Debut -> apprendre a se servir des outils

notamment

 - Xetxt (un peu de grammaire ca ne fait pas mal)
 - Xtend (pendant d'xtext, langage qui compile en java et qui n'apporte que du sucre syntaxique)
 - emf/ecore (mwe)
 - eclipse RCP (apprendre comment se servir des api RCP d'eclipse)
 - log4j (I suppose)
 - junit (pas vrfaiment de "l'apprentissag" mais plutot une jolie experience)

Usage de l'experience acquise a lire de la doc qui n'existe pas
---------------------------------------------------------------

TODO: peut-etre revoire le titre

Ben j'ai fait des trucs
Voila.

Essayer de classer les trucs a faire par ordre de difficukté (apparante)
du coup j'ai commencé par l'outline
toutu le traavil avait deja ete fait auparavant et il fallait corriger les deux trois derniers bugs qui trainaient
Au final il a fallut reecrire deux trois textProvider histoire de faire bonne impression (et pour ne pas passer pourt un incompetant total)
Du coup ca a marché un temps jusqu'a ce que Thomas change pleind e trucs et casse tout. Du coup il a re-fallut fix tout ca.

Ensuite je me suis dit, "tiens j'ai deja taffé les mecanismes de completions en etude pratique (projet 3INFO), du coup pourquoi pas faire ca,
ca a pas l'air trop dur"
Du coup je m'y mets.
Et c'est pas du tout mais alors PAS DU TOUT géré de la meme maniere que dans Latexila avec GTK.
en gros dans gtk c'est a toi de dire apres quel mot-cle tu propose l completion. ici la completion
est géré par xtext (qui gere aussi la grammaire) et se base sur la grammaire et le metamodel de melange.
En grospour faire simple. Dans la grammaire, on peut specifier si le texte entré par l'utilisateur est un nom qualifié
ou alors une bete chaine de caractere.Et le ystseme de completion (qui est un systeme de scope pour etre precis) va "simplement"
faire des crossref entre les noms qualifés (etverifier qu'ils sont bien du bon type) et les eobject pour fournir une invite de completion
avec des choix pas trop mauvais. mais du coup on attrape trop de chose dans le scope (ou pas assez c'est selon).
Ca implique deux choses, deja pas de cross ref possible pour les string du fait que l'on ne peut pas faire de crossref avec le contenu de la string
et deuxiemement que c'est assez simple de surcharger les methodes de creations de scope. En gros l'idée a été de 
faire un dispatcher sur le type des regles de grammaire. A chaque fois que la demande de commpletion est faite, le provider
va appeler le dispatcher qui va verifier le type de la regle de grammaire dans laquelle on demande la completion (mf)
et qui va appeler la bonne methode qui va se charger de filtrer les resultats du scopeprovider "legacy" et lui rajouter les
resultats manquants.
J'ai fait ca notemment pour l'heritage. Un langage (comme une classe, je rapelle que les langages son typés ici aussi) peut heriter
d'un autre langage (cad L1 possede toutes les proprietes de L2) mais ne peut pas heriter de lui meme (les references circulaires c'est SATAN)
Et aussi pour le slice. On ne peut slicer un langage que sur ses "NamedElements" et seulement les siens.

BTW pour avoir pu faire la completion sur les objets slicés il a fallut que je modifie la grammaire et le metamodel de melange. 
C'est quand meme marrant de se dire que ya 2 mois je ne connaissais rien aux metamodels et que pendant le stage on m'a laisser modifier
le metamodel du sujet de these de thomas. Apres j'ai fait gaffe et jamais sans demander son accord. But still.

Ensuite j'ai fait qqs bugfix. Notamment avec la generation de leuts metamodels examples. Rien de bien mechants, juste une variable mal set-é


Apres il y a eu le passage du menu. Alors la j'en ai chié. Ajouter un sousemnu static avec 3 boutons predefinies et ayant des comportement
fixes, ca va. Suffit de lire la doc (oh wait) et deux trois implem pour faire un truc qui fonctionne vaguement
Par contre un sous menu dynamique qui n'est actif que pour certaines extension de fichiers (definie pendant le runtime), et qui possede un 
nombre variable de boutons (autant que d'editeurs accessibles pour un langage donné) c'est assez funky. Et pour le coup al documentation n'existepas
En gros il faut surcharger tout. il faut refarie un menumanager a la main, faire en sorte qu'il s'active lorsqu'il est non vide (ca aussi c'est 
ecrit dans aucune doc) et creer un handler geenrique qui soit capable de faire le rapprochement entre extension de fichier sous-type du langage associé et 
editorID du-dit langage sous-type. Au final ila fallut creer la "structure" basique edu menu dans le plugin.cml (TODO: expliquer le fonctionnement de RCP)
faire une implem du MenuManager. Construire le menu en allant chercher les elements dans les extensions points eclipse (definies au runtime)
(recupere l'extension de ficher, puis l'exactType associé, puis les sous types associés puis leur extension de ficher associé puis leur edittorID.)
et ensuite faire un handler quie va gerer l'ouverture des editeurs. Ah parceque oui je suis censé l'avoir dit avant mais le but c'est de faire un menu
qui permette d'ouvrir un fichier d'un langage donén avec l'editeur d'un autre langage sous-type du premier langage. Ah et du coup ca implique
plein de truc au nievau de l'editeur. Comme le fait qu'il faille fournir des adapters specifiqueentre les deux langages. Ca c'est pas moi qui
gere,disons que pour ouvrir l'editeur je ne fais qu'un appele "openEditor()" en filant une URI custom qui va eter donné a un processor melange qui 
lui va faire le lien entre les deux langages. Example, on a deux fs a et b quasiment identiques sauf que b implement un timer dans la metaclasse "etat"
ben en gros si on veut ouvir b avec a (b possede toutes les features de a et en possede en lpus) on doit"transformer" b en a cad ne pas afficher la partie
qui gere le temps. et du ocup ca c'est pas a moi de le farire c'est deja généré par le compilateur (?) melange.

ensuite je suis parti sur la console mais il faut que Thomas revienne de vacances parceque je suis heurté a des trucs un poil trop genant.
Notamment sur la gestion des logs. je pige pas.

Il voualit aussi de la completion pour les uri des ecore. Mais faire des crossref sur des string... Bah ca marche pas. voila. et c'est a peupres pareil pour
les operateurs de renommage. A l'heure actuelle tout est fait avec des strings et du coup aps de crossref possibles. Il faudrait revoir tout un
pan entier de la grammaire et du metamodel. Et je verrai avec thomas pour faire ca.

Il resetera la partie sur les tests. C a al'air "fun". En gros l'idée c'est (pour la partie ou on ne peut pas juste faire des appels)ouvrir un eclipse
à la volée et de simuler le comportement d'un utilisateur.Ca va permettre de tester ce que j'ai fait et de faire des patchs a la va-vite pour rustiner
tout ca.
