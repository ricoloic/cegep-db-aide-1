# Exercice BD 1

Un client vous approche pour construire une base de données, qui pourra l'aider à documenter sa clientèle.

Il se trouve que votre client est un dentiste et souhaite créer une base de données pour lui et ses collègues.

La base de données doit :
1. Pouvoir référencer tous les dentistes et leurs hygiénistes
    1. Les dentistes peuvent avoir, au minimum, 1 à plusieurs hygiénistes
    2. Les hygiénistes peuvent être assignés à plusieurs dentistes, mais ne peuvent pas être assignés deux fois au même dentiste
    3. Il nous faudra avoir le prénom, le nom de famille, la date de naissance pour tous les travailleurs
2. Pouvoir référencer tous les clients des dentistes
    1. Un client ne peut avoir qu'un dentiste à la fois
    2. Les rendez-vous des clients
        1. Nous voulons garder un historique de chaque rendez-vous des clients
        2. Pour chaque rendez-vous, il nous faut savoir la date, l'heure, le type de rendez-vous, le dentiste
    3. Pour chaque client, il nous faut savoir le prénom, le nom de famille, la date de naissance, la date à laquelle il s'est inscrit à la clinique dentaire, s'il est fumeur ou non
3. Pouvoir référencer toutes les factures du client
    1. Une facture doit avoir un client et un client peut avoir plusieurs factures
    2. Une facture doit pouvoir être assignée à un ou plusieurs rendez-vous, mais ne l'est pas forcément
    3. Pour chaque facture, il nous faut savoir le type de paiement, la date de facturation

## Conceptuelle

Votre client vous demande de lui faire un schéma conceptuel et de valider avec lui avant de continuer. Il se peut que le client rajoute des demandes rendu là.

Vous êtes demandé de faire toutes modifications demandées par le client et de revalider avec lui après coup.

## Logique

Après la confirmation de votre schéma conceptuel par votre client. Vous décidez de construire le schéma logique à partir de votre schéma conceptuel.

Le schéma logique pourra être fait en texte et/ou visuel (diagramme).

## Création BD SQL

Une fois le schéma logique complété, vous commencez donc à implémenter (créer) la base de données qui fera sujet à être remise à votre client.

Pour la remise du projet, votre client vous demande de suivre certaines consignes :
1. Le nom de la base de données doit être exactement : dentisterie_management_service
2. Le nom de toutes les tables de cette base de données doivent suivre le format suivant :
    1. Le nom d'une table ne doit pas contenir de lettre majuscule
    2. Le nom d'une table, si composé de plusieurs mots, doivent être séparés par des "_"
    3. Le nom d'une table ne doit pas contenir de chiffre/nombre
    4. Le nom d'une table ne doit pas commencer ou terminer par un caractère autre qu'une lettre de l'alphabet
    5. Exemple de nom de table : exemple_nom_table
3. Le nom de toutes les colonnes des tables doivent suivre le même format que celui des noms de table
4. Il vous faut aussi garder une copie du script SQL que vous avez utilisé pour créer cette dernière

Après création de la base de données, ses tables et ses colonnes, vous êtes demandé d'aller voir le client pour la remise du projet.

Il se peut que certaines modifications soient demandées par le client.

## Queries

Pour cet exercice, le client ne vous a pas directement contacté pour créer la base de données, mais il vous arrive avec une base de données qui existe déjà.

Il vous fournit donc un "snippet" SQL comme exemple de sa base de données. (snippet.sql)

1. Il vous faudra exécuter le script SQL fourni, ce qui créera une base de données, ses tables et insérera des données (tout cela dans votre environnement local)
2. Il vous demande de créer les requêtes SQL qui se trouvent dans le fichier (requetes.sql)

_IMPORTANT_ - Les requêtes doivent être exécutées sur la base de données fournie par le client, sans changer la BD.

Le document _correction.sql_ contient les corrections des requêtes SQL, mais il faut garder en tête que ce n'est pas parce que les requêtes sont faites différemment de celles que vous avez, que vous n'avez pas bien compris. Pour vous corriger, vous pouvez toujours copier les requêtes qui se trouvent dans le fichier de correction pour valider que les résultats de vos requêtes et celle de la correction donnent le même résultat.



