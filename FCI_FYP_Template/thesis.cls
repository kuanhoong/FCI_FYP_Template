%% thesis.cls 2013/06/28 version V1.0
%% 
%% This is the unofficial MMU thesis LaTeX class 
%% FCI Final Year Project Report I and II
%% of Multimedia University, Cyberjaya Malaysia,
%% formatted according to the guideline for 
%% FCI FYP Committee
%% 
%% 
%% 
%% The latest version and documentation of mmu can %% be obtained at
%% http://goo.gl/Ydfty.
%% Contact kuanhoong AT gmail DOT com if you have
%% any questions or assistance or feedback.  
%% Reply may be delayed thus patience is required!
%%
%%
%% Copyright (c) 2013 by Poo Kuan Hoong
%%
%% Current maintainer: Poo Kuan Hoong 
%% (kuanhoong@gmail.com)
%
%  BRIEF CHANGELOG
%  ===============
% v1.0 June 28 2013
% - First release (with a really awful manual)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2013/06/28 LaTeX2e class for MMU FCI FYP Report v1.0.  Copyright (c) 2013 Poo Kuan Hoong (kuanhoong@gmail.com)]

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{textcomp}

%%%%%%%%%%%%%%%%%%%%%%%
%% Set Date to dd:mm:yyyy
%%
\RequirePackage{datetime}
\newcommand{\dateseparatoriso}{:}
\newcommand{\todayiso}{\twodigit\day \dateseparatoriso \twodigit\month \dateseparatoriso \the\year}

