## Démarrage

Ouvrir RStudio

New Projet >>>>> R Package >>>>> Nom du Package >>>>>> (options Git et Renv)

Créez un fichier README.md : touch README.md via le terminal ou utiliser le bouton "New Blank File""

## Explication de la structure d'un package R



## Installation des packages nécessaires pour construire un package R

install.packages("usethis")
renv::snapshot()
install.packages("devtools")
renv::snapshot()

library(usethis)
library(devtools)

Supprimer le fichier "hello.R" (dans le dossier R) et le fichier "hello.Rd" (dans le dossier man)

## Construction des fonctions du Package

### Fonction temp_converter

use_r("temp_converter") : va créer le fichier temp_converter.R dans le dossier R

Ecrire le code de la fonction temp_converter dans le fichier le fichier "temp_converter.R"

Exemple : 

temp_converter(100) >>> 212

temp_converter(95, unit_from ="Fahrenheit", unit_to ="Celsius") >>>> 35

### Fonction dist_converter

use_r("dist_converter")

Ecrire le code de la fonction dist_converter dans le fichier "dist_converter.R"

Exemple : dist_converter(100, "meters", "feet") >>> 328.084

### Fonction time_converter

use_r("time_converter")

Ecris le code de cette fonction

Exemple : time_converter(24, "hours", "seconds") >>>>> 86400

### Fonction weight_converter

use_r("weight_converter")

Ecris le code de cette fonction

Exemple : weight_converter(100, unit_from = "kilogram", unit_to = "pound") >>>> 220.4624

## Chargement de toutes les fonctions définies dans le dossier R

devtools::load_all()

 load_all() charge tous les fichiers (y compris les fonctions définies dans le dossier R) de votre package dans l'environnement de travail. Cela vous permet de tester et de modifier vos fonctions sans avoir à réinstaller le package à chaque modification. 
 
 Après avoir exécuté load_all(), toutes les fonctions définies dans votre package seront disponibles pour être appelées dans votre session R actuelle. Vous pouvez les tester, les déboguer et les modifier de manière itérative.
 
 load_all() est principalement utilisé lors du développement et des tests du package. Il charge le package et ses dépendances dans la session R en cours, permettant de travailler avec le package et de tester ses fonctionnalités sans avoir besoin d'installation.

## Vérifications sur le package

devtools::check()

La fonction `devtools::check()` est un outil très utile pour les développeurs de packages R. Elle effectue une série de vérifications sur votre package pour s'assurer qu'il est conforme aux standards de CRAN (Comprehensive R Archive Network). Voici une explication détaillée de ce que fait `devtools::check()` :

### Fonctionnement de `devtools::check()`

1. **Vérification de la Structure du Package** : `check()` vérifie que la structure de votre package respecte les standards de CRAN. Cela inclut la présence et la validité des fichiers essentiels comme `DESCRIPTION`, `NAMESPACE`, et les dossiers `R`, `man`, `data`, etc.

2. **Exécution des Tests** : Si votre package inclut des tests (par exemple dans le dossier `tests` ou avec le framework de test `testthat`), `check()` les exécute pour s'assurer que tout fonctionne comme prévu.

3. **Compilation de la Documentation** : La fonction compile la documentation Roxygen (si vous l'utilisez) et vérifie que tous les fichiers de documentation (`.Rd` files) sont correctement formatés.

4. **Vérification des Exemples** : `check()` exécute les exemples inclus dans les fichiers de documentation pour s'assurer qu'ils fonctionnent sans erreur.

5. **Vérification des Dépendances** : Elle vérifie que toutes les dépendances de votre package sont correctement déclarées dans le fichier `DESCRIPTION` et qu'elles sont disponibles et installables.

6. **Vérification des Problèmes de Compilation** : Si votre package contient du code en C, C++, Fortran ou autre, `check()` tente de le compiler pour s'assurer qu'il n'y a pas d'erreurs de compilation.

7. **Analyse des Messages d'Avertissement et des Notes** : `check()` génère un rapport détaillé incluant toutes les erreurs, avertissements et notes. Cela peut inclure des problèmes mineurs comme des espaces blancs inutiles ou des suggestions d'amélioration.


`devtools::check()` est un outil essentiel pour les développeurs de packages R. Il vous aide à identifier et à corriger les problèmes potentiels avant de soumettre votre package à CRAN. En utilisant régulièrement cette fonction pendant le développement, vous pouvez vous assurer que votre package est robuste, bien documenté et conforme aux standards de la communauté R.


L'execution de devtools::check() en l'état actuel du développement de notre package a fait ressortir 2 warnings :

checking for missing documentation entries ... WARNING
  Undocumented code objects:
    ‘dist_converter’ ‘temp_converter’ ‘time_converter’ ‘weight_converter’
  All user-level objects in a package should have documentation entries.
  
  Cela veut dire que nos fonctions ne sont pas documentées
  
## Documentation avec roxygen2
  
- Title

- Description

- Usage 

- Arguments

- Returns and/or See Also

- Examples

Documentez chaque fonction en y incluant les éléments ci-dessus. Une fois la documentation écrite, il faudra la générer  en executant ce code :

roxygen2::roxygenize()

Writing dist_converter.Rd
Writing temp_converter.Rd
Writing time_converter.Rd
Writing weight_converter.Rd

Les fichiers .Rd ont éte généré dans le dossier man


## Définir une licence pour le package

usethis::use_mit_license()

Le code `usethis::use_mit_license()` est une commande qui utilise le package `usethis` pour ajouter une licence MIT à votre projet R. Voici ce que fait précisément cette fonction :

### Fonctionnement de `use_mit_license()`

1. **Ajout de la Licence MIT** : La fonction crée un fichier appelé `LICENSE` à la racine de votre projet et y insère le texte de la licence MIT. La licence MIT est une licence de logiciel libre permissive qui permet aux utilisateurs de faire presque tout ce qu'ils veulent avec le code, tant que les mentions de droits d'auteur et la licence sont incluses dans les copies du logiciel.

2. **Inclusion des Détails du Projet** : En plus d'ajouter la licence, `use_mit_license()` insère automatiquement les informations de droit d'auteur dans le fichier `DESCRIPTION` de votre projet R, sous la section `License`. Cela s'assure que quiconque utilise votre package sait sous quelle licence il est distribué.

3. **Conformité avec les Standards de CRAN** : En ajoutant une licence explicite, vous rendez votre package conforme aux exigences de CRAN (Comprehensive R Archive Network), qui nécessite que tous les packages listent leur licence.

## Finalisation et construction du package

On execute les codes ci-dessous :

devtools::load_all()

devtools::check(). Le meilleur état est : 0 errors ✔ | 0 warnings ✔ | 0 notes ✔

devtools::install()

Exemple d'utilisation :

unitConverter::dist_converter(3.048, "meters", "feet") ou faire :

library(unitConverter)

dist_converter(3.048, "meters", "feet")

Si tout vas bien, on peut construire (build) le package en executant :

devtools::build()

devtools::build() construit un package R en créant une archive compressée au format .tar.gz (ou .zip sur Windows) qui contient tous les fichiers nécessaires pour installer et utiliser le package.

Le fichier "unitConverter_0.1.0.tar.gz" a éte généré et représente notre package. On peut le partager à nos collègues pour qu'ils puissent l'utiliser.

Menu Tools >> Install packages >>> Install from (sélectionner Package Archive) puis aller choisir le package dans votre machine afin de l'installer 
