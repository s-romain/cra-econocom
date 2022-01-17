# cra-econocom

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

## Requêtes http:

Se référer à la documentation Postgrest: https://postgrest.org/

Je vais détailler ici les requêtes à faire à postgrest pour récupérer les informations nécessaire au fonctionnalité de l'application.

### Requête pour trouver une utilisateur en fonction de son login et password:

GET:
```HTTP
http://localhost:3000/accounts?login_account=eq.root&&password_account=eq.root
```
Dans cet exemple l'utilisateur a pour login: root et pour password: root


### Requête pour ajouter une nouvelle tâche:

POST:
```HTTP
http://localhost:3000/tasks
```

Et ajouter un objet de ce type dans le body:
```json
{
    "id_manager": 1,
    "id_parent_task": 1,
    "name_task": "do something",
    "duration_task": 5,
    "type_task": "some type of task"
}
```

### Requête pour obtenir une liste des tâches:

GET:
```HTTP
http://localhost:3000/tasks
```

### Requête pour renseigner son travail effectué:

POST:
```HTTP
http://localhost:3000/made_works
```

Et ajouter un objet de ce type dans le body:
```JSON
{
    "id_account_made_work": 1,
    "id_task_made_work": 1,
    "duration_made_work": 2,
    "date_of_work_made_work": 5
}
```


### Requête pour obtenir toute les tâches effectué par un utilisateur:

GET:
```HTTP
http://localhost:3000/made_works?id_account_made_work=eq.1
```
Cet exemple fonctionne pour l'utilisateur avec l'ID 1.

### Requête pour obtenir une liste des utilisateurs:

GET:
```HTTP
http://localhost:3000/accounts
```

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