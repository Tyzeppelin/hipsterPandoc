La réalistaion
==============

Etape 1 : Le Cahier des Charges et les spécifications
-----------------------------------------------------

### L'expression du besoin par la MOA

La MOA souhaitait avoir acces à trois grands indicateurs de la qualité de service:

1. La volumetrie d'erreurs
1. La taux de rupture de souscription
1. Le percentile 90 du temps de réponse utilisateur

Tous ces indicateurs devant pouvoir être visualisés sur des périodes de temps variables. Par exemple, pouvoir voir
l'évolution d'un indicateur sur un an avec un pas de un mois, sur un mois avec un pas d'une journée, et sur une journée
avec un pas de 15 minutes. Il devait aussi y avoir une fonctionnalité pour réduire les résultats à un ou plusieurs contrats
spécifiques pour augmenter la précision de l’analyse des indicateurs.

Le premier indicateur: la volumétrie. Elle correspond au volume d'erreurs sur une période de temps 
donné. Il permet de cibler des pics d'indisponibilité et de cibler par la même occasion quel
service était indisponible, cela permet de gagner du temps dans l'exploitation des logs du service en question.

Le second indicateur: le taux de rupture. C’est le rapport entre le nombre de personnes qui ont atteind la fin 
du tunnel de souscription et le nombre de personnes qui ont eu une erreur bloquante (site qui ne reponds 
pas, un service indisponible, ...). Cet indicateur est indépendant de l'abandon "conscient" de l'utilisateur. 

Le troisième indicateur: le percentile 90 du temps de reponse utilisateur. 
Il s'agit de la valeur pour laquelle 90% des temps de réponse de l'echantillon d'utilisateurs est inferieure à cette valeur. 
Cet indicateur permet de savoir le moment où le site est surchargé et si cette surcharge est 
récurrente ou simplement sporadique.

### Presentation des technologies

\begin{figure}[h!]
\begin {center}
	\caption{\label{GWT} Schematisation de GWT}
	\includegraphics[scale=0.4]{fig/shared.png}
\end{center}
\end{figure}	

#### Java 

