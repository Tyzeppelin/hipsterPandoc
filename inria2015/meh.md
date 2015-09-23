Réalisation
===========

Outline
-------

Une des premiere fonctionnalité d’Eclipse sur laquelle j’ai travaillé été l’outline.
Il s’agit d’un panneau qui permet, dans notre cas,  l’affichage nos langages sous forme d'arbres.

Eclipse RCP propose, avec les outils de generation d’EMF de creer une outline minimale qui affiche simplement
les classes du modèle du langage. Le problème c’est que l’on aimerait bien afficher des informations supplémentaires sur cet arbre, notamment
les types des langages, et donc leur hiérarchie, ainsi que les “aspects” de ces langages.

Le principe est assez simple, il suffit d’étendre la classe qui créé l’arbre pour créer nos propres branches et feuilles
dans l’abre qui représentent les principales feature du langage. Il est intéressant de noter que la classe de base qui s’occupe
de la création de l’arbre, ```DefaultOutlineTreeProvider```, utilise principalement les deux méthodes:
 ```createNode(IOutlineNode parent, org.eclipse.emf.ecore.EObject modelElement) ``` et
```_isLeaf(org.eclipse.emf.ecore.EObject modelElement) ``` qui sont des dispatchers dynamiques capables de
“choisir” la bonne implémentation de la méthode en fonction du type du ```modelElement```. Mon travail a don été dans un premier
temps de sous-typer ces fonctions dans le but de créer mes propres branches de l’arbre.

Par la suite, le travail a été de créer des provisionneurs de labels pour afficher correctement les éléments du langage dans l’abre
avec leurs types associés.

Hyperlink
---------

Une feature extrémement pratique de la plateforme Eclipse est l’hyperlinking qui permet, au ctrl+click (ou F3) sur un nom qualifié,
d’afficher la définition du-dit nom qualifié. Par exemple lorsque l’on “ctrl+click” sur un appel à une méthode, Eclipse nous affiche
la définition de la méthode.

Le problème est que le mécanisme d’hyperliens ne permet de sauter qu’à la définition de noms qualifiés,
il ne permet de suivre les URI\footnote{URI: Unified Resource Identifier. Identifiant unique qui permet de repérer un fichier
en fonction de son type, de sa plateforme et de son chemin. Dans Eclipse, les URI sont de la forme "plateforme":/"type"/"chemin"/}
Eclipse qui sont situés dans une chaine de caractère notamment. La grammaire de melange
possède la règle de grammaire suivante ```’syntax’ EcoreURI = STRING``` qui permet de référencer l’URI du metamodel du
langage que l’on essaye d’importer. Il peut être pratique de pouvoir naviguer facilement vers ce métamodèle via l’URI
fournie et pour cela il faut modifier le comportement du système d’hyperlien de Eclipse.

Etant donné que la feature hyperlien de melange a été généré par xtext, nous avons simplement redéfini le comportement
de la méthode ```createHyperlinkByOffset(XtextRessource resource, int offset, IHyperLInkAccpetor acceptor)``` en contribuant
au point d'extension de xtext concerné. Notre nouvelle méthode est un petit dispatcher qui s'occupe de reperé dans quelle partie
de la syntaxe se trouve le curseur. Si la resource visé est notre élément “EcoreURI”, la méthode créé un hyperlien vers le métamodèle 
grace à l'URI fournit par l'utilisateur; et dans le cas contraire, la méthode suit le comportement par défaut de création d’hyperlien.

Grammaire et metamodel
----------------------

Pour continuer plus loin dans l’ajout de fonctionnalités à l’éditeur melange, il a fallut revoir la grammaire et le
métamodèle de melange.

Le principal problème rencontré lors du développement de fonctionnalités comme la complétion automatique a été un problème
de grammaire. Un exemple, la fonction de merge de melange dont la syntaxe suit la règle de grammaire "```Merge returns merge: ’merge’ mergedLanguage = STRING ;```"
ne permet pas d’effectuer de complétion automatique puisque xtext ne propose pas de mécanisme de complétion pour
des objets de type STRING. Or les seuls objets qui peuvent être merge sont des objets de type ```Language```. On peut donc réécrire
la précédente règle de grammaire en "```Merge returns merge: ‘merge’ mergeLanguage = [Language | QualifiedName]```" qui permet, en plus
d’accéder aux mécanismes de complétion integrés à Xtext, d’avoir une vérification de type directement das l’éditeur et non plus
uniquement à la compilation. Cette modification de la grammaire va evidemment de pair avec la mise à jour du métamodèle du
langage, en ajoutant un lien de composition entre la classe Merge et le type Language.

