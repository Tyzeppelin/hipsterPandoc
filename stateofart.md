Présentation du sujet
=====================

## Le projet de la QS

Courant 2013, Fortuneo a intié un projet sur la qualité du service de la souscription en ligne. Le projet avait pour but de :

> *pouvoir mesurer de manière objective le niveau de qualité de service sur les aspects applicatifs, 
> de manière exhaustive, et non plus se mettre en attente de remontés potentielles de nos prospects/clients lors de ces incidents*

Le projet a été réalisé de manière à répondre aux besoins suivant:

-   Superviser en temps réel la production de manière automatique afin de s’assurer que 
    toute la chaîne de souscription est disponible de bout en bout
-   Remonter en temps réel à la production les indisponibilités des services supervisés
-   Alerter rapidement (temps réel) de manière automatique, et à partir d’un certain seuil, 
    l’assistance Fortuneo afin de  communiquer, au Service Clients et au Service Commercial, 
    l’indisponibilité ou la sous exposition d’une souscription
-   Générer des rapports (quotidien, hebdomadaire, mensuel) sur les indisponibilités des services et sur le parcours utilisateur
-   Remonter les informations des prospects lors d’une anomalie à destination du Service Commercial.

Pour ce faire, plusieurs outils et applications ont été développées. Notamment une sonde qui teste le parcours client régulierement,
ce qui permet d'avoir des informations régulières sur la disponibilté de la chaine de souscription. Pour pouvoir
référencer les différents événements du parcours d'un utilisateurs, il a fallu aussi mettre en place des outils qui répertorient 
l'integralité du parcours de l'utilisateur afin de savoir si son parcours s'est bien déroulé ou si une erreur est servenue et à quel moment.
Toutes les données sont déversés dans une table d'une base de donnée Oracle. 
Pour exploiter les resultat, il a été mis en place un système de rapports (annexe \ref{BO}) qui permet d'obtenir le nombre d'abandons entre deux 
étapes de souscriptions. L'abandon est du, soit à un l'arret de la souscription par le prospect, soit à une erreur fonctionelle.

## Là où j’entre en jeu

Le système de supervision de la QS fonctionne très bien et a permis de corriger plusieurs problèmes au sein du processus de souscription.
Cependant, le principal soucis de la solution actuel est l'accessibilité des résultats. Les rapports qui sont générés était trop peu lisible,
assez lourd et ne proposait que de visualiser le taux d'attrition (ou d'abandon). 
Pour obtenir d'autre indicateurs, comme la répartition des erreurs au court du temps en fonction des types d'erreurs, 
la MOA devait faire une requete SQL puis un traitement du résultat dans un tableur (comme Excel). 
L'utilisation d'un tableaur Excel pour traiter un aussi grand volume de données (~ 400 000 lignes pour le mois de Janvier 2014) n'est pas
efficace, et créer des graphiques et des tableaux récapitulatifs peut être très long.

Mon but est alors de réaliser une Interface Homme-Machine sous la forme d’une Application Web qui permettrait d’afficher les differents indicateurs de la qualité
de service sous la forme de tableaux et de graphiques dynamiques.