Le langage de programmation utilisé par le groupe Arkea/Fortuneo pour développer ses applications est principalement le Java. 
Pour développer une application qui sera déployée sur un serveur Java, j'ai du utiliser le 
framework\footnote{\label{framework} Framework : Ensemble cohérent de composants logiciels structurels, qui sert à créer les fondations ainsi que les grandes lignes d'un logiciel.}
GWT (Figure \ref{GWT} ), développé par Google. Ce framework demande de séparer le projet en trois parties, la partie serveur, la partie client 
et une troisième partie partagée par le client et le serveur que l'on nommera "Shared". 
Le framework est livré avec un outil qui se charge de traduire la partie client en JavaScript, HTML et CSS pour être interprétée par un 
navigateur web. Il va aussi compiler la partie serveur en java pour être executé par le serveur. Il va aussi compiler la 
partie Shared à la fois en Javascript et en java pour pouvoir être interpreté par les deux entités Client et Serveur.



#### Oracle

La table qui contient les informations qui me permettront de calculer les différents indicateurs
demandés par la MOA est stockée dans une base de donnée relationelle gérée par un moteur Oracle. Ce gestionnaire de base de données
est beaucoup utilisé dans les grandes entreprises notamment parce qu'il est très efficace pour traiter des données volumineuses.
Oracle Database est aussi intéressant puisqu'il possède de nombreux outils pour s'interfacer du code, Java notamment.

\newpage

Etape 2 : Préparation
---------------------

### Archétypes

La première difficulté de ce stage est venue du framework de développement. Pour cette application, j'ai dû utiliser
un framework du nom de Archétypes, qui est le framework GWT auquel a été greffé la charte graphique du groupe
Crédit Mutuel Arkéa. Puisque la charte graphique est déjà integrée, le developpeur possède plus de temps pour se concentrer 
sur le reste du code et ne passse pas trop de temps a s'occuper du design.

Néanmoins, il a été assez difficile de prendre complètement en main ce framework car il est fourni avec une 
documentation très réduite, il faut aller chercher les noms et le fonctionnement des méthodes "à la main" dans le code déjà généré.
Il s’agit d’une étape assez longue mais qui montre l'intérêt de documenter le code.

### Les requêtes SQL

La deuxième partie du travail effectué en amont du développement a été de préparer les requêtes qui allaient être utilisées
pour attaquer la base de données. La table est stockée dans une base de données relationelle et les requêtes sont écritent
en langage sql. L'écriture des  a m'a toutefois permis d'aprendre à maitriser des fonctions
sql/oracle comme la fonction *PERCENTILE_DISC* qui permet de récupérer le n-ième centile d'un champ d'une requête. Ces fonctions sont
très pratiques car le traitement de plusieurs centaines de miliers de lignes est plus efficace sur le serveur au moment de la 
requête plutôt que dans l'application. 

\newpage

Etape 3 : Développement
-----------------------

### Partie Serveur

La partie serveur, schematisée par la figure \ref{server} est composée de trois parties :

1. Les servlets, qui servent à formatter la réponse à la requête grâce à des appels à un ou plusieurs business.
	J'ai choisi d'écrire une servlet par page pour améliorer la lisibilité du code.
2. Les classes Business, qui servent à faire le lien entre les servlets et les classes de DAO. Dans mon projet il s'agit surtout de mappers qui servent
	à formatter les réponses des appels à la base de données en un format intelligible par le client.
3. Les classes de DAO\footnote{\label{DAO} Device Access Service ou Objet d'Accès aux Données.} sont les classes qui contienent les accesseurs
	permettant d'attaquer differents services comme, dans mon projet, une base de données.

Découper la partie serveur en trois packages permet de bien séparer les diferentes operations, d'avoir un programme structuré et donc d'ameliorer
les phases de debug et de maintenance. La gestion rigoureuse des exceptions et des logs côté serveur permet aussi d’améliorer les phases
de debug.

\begin{figure}
\begin {center}
	\caption{\label{server} Schematisation de la partie serveur}
	\includegraphics[scale=0.4]{fig/serveur.png}
\end{center}
\end{figure}

Le rôle des servlets est de recevoir la requête ainsi que les paramètres de celle-ci pour appeler
la bonne classe Business et de renvoyer la réponse appropriée au client. La Servlet reçoit la requête par 
l'intermédiaire d'une classe nommée \texttt{ServletMapping} qui est un mapper qui fait le lien entre les url et les servlets associés.

Les classes Business quand à elles, servent à formatter les appels aux classes DAO pour 
qu'ils soient envoyées au Client par les Servlets. Dans mon cas il s'agissait pricipalement de transfomer des 
résultat de requêtes SQL en une table de hachage compréhensible par le Client. Les retours des requêtes SQL sont sous
la forme d'une liste Java qui contient des \texttt{Map}. Chaque \texttt{Map} contient une ligne du résultat de la requete SQL. Il
faut donc extraire les informations de cette \texttt{Map} et les trier pour pouvoir les exploiter dans la partie client.

La dernière partie du Serveur sont les classes de DAO. Il s'agit des classes qui font les appels à des services externes comme par exemple
un WebService externe ou une base de donnée. Dans mon cas, ces classes servent à effectuer les requêtes SQL
et à retourner le résultat de ces requêtes à la classe business qui l’apelle.
Les informations relatives à la connexion à la base de donnée (adresse du serveur, identifiants, pool de connexions, ...) 
sont stockés dans un fichier de configuration au format XML. Au lancement du serveur, un pool de connexion est créé et est géré par un 
driver Oracle qui utilise les connexions pour faire les appels à la base de donnée.

### Partie Client

Etant donné que j'utilise le Framework Archétype, je dispose déjà d'un système de gestion des pages, 
d'un menu à remplir avec mes nouvelles pages et de la charte graphique interne. Il me reste donc a développer les pages
en elles même et les appels aux Servlet.

La partie client se compose de deux grands blocs et d'un bus d'événements. Il y a les pages, représentées par des
'*Workbenches*' qui sont des widgets et qui sont affichées dans la partie centrale du '*mainWidget*' qui est en fait l'implementation de la charte graphique. 
Le changement de workbenches se fait au clique dans le menu, il y a seulement la partie centrale (le Workbench) qui est mis a jour.

Pour visualiser les 3 indicateurs demandés, il a été choisi de faire 6 pages. 

La première page (Annexe \ref{volum}) est celle contenant le graphique de la volumétrie d'erreur. Il s'agit simplement d'un graphique 
avec en abscisse les dates et en ordonnée le nombre d'erreurs. L'utilisateur a aussi la possibilité de naviguer au sein du graphique. C'est à 
dire, lorsque l'on visualise la volumétrie par tranche d'un mois, le clique sur le mois permet d'avoir le graphe détaillé sur la journée. Et le clique sur 
une journée amène à la page n°5 qui affiche tous les messages d'erreurs de la journée selectionnée.
Il est aussi possible de filtrer les erreurs pour avoir des résultats plus précis.

La seconde page (Annexe \ref{volumd}) est une version détailléie de la première. Les erreurs sont, cette fois ci, affichées dans un tableau qui les trie par date et 
par type d'erreurs. La lecture du tableau n'étant pas très facile, il m' été demandé de pouvoir exporter les résultats au format csv via un bouton. Les données au
format csv pouvant être ensuite traitées par un tableur.

La troisième page (Annexe \ref{rupture}) représente le taux de rupture de souscription du site. Il s'agit de la page la plus attendue car elle permet d'avoir 
une vision d'ensemble de l'évolution de la qualité de service des tunnels de souscriptions. Comme pour la première page, ce graphique permet, au clic, de passer
d'une visualisation par mois à une visualisation par jour et à une visualisation par quart d'heures.
La taux de rupture (en vert) est le rapport entre le nombre de souscriptions (en bleu),et le nombre de ruptures (en rouge). La moyenne de ce taux est représenté par
une ligne rose.

La quatrième page (Annexe \ref{temps}) représente le percentile 90 du temps de réponse utilisateurs. Il s'agit de la valeur pour laquelle 90% des 
utilisateurs ont un temps de chargement de la page inférieure à cette valeur. Il est représenté par une ligne bleu, la moyenne de ce percentile
est représenté par la ligne rose. Comme les pages 1 et 3, un clique sur la courbe bleu permet une visualisation sur un intervalle plus fin.

La cinquième page (Annexe \ref{messages}) affiche sous la forme d'un tableau le récapitulatif des erreurs d'une journée. 
A la différence de la version detaillée de la volumétrie, cette page affiche aussi le message d'erreur généré au moment de l'erreur. 
Cette page est pratique pour identifier précisement la classe qui a causé l'erreur et voir si cette erreur est récurrente ou pas.

Il y a aussi une sixième (Annexe \ref{recap}) page qui sert de rappel des différents codes d'erreurs. Les erreurs sont stockées dans la base de données avec un code unique en 
fonction du service qui a causé l'erreur. Il est intéressant de pouvoir avoir à disposition la signification de ces "*codes d'erreurs*".

Au fur et a mesure du dévelopement, on m'a proposé quelques idées d'amélioration, comme par exemple l'ajout d'un "moteur de recherche" 
commun à toute les pages qui permet de factoriser le code et aussi permet à l'utilisateur de ne pas avoir à rentrer plusieurs fois les mêmes critères de recherches lorsqu’il change de page.
Le moteur de recherche se compose de deux champs de dates pour définir les bornes de la recherche, un menu déroulant pour choisir le pas de visualisation (ex: Mensuel, Journalier, ...),
et deux autres menus déroulants pour définir sur quels contrats faire la recherche. 
Pour les pages 1 et 5, j'ai ajouté un autre menu déroulant pour pouvoir choisir précisement quels types d'erreurs afficher.
