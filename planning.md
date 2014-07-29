\newpage

LE PLANNING
===========

###Etude

####Semaine 1

1. Mise en place de l’env de travail
2. Deploiement du site en local
3. Creation d’un premier projet de test
1. Retrospective sur l’ancien projet de QS
2. Recuperation et forgeage de requetes SQL
3. Reunion avec la MOA pour le le CDC

###Analyse fonctionelle

####Semaine 4

1. Apprentissage chargemement XML. Chargement de fichiers xml pour jdbcTemplate
2. Ecriture d’un mapper pour transformer un res de req en res intelligible
3. geenreation d’un csv pour l’attrition
4. Premiers affichage grace a une servlet et une jsp
5. Recuperation d’un rapport QS

####Semaine 3

1. Stats pour recuperer le 9e centile
2. Reunion avec l’architecte pour les technos utilisés (Archettpe/GWT + GXT)
3. Recuperation du Framework Archetype
4. Creation de la premiere appli Archetype
5. Importation des classes du projet de test

##Codage

####Seamine 4

1. Modèle de conversation Task/Servlet via un Service focntionne
2. Creation des premiers ‘Workbenches’, objet specifique a Archetype qui s’apparente a un Widget mais en mieux
3. Affichage du premier tableaux de données qui affiche le nombre d’erreurs.
4. Codage du premier graphique. Une courbe. Vraiment laborieux.
5. Premier gros problème avec les dates. Les calendriers java ne sont pas traduis en JS.
6. fin de la semaine sur un GROS probleme de dates du au caractere non thread-safe de la bibliotheque de parsing des dates

####Semaine 5

1. Le systeme de CAS pose probleme. Le CAS vers lequel pointait mon appli etait en maintenance. Changement de cible pour mon appel CAS.
2. Correction du probleme des dates server. Ecriture d’une version thread-safe des parser de dates.
3. Implementation de nouvelles feature dans le choix des données a afficher (intervalle de temps (journalier, mensuel), type de contrat (CCO, ASS_VIE, ...))
4. Ajout du graphique principal qui affiche le nombre de souscriptions, le nombre de ruptures et le taux de rupture
5. Codage d’un widget de recherche mutualisé : Le meme widget devra etre présent sur toutes les pages.
6. Probleme du au fait qu’un Widget GWT ne peut avoir qu’un seul parent. Il faut le decharger de chaque page a chaque changement de page.
7. Travail sur la comprehension du fonctionnement du chargement/refresh/dechargeemnt des differentes page.
8. Trouvé une methode onRefresh() pour chaque workbench qui permet de decharget le widget de recherche a chaque changement de page
9. Vendredi 11h, appli fonctionelle.

####Semaine 6

1. Corrections de bugs
2. Debut d’ecriture du rapport de stage
