% Instituto de Computação - Unicamp
% LaTeX document class for theses and dissertations.
% ic-tese-v3 2015-10-08

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ic-tese-v3}[]
\typeout{ic-tese-v3}

\def\thesislanguage#1{\gdef\@thesislanguage{#1}}
\DeclareOption{Ingles}{
  \thesislanguage{0}
  \newcommand{\@IC}{Institute of Computing}
  \newcommand{\@UNICAMP}{University of Campinas}
  \typeout{ic-tese: ingles.}
}
\DeclareOption{Espanhol}{
  \thesislanguage{1}
  \newcommand{\@IC}{Instituto de la Computac\'ion}
  \newcommand{\@UNICAMP}{Universidad de Campinas}
  \typeout{ic-tese: espanhol.}
}
\DeclareOption{Portugues}{
  \thesislanguage{2}
  \newcommand{\@IC}{Instituto de Computa\c{c}\~ao}
  \newcommand{\@UNICAMP}{Universidade Estadual de Campinas}
  \typeout{ic-tese: portugues.}
}
\newif\iffinalversion
\DeclareOption{Final}{
  \finalversiontrue
  \typeout{ic-tese: versao final.}
}

\ProcessOptions\relax

\LoadClass[12pt,a4paper]{report}

\RequirePackage[english,spanish,brazil]{babel}
\usepackage[T1]{fontenc}
\RequirePackage{graphicx}
\PassOptionsToPackage{table}{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{logo-ic-unicamp}
\RequirePackage{xspace}

\RequirePackage{setspace}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}

% User fields:
\let\@autor\relax
\def\autor#1{\gdef\@autor{#1}}
\author{\@autor}

\let\@autora\relax
\def\autora#1{\gdef\@autora{#1}}

\let\@titulo\relax
\def\titulo#1{\gdef\@titulo{#1}}

\def\grau#1{\gdef\@grau{#1}}

\newif\ifmaster

\gdef\mestrado{
  \if\@autora\relax
  \gdef\@degnamept{Mestre}
  \gdef\@degnamees{Maestro}
  \else
  \gdef\@degnamept{Mestra}
  \gdef\@degnamees{Maestra}
  \fi
  \gdef\@degnameen{Master}
  \gdef\@monopt{Disserta\c{c}\~ao}
  \gdef\@monoen{Dissertation}
  \gdef\@monoes{Dissertac\'ion}
}
\gdef\doutorado{
  \if\@autora\relax
  \gdef\@degnamept{Doutor}
  \gdef\@degnamees{Doctor}
  \else
  \gdef\@degnamept{Doutora}
  \gdef\@degnamees{Doctora}
  \fi
  \gdef\@degnameen{Doctor}
  \gdef\@monopt{Tese}
  \gdef\@monoen{Thesis}
  \gdef\@monoes{Tesis}
}

\let\@orientador\relax
\def\orientador#1{\gdef\@orientador{#1}}

\let\@orientadora\relax
\def\orientadora#1{\gdef\@orientadora{#1}}

\gdef\@advisors{1}
\let\@coorientador\relax
\def\coorientador#1{\gdef\@coorientador{#1}\gdef\@advisors{2}}

\let\@coorientadora\relax
\def\coorientadora#1{\gdef\@coorientadora{#1}\gdef\@advisors{2}}

\def\datadadefesa#1#2#3{
  \gdef\@dia{#1}
  \gdef\@mes{#2}
  \gdef\@ano{#3}
}


\let\@fichacatalografica\relax
\def\fichacatalografica#1{\gdef\@fichacatalografica{#1}}


\let\@avalA\relax
\let\@avalB\relax
\let\@avalC\relax
\let\@avalD\relax
\let\@avalE\relax
\let\@avalF\relax
\let\@instavalA\relax
\let\@instavalB\relax
\let\@instavalC\relax
\let\@instavalD\relax
\let\@instavalE\relax
\let\@instavalF\relax

\def\avaliadorA#1#2{\gdef\@avalA{#1}\gdef\@instavalA{#2}}
\def\avaliadorB#1#2{\gdef\@avalB{#1}\gdef\@instavalB{#2}}
\def\avaliadorC#1#2{\gdef\@avalC{#1}\gdef\@instavalC{#2}}
\def\avaliadorD#1#2{\gdef\@avalD{#1}\gdef\@instavalD{#2}}
\def\avaliadorE#1#2{\gdef\@avalE{#1}\gdef\@instavalE{#2}}
\def\avaliadorF#1#2{\gdef\@avalF{#1}\gdef\@instavalF{#2}}


\let\@cotutela\relax
\def\cotutela#1{\gdef\@cotutela{#1}}


\def\paginasiniciais{
  \newlength{\oldparindent}
  \setlength{\oldparindent}{\parindent}
  \setlength\parindent{0pt}
  \thispagestyle{empty}
  \pagestyle{empty}
  \makeatletter
  \let\ps@mystyle\ps@plain
  \let\ps@plain\ps@empty
  \makeatother
  \openningpage
  \clearpage
  \titlepage
  \clearpage
  \cathpage
  \clearpage
  \approvalpage
  \clearpage
  \setlength{\parindent}{\oldparindent}
  \resetlang
}

% Unicamp and IC logos and names:
\def\logos{
  \noindent
  \begin{center}
  \begin{tabular}{ccc}
    \raisebox{-.5\height}{\includegraphics[width=2.2cm]{logo-unicamp.eps}}
    &
    \begin{minipage}{.6\textwidth}
      \centering
      \textbf{\@UNICAMP} \\
      \textbf{\@IC} \\
    \end{minipage}
    &
    \raisebox{-.45\height}{\scalebox{1.11}{\LogoIcUnicampWithName}}
  \end{tabular}
  \end{center}
}


\def\openningpage{
  \logos
  \vskip 30mm
  \begin{center}
    \Large
    {\bf \if\@autora\relax\@autor\else\@autora\fi}\\
    \vskip 20mm
    \ifcase\@thesislanguage
      {\bf\@title}\\
      \vskip 20mm
    \or
      {\bf\@title}\\
      \vskip 20mm
    \fi
    {\bf \@titulo}
    \vfill
    \large
    CAMPINAS\\
    \@ano
  \end{center}
}


\def\titlepage{
  \logos
  \large\bf
  \vskip 15mm
  \begin{center}
    \if\@autora\relax\@autor\else\@autora\fi\\
    \vfill
    \ifcase\@thesislanguage
      \@title\\
      \vskip 10mm
    \or
      \@title\\
      \vskip 10mm
    \fi
    \@titulo\\
    \vfill
  \end{center}
  \normalfont
  \normalsize
  \ifcase\@thesislanguage
    \hfill\begin{minipage}[t]{0.54\textwidth}%
      \@monoen\xspace presented to the Institute of Computing of the
      University of Campinas in partial fulfillment of the requerements for
      the degree of \@degnameen\xspace in Computer Science.
    \end{minipage}
    \vskip 10mm \or \hfill\begin{minipage}[t]{0.54\textwidth}%
    \@monoes\xspace presentada al Instituto de la Computac\'ion de la
    Universidad de Campinas para obtener el t\'{\i}tulo de
    \@degnamees\xspace en Ciencias de la Computaci\'on.
    \end{minipage}
    \vskip 10mm
  \fi
  \hfill\begin{minipage}[t]{0.54\textwidth}%
    \@monopt\xspace apresentada ao Instituto de Computa\c{c}\~ao da
    Universidade Estadual de Campinas como parte dos requisitos para a
    obten\c{c}\~ao do t\'{\i}tulo de \@degnamept\xspace em Ci\^encia da
    Computa\c{c}\~ao\ifx\@cotutela\relax\else\xspace no \^ambito do acordo de
    Cotutela firmado entre a Unicamp e a \@cotutela\fi.
  \end{minipage}
  \vfill
  \ifcase\@thesislanguage
    {\bf Supervisor/}\hspace{-0.9ex}
  \or
    \if\@orientadora\relax {\bf Director/}\else {\bf Directora/}\fi\hspace{-0.9ex}
  \fi
  \if\@orientadora\relax {\bf Orientador: \@orientador}%
  \else {\bf Orientadora: \@orientadora}\fi\\
  \ifnum\@advisors=2
  \ifcase\@thesislanguage
    {\bf Co-supervisor/}\hspace{-0.7ex}
  \or
    \if\@coorientadora\relax {\bf Co-director/}\else {\bf Co-directora/}\fi\hspace{-0.7ex}
  \fi
  \if\@coorientadora\relax {\bf Coorientador: \@coorientador}%
  \else {\bf Coorientadora: \@coorientadora}\fi\\
  \fi
  \vfill
  \iffinalversion
    \begin{minipage}[t]{0.5\textwidth}
      Este exemplar corresponde \`{a} vers\~{a}o final da \@monopt\xspace defendida por
      \if\@autora\relax\@autor\else\@autora\fi\xspace e orientada
      \if\@orientadora\relax pelo \@orientador\else pela \@orientadora\fi.
    \end{minipage}
  \else
    \begin{minipage}[t]{0.5\textwidth}
      Este exemplar corresponde \`{a} vers\~{a}o da \@monopt\xspace entregue
      \`{a} banca antes da defesa.
    \end{minipage}
  \fi
  \vfill
  \begin{center}
  {\large CAMPINAS\\}
  {\large \@ano}
  \end{center}
}


\def\cathpage{
  \ifx\@fichacatalografica\relax
  {\Large Substitua pela ficha catalogr{\'a}fica.} \\\\De acordo com o
  padr\~ao da CCPG: ``Quando se tratar de Teses e Disserta\c{c}\~oes
  financiadas por ag\^encias de fomento, os beneficiados dever\~ao fazer
  refer\^encia ao apoio recebido e inserir esta informa\c{c}\~ao na ficha
  catalogr\'afica, al\'em do nome da ag\^encia, o n\'umero do processo pelo
  qual recebeu o aux\'{\i}lio.''\\e\\``caso a tese de doutorado seja feita
  em Cotutela, ser\'a necess\'ario informar na ficha catalogr\'afica o
  fato, a Universidade convenente, o pa\'{\i}s e o nome do orientador.''
  \else
  \includepdf[pagecommand={}]{\@fichacatalografica}
  \fi
}


\def\approvalpage{
  \iffinalversion
  \logos
  \vskip 20mm
  \begin{center}
    \large
    {\bf \if\@autora\relax\@autor\else\@autora\fi}\\
    \vskip 10mm
    \ifcase\@thesislanguage
      {\bf\@title}\\
      \vskip 10mm
    \or
      {\bf\@title}\\
      \vskip 10mm
    \fi
    {\bf \@titulo}
  \end{center}
  \vskip 20mm
  \ifcase\@thesislanguage
      {\bf Examining Committee:}
  \or
      {\bf Jurado Examinador:}
  \else
      {\bf Banca Examinadora:}
  \fi
  \ifx\@avalA\relax\else
  \begin{itemize}
  \item \@avalA \\\@instavalA
  \ifx\@avalB\relax\else \item \@avalB\newline\@instavalB\fi
  \ifx\@avalC\relax\else \item \@avalC\newline\@instavalC\fi
  \ifx\@avalD\relax\else \item \@avalD\newline\@instavalD\fi
  \ifx\@avalE\relax\else \item \@avalE\newline\@instavalE\fi
  \ifx\@avalF\relax\else \item \@avalF\newline\@instavalF\fi
  \end{itemize}
  \fi
  \vskip 10mm
  \begin{center}
  A ata da defesa, onde constam as assinaturas dos membros da banca, est\'a
  arquivada pela Universidade Estadual de Campinas.
  \end{center}
  \newpage
  \else
  Na vers\~ao final, esta p\'agina ser\'a substitu\'{\i}da por outra que
  informa que a ata de defesa est\'a arquivada pela Unicamp.
  \fi
}


\def\prefacesection#1{
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
  \pagestyle{empty}
  \thispagestyle{empty}
}


\gdef\resetlang{
  \ifcase\@thesislanguage\relax
  \selectlanguage{english}
  \or\selectlanguage{spanish}
  \or\selectlanguage{brazil}
  \fi
}


\newenvironment{resumo}{\prefacesection{Resumo}\selectlanguage{brazil}}{\resetlang \newpage}
\renewenvironment{abstract}{\prefacesection{Abstract}\selectlanguage{english}}{\resetlang \newpage}
\newenvironment{resumen}{\prefacesection{Resumen}\selectlanguage{spanish}}{\resetlang \newpage}


\newenvironment{epigrafe}{\newpage\mbox{}\vfill\hfill\begin{minipage}[t]{0.5\textwidth}}%
{\end{minipage}\newpage}


\newcommand{\fimdaspaginasiniciais}{
\newpage
\makeatletter
\let\ps@plain\ps@mystyle
\makeatother
\pagestyle{headings}
\setstretch{1.1}
}


\let\@oldbiblio\thebibliography
\renewcommand{\thebibliography}[1]{\newpage\addcontentsline{toc}{chapter}{\bibname}\@oldbiblio{#1}}
