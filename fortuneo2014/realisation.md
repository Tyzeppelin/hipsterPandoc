\newpage

LA REALISATION
=============

###L’environnement de travail

Il m’a fallu une semaine pour m’ahabituer à l’environnement de travial.

Il a fallu que je prépare ma machine (en suivant un wiki), c.a.d. vérifier que les bons logiciels etaient présent. 
Cela passe notemment par le logiciel de Gestion de DB (Oracle SQL Developper), l’IDE Java Eclipse et tous ses plugins (Ivy, Ant, ...)
Ensuite il a fallu que j’installe en local des répliques de differentes web Service pour faire fonctionner le site web fortuneo sur ma machine.

Cela m’a permis de bien comprendre comment fonctionnait le site de fortuneo et quels sont les exigences de developpement de l’entreprise.


###La base de données de la QS

L’ancien projet QS stocke ses resultats dans une base de données relationelle fonctionnant sous Oracle Database. Le but des jours suivant 
a été de recuperer des requetes qu’utilisait mon maitre de stage et de les adapter pour obtenir ce que je souahite, c’est à dire
obtenir le nombre de souscription a un type de contrat sur une certain eplage de temps, ou alors le nombre et le pourcentage de gens qui abandonnent
entre deux etapes de souscription.

###Le cahier des charges

C’est a ce moment la que j’ai recu la cahier des charges du projet. Pour avoir une idée de la qualité de service du site fortuneo, il faut présenter
trois indicateurs :
- La volumetrie d’erreurs
- Le taux de rupture, c’est à dire le %age de personnes qui sont arreté dans la sosucription par une erreur
- Le 9e centile du temps de reponse du site.

Tous ces indicateurs devant etre flexible et recuperable pour un intervalle de temps donné et pour un contrat donné.

*(Parler de la reu MOA)*

###La decouverte de GWT et GXT

Apres l’acquisition du cachier des charges qui fixe le resultat attendu, j’ai appris quels technologies j’allais utiliser précisement.

Pour realiser l’IHM, il m’a été donné l’occasion d’utiliser le Google Web Toolkit (GWT), qui est une Framework de developpement Web en Java, au travers d’un autre Framework 
interne à la société arkea qui se nomme Archetype. Archetype permet d’optimiser la création d’une application en automatisant 
le développement de la structure globale de l’application (charte ergonomique, menu, structure des projets...).

GWT est utilisé pour réaliser les principaux conteneurs du site web ainsi que toute la partie serveur. 
La partie serveur est découpée en 3 packages :
- le package Handler, qui s’occupe de recupere les requetes du client et de lui servir un resultat
- le package DAO (Data Access Object), qui s’occupe de recuperer les données qui seront servis au client. Il recupere les données en attaquant un WS ou une DB
- le package Business qui s’occupe de traiter les données du DAO pour les rendre interpretable par le client. Il envoie le resultat du traitement au Handler

*(inserer ici un joli diagramme)*

En ce qui concerne le contenu des pages, cad les données affichés, sont affiché sous forme de tableau et de grpahes grace au Framework Sencha GXT qui permet 
de créer des graphes

*(Parler du rdv avec The Architect)*

###Le probleme des dates

Un des principaux problèmes avec GWT a été la gestion des dates et de leur formattage. La gestion native des dates, en Java, n’est pas thread-safe. C’est a dire que si l’on
appelle le meme formatter de date plusieurs fois simultanement (sur deux thread a la fois par exemple) il est possible que le calcul soit corrompu et que l’on obtienne
des resultats absurdes. Cela pose des problèmes au niveau du server vu que les requetes sont traités parallement, chaque Servlet est dans un thread. (a expliquer)
J’ai du donc créer des classes de formattage ‘thread-safe’ pour le serveur.

De plus pour la partie client, les classes java.util.Calendar ne sont pas transcris en Javascript (du coup expliquer que GWT transcris les classes client en js + css).
Il a fallu donc créer une autre classe de gestion des dates specifiques au package client.

###La realisation

La prise en main de GWT et GXT est plutot simple. Néanmoins la creation des tables et des graphes demande une certaine reflexion.

...



