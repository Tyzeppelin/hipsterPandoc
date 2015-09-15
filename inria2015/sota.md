L'environnement de travail
==========================

Melange
-------

J'ai travaillé sur le langage Melange, le projet de thèse de Thomas Degueule.
[Melange](http://melange-lang.org/) est un language de programmation de type :
"Langage-based Model-oriented programming language"; c'est à dire qu'il manipule
des langages sous forme de métamodèles dans le but de créer un nouveau langage spécifique
composé d'un ou plusieurs fragments de langages.

Melange est basé sur la platforme “client riche” d’Eclipse connue sous le nom de Eclipse RCP, cela
permet .
Cela permet d’utiliser les nmobreux plugins d’Eclipse déjà existant
Mes plugins xtext pour la grammaire, emf pour les modèles et métamodèles, .

Beaucoup de features comme la generation d'editeurs de metamodels a la volée, la generation des-dits mm
en plus des plugins eclipse de base comme l'outline, la completion auto, la consommation de memoire infinie, ...


Eclipse
-------


###RCP - Rich Client Platform

Il s'agit de la plateforme de développement de plugins Eclipse.
Néanmoins ce n'est pas un EDI a part entiere. RCP ne fournit pas de client riche de developpement,
il fournit uniquement une suite de framework qui permet de developper des 'client riche'.
Pour faire simple, Eclipse RCP est un sdk pour développement de plugins.

Le kit de développement propose tout un panel de “point d’extension” sur lesquels le développeur
vient contribuer. Ce design en point d’extension permet notamment de minimiser la quantité de code à produire
dans le cadre du développement de plugins Eclipse, étant donné que bon nombre de ces extensions ont déjà un
comportement défini par défaut. Une bonne manièred’apprendre le foncitonnement de la plateforme client riche
est de suivre les tutoriels de Lars Vogel disponible sur le site internet
[http://www.vogella.com/tutorials/](http://www.vogella.com/tutorials/)

###EMF / ECORE

EMF, ou Eclipse Modeling Framework, est un framework de modélisation et de génération de modèles.
Il permet notamment de générer, à partir du modèle, un éditeur associé au modèle, une série de tests
ainsi que beaucoup de petits plugins Eclipse comme un système d’hyperlien vers les définitions des objets
manipulés, une gestion d’erreur et un déboggeur.

Langages
--------

###XTEXT

Xtext est un framework de développement de langages de programmation. A partir d’une grammaire sous la forme
EBNF, xtext génère un compilateur pour ce langage ainsi que les fonctionnalités de bases de l’éditeur eclipse
associé à ce langage, c’est à dire de la coloration syntaxique, de l’auto-complétion et une gestion des erreurs
de syntaxe.

###XTEND

Xtend est un langage de programmation qui, une fois compilé en java, tourne sur la _java virtual machine_. Le 
principal interêt est l’éclaircissement de la syntaxe de java. Par exemple les expression lambdas, dont la syntaxe
est assez repoussantes en Java, devient très lisible et utilisable avec xtend. Pour faire simple, xtend est simplement
du sucre syntaxique pour java. Ce qui rends le développement d’applications java plus aisé et moins verbeux.
