#!/bin/sh
## git_init.sh for git_init in /home/devill_x/epitech/inprogress/B-PAV-360
## 
## Made by devill_x
## Login   <devill_x@epitech.net>
## 
## Started on  Tue Mar  4 18:35:19 2014 devill_x
## Last update Wed Sep 17 20:39:14 2014 vaur
##

#######################################################
##
## Création de dépot de git chez epitech
##
#######################################################

##
## Pour créer un dépot git chez epitech, il faut soit
## utiliser la commande rendu soit blih.
##
## Dans le premier cas la création du dossier doit être dans
## ~/rendu/ personnellement j'aime avoir ma propre arborescence,
## donc, c'est non.
##
## Dans le second cas il faut faire tout plein de truc qui
## peuvent être automatisé. D'où le but de ce script
##

## Variable:

## USER_GIT: votre login
## remplacer $USER par votre login avec entourré de ' si
## vous n'utilisez pas votre login pour vous connecté à votre
## ordinateur
##
## exemple:
## USER_GIT= 'devill_x'

USER_GIT='user'

## PASSWORD: votre password unix
##
## Remplacer password par votre password unix
##
## Exemple: si votre password est toto42 la ligne sera:
## PASSWORD="toto42"

PASSWORD='password'
SEND_PASS="`echo -n "$PASSWORD" | sha512sum | cut -f1 -d' '`"

## BLIH: la commande pour lancer blih
##
## si vous utilisez le dump epitech:
## BLIH="blih"
##
## si vous utilisez un autre dump:
## BLIH="python3.3 /chemin/vers/blih"

BLIH="blih"

if [ $# -eq 1 ]
    then
    ## Création du dépot sur le serveur
    $BLIH -u $USER_GIT -t $SEND_PASS repository create $1

    ## Set des droits pour le ramassage
    $BLIH -u $USER_GIT -t $SEND_PASS repository setacl $1 ramassage-tek r
    
    ## Pangolins (Samsung-Campus)
    $BLIH -u $USER_GIT -t $SEND_PASS repository setacl $1 deslog_m r
    $BLIH -u $USER_GIT -t $SEND_PASS repository setacl $1 bourea_v r
    $BLIH -u $USER_GIT -t $SEND_PASS repository setacl $1 primo_j r
    $BLIH -u $USER_GIT -t $SEND_PASS repository setacl $1 dasilv_b r

    ## Clone du dépot
    git clone git@git.epitech.eu:/$USER_GIT/$1

    cd $1

    ## Premier Commit -- créer la branch master
    git commit --allow-empty -m "First commit"

    ## Envois sur origin (aka le dépot d'epitech)
    git push -u origin master

else
    echo $0 [Depot a creer]
fi
