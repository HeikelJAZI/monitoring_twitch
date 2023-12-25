# permet d'automatiser mon document
library(taskscheduleR)

# La méthode avec l'Addin et l'IHM issu de la librairie taskScheduler qui fonctionne bien 


# Chemin où se situe le script (à changer lors d'un push dans git)
# path <- "chemin_vers_le_script"
path_script <- "c:/Users/Heikel/Desktop/00_projets_R/monitoring_twitch/scripts/"


## Lance le script toutes les cinq minutes, commence à 23h40
taskscheduler_create(taskname = "update_twitch_bdd",
                     rscript = paste0(path_script,"BDD_twitch_scheduled.R"),
                     schedule = "MINUTE",
                     starttime = "23:40",
                     modifier = 5)

# Afficher la liste des tâches 
# tasks <- taskscheduler_ls()
# str(tasks)

# fonction permettant de supprimer la tâche 
taskscheduler_delete(taskname = "update_twitch_bdd")


# nom de la tâche depuis l'IHM
# taskscheduler_delete(taskname = "BDD_twitch_scheduled.R")




