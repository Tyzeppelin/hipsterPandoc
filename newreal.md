La réalistaion
==============

Etape 1 : Le CdC et les specs
-----------------------------

### RDV MOA

Expression du besoin :
La MOA voulait pouvoir avoir acces au taux de rupture des differents services du site.
Le taux de rupture c'est le rapport entre le nombre de personne qui ont atteinds la fin du tunnel et le nombre de personne qui ont eu une erreur bloquante (site qui ne reponds pas, un service pas dispo, ...). Le systeme de sondes actuels permettent d'obtenir les informations disponibles. L'affichage sera fait sur un graphique comme suit (inserer une capture de mon joli graphique).
Leur demande portait aussi sur l'affichage du percentile 90 du temps de reponse. Il s'agit en fait de la valeur pour laquelle 90% de l'echantillon est inferieur a cette valeur. Cela resemble à ca (graphique p90). Cet indicateur permet de savoir quand le site / un ou plusieurs serveurs ne sont pas disponible et ainsi determiner si un evt est sporadique ou recurrent.
Le 3e indicateur demendé est la volumetrie d'erreurs. C'est a dire le nombre d'eerurs par jour et par type avec un visualisation plus ou moins detailé (screen des deux volumetries). En croisant ces informations avec le taux de rupture et le temps de reponse, il est possible de trianguler un type d'erreur et potentiellemtn de tracer un bug efficacement grace a un stockage des stacktraces de erreurs.

### Presentation des technologies

#### Java Apache/Tomcat GWT GXT 

Le langage de programmation utilisé par le groupe Arkea/Fortuneo est principalement le Java. La maniere la plus commune d'utiliser Java pour developper des ws c'est d'utiliser la technologie Apache/Tomcat qui est un serveur http qui gere les conteneurs se servlet (?).
Technologie de WebService. CAD ya une classe de service paratgé enter le client et le serveur. Le client fait ses requetes au travers du service. Le serveur route les requetes vers les bonnes servlet (machin qui genere des reponse) (

#### Oracle

Systeme de gestion de base de données relationelles tres courant en entreprise. Utilisé pour des gros volume de données. J'ai acces a une table qui contient entre autre ces infos (plan de la table) (parler un peu de 


Etape 2 : Preparation
---------------------

### Archetype

(Avec un diagramme client/serv/shared)

### Les requetes SQL

Etape 3 : Developpement
-----------------------

### Partie Serveur

La partie serveur est composé de trois partie :
1. Les servlets, qui sert a formatter la reponse à la requete grace à des appels à un ou plusieurs business.
	J'ai choisi d'ecrire une servlet par page pour eviter d'avoir des classes trop grande.
2. Les classes Business, qui servent à faire le lien entre les servlets et la DAO. Dans mon projet il s'agit surtout de mappers qui servent
	à formatter les reponses des appels a la base de données en un format intelligible par le client
3. Les classes DAO\footnote{\label{DAO} Device Access Service ou Object d'accès aux données.} qui sont la pour attaquer differents service, 
	comme par exemple les bases de données, ou un 

### Partie Client


Etape 4 : Les tests
-------------------

### LOL : Tester c'est douter

erreur mon cher.
