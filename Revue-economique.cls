\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Revue-economique}[2024/05/26 Classe de document pour la revue économique]
\LoadClass[10pt]{book} % Charge la classe book avec une taille de police de 10pt

% Packages linguistiques
\RequirePackage[english,french]{babel}

% Packages supplémentaires
\RequirePackage{graphicx} % Pour la gestion des images
\RequirePackage{xcolor} % Pour la gestion des couleurs
\RequirePackage{geometry} % Pour le format des pages
\geometry{
    paperwidth=155mm,
    paperheight=240mm,
    head=22mm,
    foot=22mm,
    inner=18mm,
    outer=25mm
}
% Packages supplémentaires pour la gestion avancée des tableaux
\RequirePackage{array} % Pour la personnalisation des colonnes de tableau
\RequirePackage{tabularx} % Pour la gestion des tableaux à largeur fixe
\RequirePackage{booktabs} % Pour des lignes horizontales de meilleure qualité
\RequirePackage{multirow} % Pour fusionner des cellules sur plusieurs lignes
% Packages supplémentaires pour la saisie avancée des mathématiques
\RequirePackage{amsmath} % Pour les fonctionnalités mathématiques avancées
\RequirePackage{amssymb} % Pour les symboles mathématiques supplémentaires
\RequirePackage{amsfonts} % Pour les polices mathématiques supplémentaires
\RequirePackage{fontspec} % Pour la sélection des polices avec XeLaTeX
\usepackage{microtype} % Pour améliorer le remplissage des lignes
\setmainfont{Linux Libertine O} % Définit la police principale comme Linux Libertine O
\setsansfont{Avenir} % Définit la police sans empattement comme Avenir
% Packages supplémentaires pour la gestion des en-têtes de pages
\RequirePackage{fancyhdr} % Pour la personnalisation des en-têtes et pieds de page
\pagestyle{fancy} % Utilise le style fancy pour les en-têtes et pieds de page
\fancyhf{} % Efface les en-têtes et pieds de page existants
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
\fancypagestyle{OuvertureArticle}{%
    \fancyhf{} % Efface les en-têtes et pieds de page existants
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyfoot[RO,LE]{\thepage} % Numérotation des pages en chiffres romains
}
\fancypagestyle{CourantArticle}{%
    \fancyhf{} % Efface les en-têtes et pieds de page existants
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
    \fancyhead[RO]{\leftmark}
    \fancyhead[LE]{\rightmark}
    \fancyfoot[RO,LE]{\thepage} % Numérotation des pages en chiffres romains
}

% Packages supplémentaires pour la gestion des titres de section
\RequirePackage{titlesec} 
% Définition des titres de section de niveau 1
\titleformat{\section}[block]
{\normalfont\fontsize{11}{13}\selectfont\sffamily}{\thesection}{1em}{\vspace{1cm}}
\titlespacing*{\section}{0pt}{1cm}{5mm}

% Commandes pour la définition des titres des articles en français puis en anglais
\newcommand{\titrearticle}[1]{%
    {%
        \normalfont\fontsize{18}{22}\selectfont\raggedleft #1\par%
    }%
    \par\vspace{0.8cm}% Espace vertical après le titre
    \noindent\hrulefill% Ligne horizontale après le titre
    \par\vspace{1.5cm}% Espace vertical après la ligne horizontale
    \thispagestyle{OuvertureArticle} % Utilise le style fancy pour les en-têtes et pieds de page
    \pagestyle{CourantArticle} % Utilise le style fancy pour les en-têtes et pieds de page
}
\newcommand{\titrearticleENG}[1]{%
    \par\vspace{6mm}% Espace vertical avant le titre anglais
    {%
        \normalfont\fontsize{9}{11}\selectfont\scshape\raggedright #1\par%
    }%
    \par\vspace{3mm}% Espace vertical après le titre anglais
}
\newenvironment{resume}{%
    \par\itshape\sffamily\fontsize{8}{10}\selectfont%
    \setlength{\leftskip}{5mm} % Set the left margin to 5mm
    \setlength{\rightskip}{5mm} % Set the right margin to 5mm
}{%
    \par%
}
\newenvironment{resumeENG}{%
    \selectlanguage{english}%
    \par\itshape\sffamily\fontsize{8}{10}\selectfont%
    \setlength{\leftskip}{5mm} % Set the left margin to 5mm
    \setlength{\rightskip}{5mm} % Set the right margin to 5mm
}{%
    \par\selectlanguage{french}%
}
\newcommand{\motscles}[1]{%
    \par\vspace*{2.75mm}
    {\sffamily\fontsize{8}{10}\selectfont\noindent Mots-clés : #1}}
\newcommand{\keywords}[1]{%
    \par\vspace*{2.75mm}
    {\selectlanguage{english}\sffamily\fontsize{8}{10}\selectfont\noindent Keywords: #1}}
\newcommand{\jelcode}[1]{%
    \par\vspace*{2.75mm}
    {\sffamily\fontsize{8}{10}\selectfont\noindent Classification JEL : #1.}}