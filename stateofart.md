Présentation du sujet
=====================

## Le projet de la QS

Courant 2013, Fortuneo a intié un projet sur la qualité du service de leur souscription en ligne. Le projet avait pour but de :

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
Pour exploiter les resultat, il a été mis en place un système de rapports (Annexe \ref{BO}) qui permet d'obtenir le nombre d'abandons entre deux 
étapes de souscriptions. L'abandon est du, soit à un l'arrêt de la souscription par le prospect, soit à une erreur fonctionelle.

## La mission qui m’a été confié

Le système de supervision de la QS fonctionne très bien et a permis de corriger plusieurs problèmes au sein du processus de souscription.
Cependant, le principal soucis de la solution actuelle est l'accessibilité aux résultats. Les rapports qui étaient générés étaient trop peu lisible,
assez lourds et ne proposaient que de visualiser le taux d'attrition (ou d'abandon).
Pour obtenir d'autres indicateurs, comme la répartition des erreurs au court du temps en fonction des types d'erreurs, 
la MOA devait faire une requête SQL puis un traitement du résultat dans un tableur (comme par exemple Microsoft Excel). 
L'utilisation d'un tableaur tel que Excel pour traiter un aussi grand volume de données (~ 400 000 lignes pour le mois de Janvier 2014) n'est pas
efficace, et créer des graphiques et des tableaux récapitulatifs s’averait très long.

Ma mission est alors de réaliser une Interface Homme-Machine sous la forme d’une Application Web qui permettrait d’afficher les differents indicateurs de la qualité
de service sous la forme de tableaux et de graphiques dynamiques.
