Réalisation
===========

Outline
-------

Une des premiere fonctionnalité d’Eclipse sur laquelle j’ai travaillé été l’outline (fig 1.2).
Il s’agit d’un panneau qui permet, dans notre cas,  l’affichage de l’arbre syntaxique (du model?) de nos languages

Eclipse RCP propose, avec les outils de generation d’EMF de creer une outline minimale qui affiche l’arbre syntaxique
des languages. Le problème c’est que l’on aimerait bien afficher des informations supplémentaires sur cet arbre, notamment
les types des langages, et donc leur hiérarchie, ainsi que les “aspects” de ces langages.

Le principe est assez simple, il suffit d’étendre la classe qui créé l’arbre pour créer nos propres branches et feuilles
dans l’abre qui représente les principales feature du langage. Il est intéressant de noter que la classe de base qui s’occupe
de la création de l’arbre, ```DefaultOutlineTreeProvider```, utilise principalement les deux méthodes:
 ```createNode(IOutlineNode parent, org.eclipse.emf.ecore.EObject modelElement) ``` et
```_isLeaf(org.eclipse.emf.ecore.EObject modelElement) ``` qui sont des dispatchers dynamiques qui sont capables de
“choisir” la bonne implémentation de la méthode en fonction du type du ```modelElement```. Mon travail a don été dans un premier
temps de sous-typer ces fonctions dans le but de créer mes propres branches de l’arbre.

Par la suite, le travail a été de créer des provisionneurs de labels pour afficher correctement les éléments du langage dans l’abre
avec leurs types associés.

Hyperlink
---------

Une feature extrémement pratique de la plateforme Eclipse est l’hyperlinking qui permet, au ctrl+click (ou F3) sur un nom qualifié
d’afficher la définition du-dit qualifié. Par exemple lorsque l’on “ctrl+click” sur un appel à une méthode, Eclipse nous affiche
la définition de la méthode.

Le problème est que le mécanisme d’hyperliens ne permet de sauter qu’à la définition que de noms qualifiés,
il ne permet de suivre d’URI Eclipse qui sont situés dans une chaine de caractère notamment. La grammaire de melange
possède la règele de grammaire ```’syntax’ EcoreURI = STRING``` qui permet de référencer l’URI du metamodel du
langage que l’on essaye d’importer. Il peut être pratique de pouvoir naviguer facilement vers ce métamodèle vie l’URI
fournie et pour cela il faut modifier le comportement du système d’hyperlien de Eclipse.

Etant donné que la feature hyperlien de melange a été généré par xtext, nous avons simplement redéfini le comportement
de la méthode ```createHyperlinkByOffset(XtextRessource resource, int offset, IHyperLInkAccpetor acceptor)``` qui, dans le
cas où la resource visé est notre élément “EcoreURI”, créé un hyperlien vers le métamodèle et dans le cas contraire
suit le comportement par défaut de création d’hyperlien.

Grammaire et metamodel
----------------------

Pour continuer plus loin dans l’ajout de fonctionnalités à l’éditeur melange, il a fallut revoir la grammaire et le
métamodèle de melange.

Le principal problème rencontré lors du développement de fonctionnalités comme la complétion automatique a été un problème
de grammaire. Un exemple, la fonction de merge de melange dont la syntaxe suit la règle de grammaire ```Merge returns merge: ’merge’ mergedLanguage = STRING ;```
ne permet pas d’effectuer de complétion automatique puisque xtext ne propose pas de mécanisme de complétion pour
des objets de type STRING. Or les seuls objets qui peuvent être merge sont des objets de type ```Language```. On peut donc réécrire
la précédente règle de grammaire en ```Merge returns merge: ‘merge’ mergeLanguage = [Language | QualifiedName]``` qui permet, en plus
d’accéder aux mécanismes de complétion integrés à Xtext, d’avoir une vérification de type directement das l’éditeur et non plus
uniquement à la compilation. Cette modification de la grammaire va evidemment de pair avec la mise à jour du métamodèle du
langage, en ajoutant un lien de composition entre la classe Merge et le type Language.

Le passage des STRING aux noms qualifiés dans la grammaire de melange a permis d’ajouter une véritable vérification des types
qui facilite l’édition des fichiers melange, ainsi qu’améliore l’auto-complétion par défaut d’Xtext qui era d’ailleurs la prochaine étape
de développement.

Scope
-----

Comme expliqué précedement, la modification de la grammaire melange a permis d’améliorer les possibilités d’auto-complétion et c’est donc
la suite logique dans l’ajout de fonctionnalités à melange.

La complétion avec Xtext ressemble assez à l’Outline, il faut faire du polymorphisme sur la méthode ```getScope(EObject object, EReference ref)```
en sous-typant la classe ```AbstractDeclarativeScopeProvider```. Le mécanisme de proposition de complétion est asez simple.
L’appel au ```CompletionProvider```, dans le cadre de mon implémentation, est un appel à un dispatcher qui appelera la bonne
fonction ```getScope(...)``` avec comme EObject, la règle de grammaire dans laquelle se trouve l’utilisateur, et en EReference
sur quel élément terminal précisement.

Par exemple, pour la règle merge expliqué précedement, on va proposé de merge tous les
objets de type ```Language``` présent dans le scope du fichier melange. Pour d’autres fonctionnalités, nous ne voulons
pas proposer n’importe quel élément du scope. Par exemple, dans le cadre de l’héritage, nous ne voulons pas proposer de
sous-typer notre langage par lui-même, il faut donc restreindre le nombre de choix de coplétion possible.

Menu (W9)
----

This is gonna be tough to explain.

On, efin thomas :p, voulais pouvoir ouvrir un fichier d’un language avec tous les editeurs de ses languages sous types. Et ca eclipse veut pas.
Mais alors pas du tout.
Du coup j’ai fait le menu qui est capable d’afficher tous les editeurs dispo (petit screen du menu) mais il y a toujours un probleme a l’ouverture.


