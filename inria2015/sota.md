\newpage

Les bases
=========

(renommer)


Melange
-------

J'ai travaillé sur le langage Melange, le projet de thèse de Thomas Degueule.
Melange est un language [melange-lang.org] de programmation de type : "Langage-based Model-oriented programming language"; 
c'est à dire qui manipule des languages et permet de faire des operations dessus pour produire d'autre langugaes.

Le typage de langage permet de faire pleind e trucs avec leurs modeles
comme par exemple les decouper (en extraire une partie coherente) pour ensuite coller le 
slice sur un autre model. Il y a aussi une notion d'heritage (et du coup de sous-typage)

(essayer de citer deux trois papier la dessus pour faire credible)

Melange basé sur la platforme eclipse RCP et repose sur les plugins xtext/xtend, ecore/emf, k3, ...

Beaucoup de features comme la generation d'editeurs de metamodels a la volée, la generation des-dits mm
en plus des plugins eclipse de base comme l'outline, la completion auto, la consommation de memoire infinie, ...


Eclipse
-------


###RCP - Rich Client Platform

Il s'agit de la plateforme de développement de plugins eclipse.
Néanmoins ce n'est pas un EDI a part entiere. RCP ne fournit aps de client riche de developpement (lol whatajoke)
il fournit uniquement une suite de framework qui permet de developper des 'client riche'.
En gros c'est un SDK specifique a Eclipse.
(merci wipikedia)


Plein de features a implementer (menu, hyperlink, outline, console (sorry 'bout that), ...)
2 manieres de faire, soit en contribuant a un "extension point" soit en "bindant" et redefinissant les
provider/classes (j'arrive pas trop a bien ecrire ca)


###EMF / ECORE

EMF, ou Eclipse Modelling Framework, est un framework de modelisation et de geenration de modeles
Permet de creer un model, de lui associer un fichier de generation (nommé avec l'extension .gemodel)
et de generer un compilateur pour le model, un editeur, un ast et des tests.

Ecore quand a lui definit les concepts manipulables par EMF (ECLass, ETypedElement, EString, ...)

Langages
--------

###XTEXT

language d'ecriture de grammaire. Permet de creer un language et ses ast pour la grammaire donnée.
Si combiner avec un metamodel EMF, permet de generer le model du language et un editeur integré a eclipse.

Tres pratique et permet de s'abstraire de totue la partie "dev d'un editeur" qui peut eter tres longue.

###XTEND

Xtend est un language d'expression de java. Tout programme ecris en xtend sera traduit en java.
Il est ters pratique car il a une syntaxe beaucoup plus souple que java, permet d'effectuer des
opertaions assez complexes de facon rapide. Avant java8 il integrait des lambdas-expressions.
Et la syntaxe de ces lambdas expression est vraiment plus sympa qu'en java.


