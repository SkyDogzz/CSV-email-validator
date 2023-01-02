# CSV-email-validator

# Guide d'utilisation du script check_emails.sh

Ce script permet de vérifier si le contenu de la colonne spécifiée dans un fichier CSV est un email valide en utilisant la regex 

> ^\[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$

  

# Prérequis

Le script check_emails.sh nécessite l'interpréteur de commandes bash (installé par défaut sur la plupart des distributions Linux).

Si vous souhaitez utiliser la version du script qui utilise le langage Perl pour récupérer le contenu de la colonne, vous devez installer la librairie Perl Text::CSV en exécutant la commande `cpan Text::CSV` ou en utilisant votre gestionnaire de paquets (par exemple `apt-get install libtext-csv-perl` sous Debian/Ubuntu).

  

# Utilisation

Pour utiliser le script check_emails.sh, ouvrez votre terminal et placez-vous dans le répertoire contenant le script.

Exécutez le script en lui passant en paramètres le nom du fichier CSV à vérifier et le numéro de colonne

Voici un exemple d'utilisation du script `check_emails.sh` pour vérifier si le contenu de la colonne spécifiée dans un fichier CSV est un email valide :

```bash
# On se place dans le répertoire contenant le script
cd /chemin/vers/le/répertoire

# On exécute le script en lui passant en paramètres le nom du fichier CSV à vérifier
# et le numéro de colonne contenant les emails à vérifier
./check_emails.sh emails.csv 3
```

Voici comment afficher uniquement les emails non valides lors de l'exécution du script `check_emails.sh` en utilisant la commande `grep` :

```bash
# On se place dans le répertoire contenant le script
cd /chemin/vers/le/répertoire

# On exécute le script en lui passant en paramètres le nom du fichier CSV à vérifier
# et le numéro de colonne contenant les emails à vérifier
# On utilise la commande grep pour ne afficher que les lignes contenant le mot "pas" (correspondant aux emails non valides)
./check_emails.sh emails.csv 3 | grep "n\est pas"
```