# "Création d'une base de données autour de Twitch"
    # author: "Heikel JAZI"
    # date: "2023-03-31"

  
## Documentation à ce sujet 
  
# <https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html>
# https://github.com/bnosac/taskscheduleR
  
## Installation des librairies
  
# install.packages("dplyr")
# install.packages("dbplyr")
# install.packages("RSQLite")

## Importation des librairies

  # permet de manipuler des tables 

time <- Sys.time()

# récupération de la journée au format %Y%m%d-
day <- format(time, "%Y%m%d")

# nom du fichier  
filename <- paste0(day , "_streams_twitch.csv")


# Chemin où je dépose les données (à changer lors d'un push dans git)
path_data <- "chemin_vers_les_données"

paste0("Heure de lancement : ", time)

suppressWarnings(suppressMessages(library("dplyr", quietly = T)))
suppressWarnings(suppressMessages(library("dbplyr", quietly = T)))
suppressWarnings(suppressMessages(library("RSQLite", quietly = T)))

  # permet de requêter l'API de Twitch

suppressWarnings(suppressMessages(library("rTwitchAPI", quietly = T)))

  # permet d'écrire des fichiers .csv

suppressWarnings(suppressMessages(library("readr", quietly = T)))

  # permet de manipuler / créer des bases de données 

suppressWarnings(suppressMessages(library("DBI", quietly = T)))

# permet de travailler avec les dates 

suppressWarnings(suppressMessages(library("lubridate", quietly = T)))


print("==============================================")
print("                                              ")

# Mise en place des variables d'environnement (à changer lors d'un push dans git)
# Il est nécessaire de mettre en place directement dans le fichier pour le taskScheduler

Sys.setenv(TWITCH_CLIENT_ID = "mettre l'identifiant")
Sys.setenv(TWITCH_CLIENT_SECRET = "mettre la clé secrete")


## Appel à l'API de Twitch


# Authentification à l'API (nécessaire)
# nécessaire pour fonctionner de générer les variables d'environnement 
#     - TWITCH_CLIENT_ID
#     - TWITCH_CLIENT_SECRET
# Toutes les informations sont présentes dans le README de la librairie rTwitchAPI ci-dessus

print("Authentification à l'API de Twitch")
twitch_auth()


## Récupération des 100 streams ayant le plus de vues en FRANCE  

print("Récupération des 100 streams ayant le plus de vues en FRANCE")
streams_live <- get_streams(first = 100, type = "live", language = "fr")
streams_live <- streams_live$data


  # Suppression des colonnes qui me sont inutiles pour le moment 
reduce_streams_live <- streams_live %>% select(-c(type, language, thumbnail_url, tag_ids, tags, is_mature))

  # ajout d'une colonne permettant d'ajouter l'heure à laquelle cette table a été génréré
reduce_streams_live <- reduce_streams_live %>% mutate(current_time = Sys.time())

  # permet d'avoir une visibilité sur la table
# reduce_streams_live %>% View()


# permet d'écrire le dataframe dans une table de notre base de données 
# dbWriteTable(twitch_bdd, "streams_twitch_live", reduce_streams_live, overwrite = TRUE)

# ATTENTION : ne fonctionne pas avec taskscheduleR

# permet d'ajouter la table tout juste créée à la table existante dans la base de données
# dbWriteTable(twitch_bdd, "streams_twitch_live", reduce_streams_live, append = TRUE)

if(!file.exists(paste0(path_data,filename))){
  
  print("Ecriture du fichier dans le dossier twitch_app")
  
  write_csv(reduce_streams_live, paste0(path_data,filename))
  
} else {
  
  print("Lecture du fichier dans le dossier twitch_app")
  
  streams <- read_csv(paste0(path_data,filename))
  
  streams <- streams %>% mutate(id = as.character(id),
                                user_id = as.character(user_id),
                                game_id = as.character(game_id),
                                started_at = as.character(started_at)) 
  
  print("Concaténéation de l'ancien fichier avec le nouveau")
  
  streams <- streams %>% bind_rows(reduce_streams_live)
  
  print("Ecriture du nouveau fichier dans le dossier twitch_app")
  
  write_csv(streams, paste0(path_data,filename))
  
}


# Attention : pas utile avec taskscheduleR

# overwrite permet d'écraser la précédente table 
# append permet d'ajouter des élements à la table existante 

# print("Deconnexion à la base de données")
# dbDisconnect(twitch_bdd)
# 
# 
# verif <- dbReadTable(twitch_bdd, "streams_twitch_live")


verification <-  read_csv(paste0(path_data,filename))

print("Vous trouverez ci-dessous les 5 premières lignes de la base de données")
head(verification)

print("Vous trouverez ci-dessous les 5 dernières lignes de la base de données")
tail(verification)

