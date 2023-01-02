#!/bin/bash

regex="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"

# Vérifie si la syntaxe d'un email est valide
is_valid_email() {
  # Utilise la regex précédemment fournie pour vérifier la syntaxe de l'email
  if [[ $1 =~ $regex ]]; then
    return 0
  else
    return 1
  fi
}

# Vérifie si la colonne spécifiée dans chaque ligne du fichier CSV contient un email valide
check_emails() {
  # Initialise un compteur de lignes à 1
  line_number=1
  # Parcours chaque ligne du fichier CSV
  while read -r line; do
    # Récupère le contenu de la colonne spécifiée en utilisant le langage Perl
    # Le script Perl utilise la regex /^((?:[^,]|"(?:[^"]|"")*"))*$/ pour découper la ligne en champs
    # en prenant en compte les délimiteurs de champs présents dans le contenu des colonnes
    # Le champ d'indice $2 (le numéro de colonne est donné en paramètre) est stocké dans la variable $email
    email=$(perl -MText::CSV -ne 'BEGIN { $csv = Text::CSV->new({ binary => 1, sep_char => "," }); } if ($csv->parse($_)) { @columns = $csv->fields(); print $columns['$2']; }' <<< "$line")
    # Vérifie si le contenu de la colonne est un email valide
    if is_valid_email $email; then
      echo "Ligne $line_number : $email est un email valide"
    else
      echo "Ligne $line_number : $email n'est pas un email valide"
    fi
    # Incrémente le compteur de lignes
    line_number=$((line_number+1))
  done < "$1"
}

# Vérifie si le nombre de paramètres est correct
if [ "$#" -ne 2 ]; then
  echo "Usage : check_emails <nom_du_fichier>.csv <numero_de_colonne>"
else
  # Vérifie si le fichier CSV spécifié existe
  if [ -f "$1" ]; then
    # Vérifie si le numéro de colonne est valide (supérieur à 0)
    if [ "$2" -gt "0" ]; then
      # Appelle la fonction pour vérifier les emails du fichier CSV
      check_emails "$1" "$2"
    else
      echo "Le numéro de colonne doit être supérieur à 0"
    fi
  else
    echo "Le fichier $1 n'existe pas"
  fi
fi
