# cra-econocom

## Get start:

Installer docker et docker-compose sur votre machine, ensuite il vous faut vous placer dans le répertoir du docker-compose et executer les commandes pour télécharger et monter les image du docker-compose:

```bash
docker-compose pull
docker-compose up
```

Une fois ces étapes effectué vous pouvez executer les différents script pour créer le schéma, les procédures et ensuite les rôle que l'on doit allouer à postgrest.

Pour entrer en ligne de commande dans le conteneur il vous faut executer cette commande:
```bash
docker <containeur-id> exec -it bash
```

Connecté vous à la base avec la commande:
```bash
psql -d app_db -U app_user
```

Vous pouvez ensuite executer les scripts présents dans le dossier database de se répetoire git.

Relancer le docker-compose avec la commande:
```bash
docker-compose restart
```

## Projet:

L'application est une application de suivis d'activité.

L'objectif est de permettre à un utilisateur de saisir ses activités après s'être connecté.
On pourra avoir un récapitulatif des activité des différents utilisateur.

## Modèle de données:

Voici un modèle de données qui pourrait correspondre à ce besoin:
https://dbdiagram.io/d/61d80103f8370f0a2ee1c30e

Il est composé de trois tables une pour les utilisateurs, une pour les différentes tâches, 
et une qui représente les tâches effectuer par un utilisateur et la durée de celle-ci.

Un travail effectué peut avoir un parent, par exemple si un utilisateur à travailler sur une user stories pendant deux jours il peut avoir travailler sur deux tâches dépendantes de la user story.

## Déployer avec Docker:

Dans un premier temps installer docker et docker-compose sur votre machine.

Ensuite chager les images de votre docker-compose avec la commande:
```bash
docker-compose pull
```

Monter vos images docker: 
```bash
docker-compose up
```

Vous devez ensuite entrer dans votre le conteneur de la base de données pour executer le script de la base.

Vous pouvez utiliser cette commande:
```bash
docker <containeur-id> exec -it bash
```

Connecté vous à la base avec la commande:
```bash
psql -d app_db -U app_user
```

Executer le script et redémarrer votre docker-compose:

```bash
docker-compose restart
```
