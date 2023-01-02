# CSV-email-validator

[README en français](README.fr.md)

# Usage guide for the check_emails.sh script

This script checks if the contents of the specified column in a CSV file are a valid email using the regex 

> ^\[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$

  

# Prerequisites

The check_emails.sh script requires the bash command interpreter (installed by default on most Linux distributions).

If you want to use the version of the script that uses the Perl language to retrieve the column contents, you must install the Perl library Text::CSV by running the command `cpan Text::CSV` or using your package manager (e.g. `apt-get install libtext-csv-perl` on Debian/Ubuntu).
  

# Usage

To use the check_emails.sh script, open your terminal and navigate to the directory containing the script.

Run the script by passing it the name of the CSV file to be checked and the column number as parameters.

Here is an example of using the `check_emails.sh` script to check if the contents of the specified column in a CSV file are a valid email:

```bash
# Navigate to the directory containing the script
cd /path/to/directory

# Run the script by passing it the name of the CSV file to be checked
# and the column number containing the emails to be checked
./check_emails.sh emails.csv 3
```

Voici comment afficher uniquement les emails non valides lors de l'exécution du script `check_emails.sh` en utilisant la commande `grep` :

```bash
# Navigate to the directory containing the script
cd /path/to/directory

# Run the script by passing it the name of the CSV file to be checked
# and the column number containing the emails to be checked
# Use the grep command to only display lines containing the word "not" (corresponding to invalid emails)
./check_emails.sh emails.csv 3 | grep "n\'est pas"
```