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

% Packages pour le développement de fonctions avancées
\RequirePackage{etoolbox} % Pour la gestion des listes
\RequirePackage{xkeyval} % Pour la gestion des clés

% Commandes pour la définition des auteurs des articles.
% Chaque auteur est défini à l'aide du package keyval par une commande \auteur{Nom =, Affiliation =}.
\define@key{article}{Auteur}{%
    \def\Auteur{%
        \begin{flushright}
            {#1}
        \end{flushright}%
    }%
}
\define@key{article}{Affiliation}{%
    \def\Affiliation{%
        \begin{flushright}
            #1
        \end{flushright}%
    }%
}
\define@key{article}{Titre}{%
    \def\Titre{%
        {%
            \normalfont\fontsize{18}{22}\selectfont\raggedleft #1\par%
        }%
        \par\vspace{0.8cm}% Espace vertical après le titre
        \noindent\hrulefill% Ligne horizontale après le titre
        \par\vspace{0.5cm}% Espace vertical après la ligne horizontale
        \thispagestyle{OuvertureArticle} % Utilise le style fancy pour les en-têtes et pieds de page
        \pagestyle{CourantArticle} % Utilise le style fancy pour les en-têtes et pieds de page
    }%
}
\newenvironment{Article}[1][]{%
    \setkeys{article}{#1}%
    \RE@DefineThanks
    \makeArticletitle
}
{%
    \par 
}

\newcommand{\makeArticletitle}{\@makearticletitle}

\def\@makearticletitle{%
    \null
    \Titre\par
    \Auteur\par
%    \Affiliation
    \RE@UseThanks
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Gestion de \thanks à l'intérieur des rubriques %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\thanks\relax % Valeur par défaut (pour le non développement)
\newtoks\RE@hookfootnote
%
% \RE@DefineThanks met en place le mécanisme pour afficher les appels
% de note et sauvegarder les corps de note. Cette macro doit être
% placée juste avant \twocolumn[...]
%
\newcommand*\RE@DefineThanks{%
  \setcounter{footnote}{0}%
  \global\RE@hookfootnote{}%
  \def\thanks##1{%
    \footnotemark
    \global\RE@hookfootnote\expandafter{%
      \the\RE@hookfootnote
      \stepcounter{footnote}%
      \footnotetext{##1}%
    }%
  }%
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\!\hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{%
    \noindent
    \hb@xt@0em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}%
    }%
    ##1%
  }%
}
%
% \RE@UseThanks affiche les notes de bas de page. Cette macro doit
% être appelée juste après le \twocolumn[...]
%
\newcommand*\RE@UseThanks{%
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\dotFFN{}%
  \the\RE@hookfootnote
  % Code suivant réalisé avant le résumé quand il existe.
  % \def\dotFFN{.}%
  % \setcounter{footnote}{0}%
  % \renewcommand\thefootnote{\@arabic\c@footnote}%
}
\newcommand*\RE@UseThanksBis{%
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\dotFFN{}%
  \the\RE@hookfootnote
  % Code suivant non réalisé car pas de résumé.
  \def\dotFFN{.}%
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@arabic\c@footnote}%
}


% Commandes pour la définition des titres des articles en français puis en anglais
\newcommand{\titrearticleENG}[1]{%
    \par\vspace{6mm}% Espace vertical avant le titre anglais
    \selectlanguage{english}
    {%
        \normalfont\fontsize{9}{11}\selectfont\scshape\raggedright #1\par%
    }%
    \par\vspace{3mm}% Espace vertical après le titre anglais
    \selectlanguage{french}
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