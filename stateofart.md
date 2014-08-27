Présentation du sujet
=====================

## Ce qui existait

La qualité de service c'est l'avenir.

> Le projet QS de Fortuneo a pour but de pouvoir mesurer de manière objective le niveau de qualité de service sur les aspects applicatifs, 
> de manière exhaustive, et non plus se mettre en attente de remontés potentielles de nos prospects/clients lors de ces incidents


Le projet répond donc aux besoins suivants :

-   Superviser en temps réel la production de manière automatique afin de s’assurer que 
    toute la chaîne de souscription est disponible de bout en bout ;
-   Remonter en temps réel à la production les indisponibilités des services supervisés ;
-   Alerter rapidement (temps réel) de manière automatique, et à partir d’un certain seuil, 
    l’assistance Fortuneo afin de  communiquer, au Service Clients et au Service Commercial, 
    l’indisponibilité ou la sous exposition d’une souscription ;
-   Générer des rapports (quotidien, hebdomadaire, mensuel) sur les indisponibilités des services et sur le parcours utilisateur ;
-   Remonter les informations des prospects lors d’une anomalie à destination du Service Commercial.

Pour ce faire, plusieurs outils/applications ont été développées :

-   Sonde souscription client CCO et le batch de suppression des éléments créé par la souscription ;
-   Outil de génération d’erreur dans l’environnement de recette ;
-   Ajout des événements dans les applications Fortuneo ;
-   Consommation des événements : FortuneoQsConsumer.

## La où j’entre en jeu

Le système de supervision de la QS fonctionne très bien et a permis de corriger un nombre important de problème au sein de la souscription.
Cependant, le principal soucis du service actuel est que les résultat de l’analyse des sondes est stockés dans une base de donnée relationnelle,
ce qui pose des soucis d’accessibilité pour les services (la Maitrise d’Ouvrage notamment) qui ne sont pas forcement capable d’aller effectuer
des appels en base complexes pour aller recuperer les données qu’is souhaitent. Le traitement des données demande trop de travail et le volume de donnée est
assez immportant, le travail des données sous excel n’est pas efficace

Mon but est alors de réaliser une Interface Homme-Machine sous la forme d’une Application Web qui permettrait d’afficher differents indicateurs de la qualité
de service sous la forme de tableaux et de graphiques dynamiques.
