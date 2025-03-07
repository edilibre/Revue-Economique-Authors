---
title: Classe de document pour la *Revue économique*
author: © 2024-2025 Sébastien Mengin -- www.edilibre.net
---

# Description
Ce projet fournit une classe de document LaTeX personnalisée pour la *Revue économique*. Cette classe permet de formater les articles selon les directives de la revue.

# Installation
Récupérez l'archive qui fournit un dossier de travail contenant la classe de document et un fichier « gabarit » :

https://github.com/edilibre/Revue-Economique-Authors/archive/refs/heads/main.zip

Le fichier `Gabarit-revue-economique.tex` contient les commandes et instructions de base pour rédiger un article pour la _Revue économique_.

# Dépendances
Assurez-vous d'avoir une distribution LaTeX à jour :

- [TeX Live](https://www.tug.org/texlive/)
- [MiKTeX](https://miktex.org/)
- [MacTeX](https://www.tug.org/mactex/)

On peut également utiliser la classe de document sur Overleaf, sans nécessiter d'installation sur PC perso : https://fr.overleaf.com/

# Compilation

Utilisez les moteurs LuaLaTeX ou XeLaTeX pour compiler vos fichiers.

La classe de document est prévue pour compiler l'article avec les réglages de mise en page définis par la maquette de la revue. Les auteurs peuvent ainsi visualiser leur travail dans son rendu proche de l'état final. 

Si des packages sont manquants, ils peuvent être ajoutés dans le préambule. En revanche, la ligne `\documentclass` ne doit comporter aucune autre option que `{Revue-economique.cls}`.

La classe de document utilise le package `biblatex`, elle est prévue pour compiler les fichiers de bibliographie avec biber.

## Citations

Les commandes de citations à utiliser son celles prévues par le package biblatex, principalement : `\parencite{<ref>}` et `\textcite{<ref>}`.

# Évolution

La classe actuelle est destinée à évoluer pour devenir compatible avec une chaîne de production intégralement basée sur LaTeX, tant pour la sortie papier que pour la parution sur les plateformes de diffusion en ligne.
