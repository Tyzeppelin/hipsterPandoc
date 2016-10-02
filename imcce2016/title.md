---
title: Factorisation des polynômes univariés à coefficients entiers dans TRIP
supervisor: Mickaël Gastineau
subtitle: Institut de Mécanique Céleste et de Calcul des Ephémérides, Observatoire de Paris
author: François Boschet
school: INSA Rennes
dpt: Département Informatique
date: Juillet - Septembre 2016
corres: Marie Babel
classoption: fleqn
fontfamily: lmodern
header-includes:
    - \usepackage[francais]{babel}
    - \usepackage[T1]{fontenc}
    - \usepackage{titlesec}
    - \usepackage{listings}
    - \usepackage{graphicx}
    - \usepackage{tikz}
    - \usepackage{fullpage}
    - \usepackage{algorithm}
    - \usepackage[noend]{algpseudocode}
    - \usepackage[nodisplayskipstretch]{setspace}
    - \usepackage{amsthm}
    - \usepackage{subcaption}
	- \usepackage{graphbox}
    - \setstretch{1}
    - \lstset{mathescape}
    - \makeatletter
    - \setlength{\mathindent}{1cm}
    - \algrenewcommand\algorithmicrequire{\textbf{Entr\'ee:}}
    - \algrenewcommand\algorithmicensure{\textbf{Sortie:}}
    - \renewcommand{\ALG@name}{Algorithme}
    - \newcommand{\HRule}[1]{\rule{\linewidth}{#1}}
    - \titleformat{\chapter}{\normalfont\LARGE\bfseries}{\thechapter.}{1em}{}
    - \usetikzlibrary{shapes, arrows}
    - \newtheorem{theorem}{Théorème}
    - \newtheorem{definition}{Définition}
	- \newtheorem{lemma}{Lemme}
include-before:
    - \input{remerciements.tex}
include-after:
	- \input{abstract.tex}
bibliography: biblio.bib
---


