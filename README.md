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
