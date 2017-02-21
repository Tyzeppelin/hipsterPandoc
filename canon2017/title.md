---
title: Analyse de l'incapacité de la bibliothèque à fournir des fichiers de styles latex propres
subtitle: cave canem
supervisor: Lara Fabian 
company: Evil Corp
author: Arnold Schwarzenegger
school: IUT Tombouctou
dpt: Cookies
date: YYYY - YYYY+1
defence: jour de la mort de Johnny
corres: Jeremy Belpois
logoCompany: res/logoinsa.png
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
    - \usepackage{epsfig}
    - \usepackage[pages=some]{background}
    - \usepackage{lipsum}
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


