\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latteachCD}[2017/04/05 Dummy Exercise Sheet Style]

\LoadClass[11pt,a4paper]{article}

\RequirePackage{parskip}
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{csquotes}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{wasysym}
\RequirePackage{stmaryrd}
\RequirePackage{enumitem}
\RequirePackage{sfmath}

\newif\if@german
\@germanfalse
\DeclareOption{german}{\@germantrue}
\ProcessOptions\relax

\setlength{\textheight}{238mm}
\setlength{\topmargin}{30mm}
\addtolength{\topmargin}{-1in}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\setlength{\topskip}{0mm}
\setlength{\footskip}{17mm}

\setlength{\textwidth}{160mm}
\setlength{\oddsidemargin}{30mm}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}

\newcommand{\@notice}{Notice}
\newcommand{\@exercise}{Exercise}
\newcommand{\@faculty}{Faculty of Computer Science}
\newcommand{\@institute}{Institute of Theoretical Computer Science}
\newcommand{\@chair}{Chair of Automata Theory}

\if@german
  \RequirePackage[ngerman]{babel}
  \renewcommand{\@notice}{Hinweis}
  \renewcommand{\@exercise}{Aufgabe}
  \renewcommand{\@faculty}{Fakultät Informatik}
  \renewcommand{\@institute}{Institut für Theoretische Informatik}
  \renewcommand{\@chair}{Lehrstuhl für Automatentheorie}
\else
  \RequirePackage[american]{babel}
\fi

\newcounter{exercise}
\newenvironment{exercise}[1][]
	{\refstepcounter{exercise}{\textbf{\@exercise~\theexercise}}
	\ifthenelse{\equal{#1}{}}{}{{\bf{(#1)}}}\\[1ex]
	}
	{\vspace{2ex}}
\newcommand{\notice}[1]{
	\vspace*{0.1cm}

	\rule{\textwidth}{.5pt}

	{\bf{\@notice}}\\[0.2cm]

	#1\\

	\rule{\textwidth}{.5pt}
	\vspace*{0.1cm}
	}

\newcommand{\@term}{~}
\newcommand{\@course}{~}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\renewcommand{\maketitle}{%
  {\bf\Large \@course}\\[1ex]
  {\textbf{\@title}}\\[1ex]
  \@author\\
  \@term\\[5ex]%
  }


% --- Zaehler setzen ---
\renewcommand{\theenumi}{\alph{enumi}}%
\renewcommand{\labelenumi}{\theenumi)}%
\setcounter{exercise}{0}%
\setcounter{page}{1}%