Le passage des STRING aux noms qualifiés dans la grammaire de melange a permis d’ajouter une véritable vérification des types
qui facilite l’édition des fichiers melange, ainsi que de faciliter améliorer l’auto-complétion par défaut d’Xtext qui sera d’ailleurs
la prochaine étape de développement.

Scope
-----

Comme expliqué précédement, la modification de la grammaire melange a permis d’améliorer les possibilités d’auto-complétion et c’est donc
la suite logique dans l’ajout de fonctionnalités à melange.

La complétion avec Xtext ressemble assez à l’Outline, il faut faire du polymorphisme sur la méthode ```getScope(EObject object, EReference ref)```
en sous-typant la classe ```AbstractDeclarativeScopeProvider```. Le mécanisme de proposition de complétion est asez simple.
L’appel au ```CompletionProvider```, dans le cadre de mon implémentation, est un appel à un dispatcher qui appelera la bonne
fonction ```getScope(EObject object, EReference ref)``` avec comme EObject, la règle de grammaire dans laquelle se trouve
l’utilisateur, et en EReference sur quel élément terminal précisement.

Par exemple, pour la règle merge expliquée précédement, on va proposer de merge tous les
objets de type ```Language``` présent dans le scope du fichier melange. Pour d’autres fonctionnalités, nous ne voulons
pas proposer n’importe quels éléments du scope. Par exemple, dans le cadre de l’héritage, nous ne voulons pas proposer de
sous-typer notre langage par lui-même, il faut donc restreindre le nombre de choix de complétion possibles.

Pour ce faire, on récupère tous les objets du scope qui ont le type demandé et on applique un filtre. On recontruit ensuite le
scope de scomplétion avec les objets précédements triés.

Menu (W9)
----

La dernière fonctionnalité sur laquelle j'ai travaillé durant ce stage à été une contribution au menu popup. Plus précisement le travail
a consisté à faire apparaitre un sous-menu dans le menu déroulant lorsque l'utilisateur effectue un clique droit sur un fichier d'un langage
défini dans un fichier melange.

Lorsque l'on fait un clique droit sur un de nos fichiers de langage, un sous-menu doit apparaitre et proposer d'ouvrir ce fichier avec l'editeur
de tous les langages dont il hérite. Cette partie a été la plus compliquée de ce stage puisque Eclipse ne permet pas nativement d'ouvrir un fichier
avec nimporte quel éditeur.

Il faut tout d'abord ajouter une contribution au ```popupMenu``` pour créer un menu qui contiendra un nombre de commandes variables,
ce nombre dépendera du nombre de langages dont hérite notre langage courant. On accède au nombre de langages avec les editeurs desquels on
veut ouvrir notre langage courant grace à un registre d'extension melange qui s'occupe de
répertorier les sous-types d'un langage présent dans le fichier melange. Ensuite on créé une commande pour chaque langage. On associe à chaque
commande une Map de trois paramètres avec comme clés (EXACTTYPE, SUBTYPE, EDITORID) avec EXACTTYPE le type du langage courant,
SUBTYPE le type d'un langage sous-type du courant et EDITORID l'id de l'editeur du langage sous-type.

Ensuite j'ai developpé le Handler qui s'occupe de gérer les actions au clique sur une commande. Dans un premier temps, mon idée a été d'utiliser
l'id de l'editeur souhaité pour ouvrir un fichier d'un langage A avec l'éditeur d'un langage B. Malheuresement, ce n'est pas
aussi simple, Eclipse utilise un système d'"Adapters" pour ouvrir un fichier avec un éditeur. Cette classe permet a Eclipse de faire le 
lien entre les concepts du langage et la façon de les représenter. Des adapters sont créés par melange à la compilation et font les 
liens entre les concepts d'un langage et des langages sous-types. Mais ces classes sont complétement hors de portée du plugin, elle sont créées 
durant la compilation du fichier melange et mon Handler fait partie d'un plugin Eclipse.

Pour remédier à tous ces problèmes, il a été décidé d'utiliser les URI melange qui sont de la forme 
```melange:/resource/"chemin_du_fichier à ouvrir"?mt="SOUS_TYPE"```
qui sert à ouvrir un fichier d'un langage selon un modèle donné en paramètre. Cette URI est traitée par une classe spéciale qui 
est censée ouvrir une resource selon un modèle compatible passé en paramètre. Malheuresement cette feature n'était pas 
entièrement terminée durant mon stage et je n'ai eu ni le temps  ni les connaissances
suffisantes à propos du fonctionnement de melange pour pouvoir corriger tous les bugs. Néanmoins, une fois ces bugs corrigés, melange proposera
un système d’ouverture de fichier d’un langage avec l’éditeur d’un sous-type du langage, ce qui est assez inédit.