\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtsubmissionmonth{\textbf{!INSERT MONTH!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}
\def\@mtmajor{\textbf{!INSERT MAJOR!}}
\def\@mtsession{\textbf{!INSERT SESSION!}}

\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\submissionmonth}[1]{\def\@mtsubmissionmonth{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}
\newcommand{\major}[1]{\def\@mtmajor{#1}}
\newcommand{\session}[1]{\def\@mtsession{#1}}


%%%%%%%%%%%%
% Page layout
%
% Following 2016/17 FCI FYP guideline p. 15
% Margins: T - 40mm; B - 25mm; L - 40mm; R - 25mm
% No running headers.
% Running footers are 15mm from bottom edge of paper
% i.e. (40 - 15)mm = 25mm from bottom edge of typeblock.
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{25mm}{*}
\setulmarginsandblock{40mm}{40mm}{*}
\setheadfoot{\baselineskip}{15mm}
\addtolength\footskip{-6pt}
\pagestyle{plain}
\makeevenfoot{plain}{}{\fontsize{10pt}{12pt}\selectfont\thepage}{}
\makeoddfoot{plain}{}{\fontsize{10pt}{12pt}\selectfont\thepage}{}
\checkandfixthelayout

%%%%%%%%%%%%
% Simulate MS Windows fonts
% Invoking Helvetica and Times
%
%
% TODO: TeX Gyre fonts + Math Times Pro with "altfonts" option
%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\RequirePackage{mathptmx}
%\RequirePackage{courier}
\renewcommand\ttdefault{lmvtt}

\RequirePackage[breaklinks,pdfborder={0 0 0}]{hyperref}
\addtoiargdef\author{}{\hypersetup{pdfauthor={\theauthor}}}
\addtoiargdef\title{}{\hypersetup{pdftitle={\thetitle}}}

%%%%%%%%%%%%
% Line and paragraph spacing
% - 1.5 spacing for normal text (but need to tweak to exactly simulate Word
% - Leave one line between paragraphs
% - 12.7mm paragraph indent
%%%%%%%%%%%%
%\OnehalfSpacing
\DisemulatePackage{setspace}
\usepackage{setspace}
\setstretch{2.0}
\abnormalparskip{2.0\onelineskip}
% \setlength\parindent{12.7mm}
\setlength\parindent{0mm}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}
% But they should all be endnotes!!
\RequirePackage{endnotes}
\renewcommand\enotesize{\tiny}
\let\footnote=\endnote
\renewcommand\enoteheading{\chapter{\notesname}\mbox{}\vskip-4\onelineskip}
\renewcommand\enoteformat{\rightskip\z@ \leftskip\z@ \parindent=1.8em
  \leavevmode\llap{\makebox[1.8em][l]{\theenmark.}}}


%%%%%%%%%%%%
% 10pt = \footnotesize for backmatter
% And add a PDF bookmark
%%%%%%%%%%%%
\patchcommand{\backmatter}{}{\footnotesize%
\ifpdf\pdfbookmark[-1]{Back Matter}{back}\fi}
\patchcommand{\frontmatter}{}{\ifpdf\pdfbookmark[-1]{Front Matter}{front}\fi}
\patchcommand{\mainmatter}{}{\ifpdf\pdfbookmark[-1]{Main Chapters}{main}\fi}

%%%%%%%%%%%%
% The Cover and Title page
%%%%%%%%%%%%
\newcommand{\makecoverandtitlepage}{%
\ignorespaces
%\changepage{-20mm}{-15mm}{15mm}{0em}{0em}{20mm}{0em}{0em}{0em}
\changepage{-40mm}{-15mm}{15mm}{0em}{0em}{40mm}{0em}{0em}{0em}
\begin{titlingpage}
\centering\SingleSpacing%
\renewcommand\ttdefault{lmtt}%
% \fontfamily{phv}\fontseries{mc}%\LARGE%
%\fontfamily{qhv}\fontseries{cr}%
\fontsize{20pt}{20pt}
\selectfont%
\MakeUppercase{\thetitle}\par%
\vfill%
\fontsize{16pt}{20pt}
\selectfont%
\MakeUppercase{\theauthor}\par%
\vfill%
\MakeUppercase{\@mtsession}\par%
\vfill%
FACULTY OF COMPUTING AND INFORMATICS\\
MULTIMEDIA UNIVERSITY\par%
\MakeUppercase{\@mtsubmissionmonth}\ \@mtsubmissionyear\par%
\end{titlingpage}%
\clearpage\hspace{1em}\thispagestyle{empty}\clearpage%%Hack to insert blank page
{\centering\thispagestyle{empty}\setcounter{page}{1}%
{\SingleSpacing\LARGE\MakeUppercase{\thetitle}\par}%
\vfill%
{\setstretch{2} BY\\%
\par%
{\fontsize{16pt}{18pt}\selectfont\MakeUppercase{\theauthor}}\\
\vfill%
{\fontsize{10pt}{18pt}\selectfont\MakeUppercase{\@mtsession}}\\
}
\vfill%
{\setstretch{2} 
{\fontsize{10pt}{18pt} \selectfont THIS PROJECT REPORT IS PREPARED FOR}\\%
\par%
{\SingleSpacing\fontsize{12pt}{18pt} \selectfont FACULTY OF COMPUTING AND INFORMATICS\\
MULTIMEDIA UNIVERSITY\\
IN PARTIAL FULFILLMENT\\
FOR}\\%
\par%
{\fontsize{12pt}{18pt}\selectfont\MakeUppercase{\@mtdegree}}\\
\par%
{\@mtmajor}
}
\vfill%
{\SingleSpacing\fontsize{12pt}{18pt}\selectfont FACULTY OF COMPUTING AND INFORMATICS\\ 
\vfill%
\fontsize{16pt}{18pt}\selectfont MULTIMEDIA UNIVERSITY\\[1em]%
\fontsize{12pt}{18pt}\selectfont \@mtsubmissionmonth\ \@mtsubmissionyear}%\\[3em]%
\par\clearpage}%
%\changepage{20mm}{15mm}{-15mm}{0em}{0em}{-20mm}{0em}{0em}{0em}%
\changepage{40mm}{15mm}{-15mm}{0em}{0em}{-40mm}{0em}{0em}{0em}
\renewcommand\ttdefault{lmvtt}%
}


%%%%%%%%%%%%
% The Copyright page
%%%%%%%%%%%%
\newcommand{\copyrightpage}{\hspace{1em}%
\phantomsection%
\ifpdf\pdfbookmark{Copyright Page}{copyright}\fi%
\cftaddtitleline{toc}{chapter}{COPYRIGHT PAGE}{\thepage}%
\begin{vplace}[1]
% \centering
\fontsize{14pt}{16pt}\selectfont ~~~~~~~~~~ Copyright of this report belongs to Universiti Telekom Sdn. Bhd. as qualified by Regulation 7.2 (c) of the Multimedia University Intellectual Property and Commercialisation Policy. No part of this publication may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Universiti Telekom Sdn. Bhd. Due acknowledgement shall always be made of the use of any material contained in, or derived from, this report.\par\vskip\onelineskip%
{\centering%
%\begin{tabular}{@{}r@{ }l@{}}
\begin{tabular}{c}
\fontsize{12pt}{12pt}\selectfont\textcopyright ~ \@mtsubmissionyear ~ University Telekom Sdn. Bhd. ALL RIGHTS RESERVED.
\end{tabular}%
\par}
\end{vplace}\clearpage%
}


%%%%%%%%%%%%
% The Declaration page
%%%%%%%%%%%%
\newcommand{\declarationpage}{%
\chapter{Declaration}\vskip-\onelineskip
I hereby declare that the work has been done by myself and no portion of the work contained in this Thesis has been submitted in support of any application for any other degree or qualification on this or any other university or institution of learning.\\[3\onelineskip]
\newlength\siglinelength
\settowidth{\siglinelength}{\bfseries\normalsize\theauthor}
\noindent\rule{\siglinelength}{.6pt}\\{\bfseries\normalsize\theauthor}\\
Faculty of Computing and Informatics\\
Multimedia University\\
Date: \todayiso
\clearpage
}

%%%%%%%%%%%%
% The Acknowledgements (typeset like chapter?)
%%%%%%%%%%%%
\newcommand{\acknowledgements}[1]{\chapter{Acknowledgements}\vskip-\onelineskip #1}

%%%%%%%%%%%%
% The dedication (??? formatting???)
%%%%%%%%%%%%
\newcommand{\dedication}[1]{\newpage\hspace{1em}%
\phantomsection%
\ifpdf\pdfbookmark{Dedication}{dedication}\fi%
\cftaddtitleline{toc}{chapter}{DEDICATION}{\thepage}%
\begin{vplace}[.5]\centering#1\end{vplace}%
\clearpage}


%%%%%%%%%%%%
% The Abstract
%%%%%%%%%%%%
\abstractintoc
\renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
\renewcommand*\absnamepos{center}
%\setlength\abstitleskip{0pt}
\setlength\abstitleskip{-\onelineskip}
\renewcommand\abstractnamefont{\normalsize\bfseries}
\renewcommand\abstracttextfont{\normalsize}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}
\newcommand{\abstractfromfile}[1]{\begin{abstract}\input{#1}\end{abstract}}

%%%%%%%%%%%%
% The Preface
%%%%%%%%%%%%
\newenvironment{preface}{\chapter{Preface}\vskip-\onelineskip}{}
\newcommand{\prefacefromfile}[1]{\begin{preface}\input{#1}\end{preface}}

%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vskip\beforechapskip}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{3\onelineskip}
\setlength\afterchapskip{2\onelineskip minus \onelineskip}
\renewcommand*\chapnamefont{\normalsize\bfseries\fontsize{16pt}{12pt}\selectfont}
\renewcommand*\chapnumfont{\normalsize\bfseries\centering\fontsize{16pt}{12pt}\selectfont}
\renewcommand*\chaptitlefont{\normalsize\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}


%%%%%%%%%%%%
% The Appendices
%%%%%%%%%%%%
\renewcommand*\appendixname{Appendix}
\addtodef\appendix{}{\renewcommand\chaptername{\appendixname}}

%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{subsubsection}
\setsecheadstyle{\normalsize\bfseries\itshape\fontsize{14pt}{12pt}\selectfont}
%\setbeforesecskip{2.5ex plus 1ex minus .2ex}
\setbeforesecskip{\onelineskip}
%\setaftersecskip{0.1ex plus .2ex}
%\setaftersecskip{1em plus .2ex minus .2ex}
\setaftersecskip{\onelineskip}
\setsubsecheadstyle{\normalsize\bfseries\itshape}
%\setbeforesubsecskip{2.5ex plus .1ex minus .2ex}
\setbeforesubsecskip{\onelineskip}
%\setaftersubsecskip{0.1ex plus .2ex}
%\setaftersubsecskip{1em plus .2ex minus .2ex}
\setaftersubsecskip{\onelineskip}
\setsubsubsecheadstyle{\normalsize\itshape}
%\setbeforesubsubsecskip{1.5ex plus 1ex minus .2ex}
\setbeforesubsubsecskip{\onelineskip}
\renewcommand\thesubsubsection{\thesubsection\space(\alph{subsubsection})}
\setsubsubsecheadstyle{\normalsize\itshape}
%\setbeforesubsubsecskip{2.5ex plus .2ex minus .2ex}
\setbeforesubsubsecskip{\onelineskip}
%\setaftersubsubsecskip{0.1ex plus .2ex}
%\setaftersubsubsecskip{1em plus .1ex minus .2ex}
\setaftersubsubsecskip{\onelineskip}


%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\settocdepth{subsection}
\renewcommand*\contentsname{\texorpdfstring{TABLE OF CONTENTS}{Table of Contents}}
\renewcommand*\listtablename{\texorpdfstring{LIST OF TABLES}{List of Tables}}
\renewcommand*\listfigurename{\texorpdfstring{LIST OF FIGURES}{List of Figures}}
\renewcommand*\indexname{\texorpdfstring{INDEX}{Index}}
\renewcommand*\glossaryname{\texorpdfstring{GLOSSARY}{Glossary}}
\renewcommand\cftdotsep{\cftnodots}
\setrmarg{3.55em plus 1fil}
\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftchapteraftersnum}{:\space}
\renewcommand*{\cftchapterafterpnum}{\vspace*{4pt}}
\renewcommand*{\cftappendixname}{\MakeUppercase{\appendixname}\space}
\setlength\cftsectionindent{0pt}
\let\orichapter\chapter
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
\newcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{#1}}{#1}]{#1}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
\renewcommand*\cftsectionafterpnum{\vskip 3pt}
\setlength\cftsubsectionindent{\cftsectionnumwidth}
\renewcommand*\cftfigurename{\figurename\space}
\renewcommand*\cfttablename{\tablename\space}
\renewcommand*\cftfigureafterpnum{\vskip 3pt}
\renewcommand*\cfttableafterpnum{\vskip 3pt}

\addtodef{\insertchapterspace}{}%
{\addtocontents{toc}{\protect\vspace*{-4pt}}}

%%%%%%%%%%%
% Indexing
%%%%%%%%%%%
\RequirePackage{makeidx}
\RequirePackage[notesep=.5\onelineskip]{idxlayout}
\setindexprenote{}
\makeindex

%%%%%%%%%%%%
% Bibliograpy
% - Font size = 10pt = \footnotesize
% - Double spacing between entries
%%%%%%%%%%%%
\RequirePackage[nosectionbib]{apacite}
% new counter for enumerating bibitems
\newcounter{lbibcount} 
\bibliographystyle{apacite}
\renewcommand\bibliographytypesize{\footnotesize}
\setlength\bibitemsep{\onelineskip}
%\setlength\bibleftmargin{12.7mm}
\setlength\bibleftmargin{2em}
\setlength\bibindent{-\bibleftmargin}
\iffalse
% Add a counter label to each bibitem per MMU's requirement
\def\@lbibitem[#1]#2{%
    \def\BBA{\BBAA}%    ``\&''
    \item[\hyper@natanchorstart{#2\APAC@extra@b@citeb}%
          \@biblabel{#1}{\protect\makebox[\bibleftmargin][l]{[\arabic{lbibcount}]}}% added numeric label here
          \hyper@natanchorend]%
    \if@filesw{%
        \def\BBA{\string\BBA}%
        \let\protect\noexpand
        \immediate\write\@newciteauxhandle{\string\bibcite{#2}{#1}}%
        \immediate\write\@newciteauxhandle{\string\APACbibcite{#2}{#1}}%
        \def\BBA{\BBAA}%
    }%
    \fi
    \ignorespaces
}
\fi
% step counter at each bibitem
\patchcommand{\bibitem}{\addtocounter{lbibcount}{1}}{}
% reset label width to 0 and reset bibitem counter.
\addtoiargdef{\thebibliography}{}{\setcounter{lbibcount}{0}\labelwidth=0pt}
\renewcommand{\bibliographyprenote}{\vspace*{-\onelineskip}} % Ugly, ugly hack
\AtBeginDocument{\renewcommand*\bibname{\texorpdfstring{REFERENCES}{References}}}

\RequirePackage{multibib}
\newcites{own}{\texorpdfstring{PUBLICATION LIST}{Publication List}}
%\newcites{own}{Publication List}
\bibliographystyleown{apacite}
%\addtoiargdef{\bibliographyown}{}{\setcounter{lbibcount}{0}}
%{\renewcommand*\bibname{\texorpdfstring{PUBLICATION LIST}{Publication List}}}

%\RequirePackage{relsize}
\RequirePackage[toc,nonumberlist,description,shortcuts]{glossaries}
\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand{\glsgroupskip}{}
\renewcommand{\glossarypreamble}{\footnotesize\vspace*{-\onelineskip}}
\renewcommand{\glossarypostamble}{\normalsize}
\makeglossaries

\AtEndDocument{\clearpage\hspace{1em}\thispagestyle{empty}\clearpage}
