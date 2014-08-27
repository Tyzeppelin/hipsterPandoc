La réalistaion
==============

Etape 1 : Le CdC et les specs
-----------------------------

### RDV MOA

Expression du besoin :
La MOA voulait pouvoir avoir acces au taux de rupture des differents services du site.
Le taux de rupture c'est le rapport entre le nombre de personne qui ont atteinds la fin 
du tunnel et le nombre de personne qui ont eu une erreur bloquante (site qui ne reponds 
pas, un service pas dispo, ...). Le systeme de sondes actuels permettent d'obtenir les 
informations disponibles. L'affichage sera fait sur un graphique comme suit (inserer une capture de mon joli graphique).

Leur demande portait aussi sur l'affichage du percentile 90 du temps de reponse. 
Il s'agit en fait de la valeur pour laquelle 90% de l'echantillon est inferieur a cette valeur. 
Cela resemble à ca (graphique p90). Cet indicateur permet de savoir quand 
le site / un ou plusieurs serveurs ne sont pas disponible et ainsi determiner 
si un evt est sporadique ou recurrent.

Le 3e indicateur demendé est la volumetrie d'erreurs. C'est a dire le nombre d'eerurs par jour 
et par type avec un visualisation plus ou moins detailé (screen des deux volumetries). 
En croisant ces informations avec le taux de rupture et le temps de reponse, 
il est possible de trianguler un type d'erreur et potentiellemtn de tracer un bug efficacement grace a un stockage des stacktraces de erreurs.

### Presentation des technologies

#### Java Apache/Tomcat GWT GXT 

Le langage de programmation utilisé par le groupe Arkea/Fortuneo est principalement le Java. 
La maniere la plus commune d'utiliser Java pour developper des ws c'est d'utiliser la technologie 
Apache/Tomcat qui est un serveur http qui gere les conteneurs se servlet (?).
Technologie de WebService. CAD ya une classe de service paratgé enter le client et le serveur. 
Le client fait ses requetes au travers du service. Le serveur route les requetes vers les bonnes servlet (machin qui genere des reponse) (

#### Oracle

Systeme de gestion de base de données relationelles tres courant en entreprise. 
Utilisé pour des gros volume de données. J'ai acces a une table qui contient entre autre ces infos (plan de la table) (parler un peu de 


Etape 2 : Preparation
---------------------

### Archetype

(Avec un diagramme client/serv/shared)

### Les requetes SQL

Un autre travail important qu'il a fallut effectuer en amont du développement a été de préparer les requetes qui allaient etre utilisés
pour attaquer la base de données des evenements. La table etait stocké dans une base de données relationelle et les requetes sont ecritent
en langage sql (avec des fonction. en plus), c'a n'a as été trop complexe. Ca m'a toutefois permis d'aprendre a maitriser des fonctions
sql/oracle comme la fonction percentil qui permet de recupere le 90e centile d'un champ d'une requete. Cela permettra a mon programme d'economiser 
le traitement de plus de 300 000 données dans le cas du calcul du percentil pour chaque jour d'un mois.

Etape 3 : Developpement
-----------------------

### Partie Serveur

La partie serveur est composé de trois partie :
1. Les servlets, qui sert a formatter la reponse à la requete grace à des appels à un ou plusieurs business.
	J'ai choisi d'ecrire une servlet par page pour eviter d'avoir des classes trop grande.
2. Les classes Business, qui servent à faire le lien entre les servlets et la DAO. Dans mon projet il s'agit surtout de mappers qui servent
	à formatter les reponses des appels a la base de données en un format intelligible par le client
3. Les classes DAO\footnote{\label{DAO} Device Access Service ou Object d'accès aux données.} qui sont la pour attaquer differents service, 
	comme, dans mon projet, une base de données.
	
Découper la partie serveur en troi spackage permet de bien séparer les diferentes operations, d'avoir un programme structuré et donc d'ameliorer
les phases de debug et de maintenance. Cela passe aussi par une rigueur dans la  gestion des exceptions et des logs. 

### Partie Client

J'utilisais un framework interne qui rajoute une couche (d'objets?) à GWT. Je disposai donc déjà d'un
système de gestion des pages, d'un menu à remplir au besoin et d'une suite d'événements qui permettent 
de jongler avec les pages comme un clowns avec des bolas.

La partie client se compose de deux grands blocs et d'un bus d'evt. Il y a les pages, représentés par des
'Workbenches' qui sont des widgets et qui sont affichés dans le "mainWidget" qui est en fait la charte graphique,
le menu et le workbenches. Le changement de workbenches se fait au clique dans le menu (ou au chgt d'url), il y a 
seulement la partie centrale (le WB) qui est mis a jour.
(avoir une figure avec les differents morceaux du taux de rupture)

Pour visualiser les 3 indicateurs demandé, il a été choisi de faire 5 pages. 1 contenant un tableau avec le nombre d'erreurs par type et par intervalle de temps, 
un autre contenant un graphique avec 3 series, deux series en batons representant respectivmeent le nombre de souscriptions (en bleu) et le nombre de ruptures (en rouge), 
et enfin un dernier graphiqeu avec deux courbes, une representant le percentile 90 du temps de reponse et la moyenne du p90 sur le graphique.

Au fur et a mesure du developement, on a recu des idées d'amelioration et d'ajout, comme un grpahique qui puisse representer l'evol du nombre
d'erreurs au cours du temps, ainsi que pouvoir exporter le tableau recap des erreurs (fig n) sous le format csv (ajout d'un bouton).

Par la suite on a ajouté 


Etape 4 : Les tests
-------------------

### LOL : Tester c'est douter

MOA G SUI TRO 1 OUFZOR DU COD É G PA BESO1 D TEST LOL XD
*pan*
