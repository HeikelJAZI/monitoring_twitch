
# Monitoring_twitch (première version)

Application et scripts autour de l’univers twitch pour monitorer et
avoir de l’information aux sujets des streams et des streamers

Ce projet a été mise en place avec la version 4.2.1 de R Studio

![](https://img.shields.io/badge/R-4.2.1-blue)

Vous trouverez ci-dessous la liste des librairies utilisées pour ce
projet

![](https://img.shields.io/badge/dplyr-%3E=1.1.1-blue)
![](https://img.shields.io/badge/dbplyr-%3E=2.3.2-pink)
![](https://img.shields.io/badge/RSQLite-%3E=2.3.0-yellow)
![](https://img.shields.io/badge/rTwitchAPI-%3E=0.1.1-green)
![](https://img.shields.io/badge/taskscheduleR-%3E=1.6-red)

![](https://img.shields.io/badge/readr-%3E=2.1.3-blue)
![](https://img.shields.io/badge/DBI-%3E=1.1.3-pink)
![](https://img.shields.io/badge/lubridate-%3E=1.9.2-yellow)

![](https://img.shields.io/badge/apexcharter-%3E=en_attente-green)
![](https://img.shields.io/badge/shiny-%3E=1.7.2-red)
![](https://img.shields.io/badge/flexdashboard-%3E=en_attente-blue)

## :one: Objectif

Ce projet a été réalisée dans le cadre du suivi du comportement du
twitch français. Il s’agit principalement de scripts d’une application
web réalisée en R avec flexdashboard et shiny, et publiées dans
shinyapps.io.

- Le script va permettre d’avoir un état des lieux de twitch au pas 5
  minutes :

  - connexion à l’API de twitch
  - récupération du top 100 streams français
  - exécuter au pas 5 minutes cette démarche

- L’application va afficher de nombreuses informations au sujet des
  streams : (à compléter)

  - premier point
  - deuxièreme point
  - troisième point

Pour l’application, le script **BDD_twitch_scheduled** s’exécute toutes
les 5 minutes et va déposer les fichiers dans mon répertoire personnel
sur une semaine glissante. Ces fichiers correspondent à un état des
lieux de twitch toutes les 5 minutes.

Ensuite, les résultats obtenus à partir de ce script vont permettre de
mettre en place l’application à partir du script **à_déterminer.Rmd**.

## :two: Documentations

Twitch

- L’utilisation de l’API de Twitch est indiqué dans le repos de la
  librairie Twitch API : [Utiliser AliceFiles depuis
  Poker](https://gopro-collaboratif.rte-france.com/pages/viewpage.action?pageId=125767641)

TaskScheduler

- L’utilisation de la librairie TaskScheduler est indiqué dans le Readme
  de la librairie

AutoClicker

- Pour que l’exécution automatique fonctionne en continue, il faut
  impérativement que le PC soit allumé. Pour cela, j’ai mis en place un
  autoclicker que je cherche à faire fonctionne convenablement

## :three: Structure

Ce projet est structuré de la manière suivante:

### 3.1 Pour le script automatique : Récupération des données de Twitch au pas 5 minutes

- Un script `BDD_twitch_scheduled.R`. Il contient tout le code
  permettant de gérer la base de données de Twitch avec les données sur
  le top 100 des streams français au pas 5 minutes

### 3.2 Pour l’application : Etat des lieux de Twitch sur une semaine glissante

- Un script `à_déterminer.Rmd`. Il contient tout le code permettant de
  mettre en place l’application (flexdashboard)

## :four: Services et Comptes utilisés.

### 4.1 Twitch

L’application `à_déterminer.Rmd` et le script `BDD_twitch_scheduled.R`
de ce projet se connectent à **Twitch**

Les compte utilisé est `issu de mon compte personnel`: compte pour se
connecter à Twitch. Les ids sont stockés dans des variables
d’environnement `TWITCH_CLIENT_ID` et `TWITCH_CLIENT_SECRET`

> Pendant le développement, vous pouvez stocker ces variables dans votre
> fichier `.Renviron` ou les charger via `Sys.setenv()`

### 4.2 TaskScheduler

Pour le script `schedule_bdd_twitch.R`, il est **impératif** de mettre
en place ce script pour automatiser la récupération des données.

## :five: Publier une mise à jour de l’appli sur shinyapps.io

A DETERMINER

## :six: Contacts

Ce projet est développé par Heikel JAZI pour mettre en avant les streams
français sur Twitch.

Pour toutes remarques ou problèmes, n’hésitez pas à me contacter à mon
adresse mail `heikel.j@live.fr` en précisant que vous parlez de ce
projet ou d’un élément de celui-ci (applications et/ou script).

## :seven: Développeurs

Ce projet a été mise en place et est actuellement maintenu par
`Heikel JAZI`
