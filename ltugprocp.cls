%%
%% This is file `ltugproc.cls', *** modified for Polish environment ***
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% tugboat.dtx  (with options: `ltugproccls')
%% 
%% Copyright (C) 1994,1995,1996,2001 TeX Users Group
%% All rights reserved.
%% 
%% This file is part of the tugboat package.
%% -----------------------------------------
%% 
%% This is a generated file.  Permission is granted to customize the
%% declarations in this file to serve the needs of your installation.
%% However, no permission is granted to distribute a modified version of
%% this file under its original name.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass  {ltugprocp}
                   [2004/07/06 v1.6
                       TUG conference proceedings class%
                   ]
\def\@tugclass{ltugprocp}
\newif\if@proctw@column  \@proctw@columntrue
\DeclareOption{onecolumn}{\@proctw@columnfalse}
\newif\if@proc@sober
\newif\if@proc@numerable
\DeclareOption{tug95}{%
  \@proc@soberfalse
  \@proc@numerablefalse
}
\DeclareOption{tug96}{%
  \@proc@sobertrue
  \@proc@numerablefalse
}
\DeclareOption{tug97}{%
  \@proc@sobertrue
  \@proc@numerabletrue
}
\DeclareOption{tug2002}{%
  \@proc@sobertrue
  \@proc@numerabletrue
  \let\if@proc@numbersec\iftrue
  \PassOptionsToClass{numbersec}{ltugboat}%
}
\DeclareOption{numbersec}{\let\if@proc@numbersec\iftrue
  \PassOptionsToClass{numbersec}{ltugboat}%
}
\DeclareOption{nonumber}{\let\if@proc@numbersec\iffalse
  \PassOptionsToClass{nonumber}{ltugboat}%
}
\newif\ifTB@title
\DeclareOption{title}{\TB@titletrue}
\def\PolishCaps{\typeout{!!!!Polish Captions ON!!!!!}%
  \def\andAuthor{i}%
  \def\figurename{Rysunek}%
  \def\abstractname{Streszczenie}}  % <-- tp
\DeclareOption{polish}{\AtEndOfClass{\PolishCaps}} % <-- tp
\DeclareOption{polski}{\AtEndOfClass{\PolishCaps}} % <-- tp
\DeclareOption{notitle}{\TB@titlefalse
  \AtBeginDocument{\stepcounter{page}}}
\DeclareOption{tugproc}{%
  \ClassWarning{\@tugclass}{Option \CurrentOption\space ignored}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ltugboat}}
\InputIfFileExists{\@tugclass.cfg}{\ClassInfo{ltugproc}%
           {Loading ltugprocp configuration information}}{}
\@ifundefined{TUGprocExtraOptions}%
   {\let\TUGprocExtraOptions\@empty}%
   {\edef\TUGprocExtraOptions{,\TUGprocExtraOptions}}
\@tempcnta\year
\ifnum\@tempcnta<2000
  \divide\@tempcnta by100
  \multiply\@tempcnta by100
  \advance\@tempcnta-\year
  \@tempcnta-\@tempcnta
\fi
\edef\@tempa{\noexpand\providecommand\noexpand\tugProcYear
                {\ifnum10>\@tempcnta0\fi\the\@tempcnta}}
\@tempa
\ClassInfo{ltugproc}{Class believes year is
  \expandafter\ifnum\tugProcYear<2000 19\fi\tugProcYear
    \@gobble}
\expandafter\ifx\csname ds@tug\tugProcYear\endcsname\relax
  \def\tugProcYear{2002}\fi
\ExecuteOptions{nonumber,tug\tugProcYear,title\TUGprocExtraOptions}
\ProcessOptions
\if@proc@numbersec
  \if@proc@numerable
  \else
    \ClassWarning{\@tugclass}{This year's proceedings may not have
      numbered sections}%
  \fi
\fi
\LoadClass[\if@proc@numbersec numbersec\else nonumber\fi]{ltugboatp}%<--tp
\def\maketitle{%
  \begingroup
    \ifshortAuthor\else
      \global\let\rhAuthor\@empty
      \def\g@addto@rhAuthor##1{%
        \begingroup
          \toks@\expandafter{\rhAuthor}%
          \let\thanks\@gobble
          \protected@xdef\rhAuthor{\the\toks@##1}%
        \endgroup
      }%
      \@getauthorlist\g@addto@rhAuthor
    \fi
    \ifTB@title
      \setcounter{footnote}{0}%
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \if@proctw@column
        \twocolumn[\@maketitle]%
      \else
        \onecolumn
        \global\@topnum\z@
        \@maketitle
      \fi
      \@thanks
      \thispagestyle{TBproctitle}
    \fi
  \endgroup
  \TB@madetitletrue
}
\newif\ifTB@madetitle  \TB@madetitlefalse
\def\@TB@test@document{%
  \edef\@tempa{\the\everypar}
  \def \@tempb{\@nodocument}
  \ifx \@tempa\@tempb
    \@nodocument
  \fi
}
\def\AUTHORfont {\large\rmfamily\mdseries\upshape}
\def\TITLEfont  {\Large\rmfamily\mdseries\upshape}
\def\addressfont{\small\rmfamily\mdseries\upshape}
\def\netaddrfont{\small\ttfamily\mdseries\upshape}
\def\@maketitle{%
   {\parskip\z@
    \TITLEfont\raggedright\noindent\@title\par
      \count@=0
      \loop
      \ifnum\count@<\authornumber
        \vskip20\p@
        \advance\count@\@ne
        {\AUTHORfont\theauthor{\number\count@}\endgraf}%
        \addressfont\theaddress{\number\count@}\endgraf
        {%
          \allowhyphens
          \hangindent1.5pc
          \netaddrfont\thenetaddress{\number\count@}\endgraf
          \hangindent1.5pc
          \thePersonalURL{\number\count@}\endgraf
        }%
      \repeat
   \vskip20\p@}%
   \if@abstract
      \centerline{\bfseries \abstractname}% <-- tp
      \vskip.5\baselineskip\rmfamily
      \list{}{\listparindent20\p@
         \itemindent\z@ \leftmargin4.875pc
         \rightmargin\leftmargin \parsep \z@}\item[]\ignorespaces
            \the\abstract@toks
      \endlist\global\@ignoretrue
   \fi
   \vskip1pc
   \global\@afterindentfalse\aftergroup\@afterheading
  }
\newtoks\abstract@toks  \abstract@toks{}
\let\if@abstract\iffalse
\def\abstract{%
  \ifTB@madetitle
    \TBWarning{abstract environment after \string\maketitle}
  \fi
  \def\@abstract@{abstract}%
  \ifx\@currenvir\@abstract@
  \else
    \TBError{\string\abstract\space is illegal:%
      \MessageBreak
      use \string\begin{\@abstract@} instead}%
      {\@abstract@\space may only be used as an environment}
  \fi
  \global\let\if@abstract\iftrue
  {\ifnum0=`}\fi
  \@abstract@getbody}
\let\endabstract\relax
\long\def\@abstract@getbody#1\end{%
  \global\abstract@toks\expandafter{\the\abstract@toks#1}%
  \@abstract@findend}
\def\@abstract@findend#1{%
  \def\@tempa{#1}%
  \ifx\@tempa\@abstract@
    \expandafter\@abstract@end
  \else
    \def\@tempb{document}%
    \ifx\@tempa\@tempb
      \TBError{\string\begin{\@abstract@}
          ended by \string\end{\@tempb}}%
        {You've forgotten \string\end{\@abstract@}}
    \else
       \global\abstract@toks\expandafter{\the\abstract@toks\end{#1}}%
       \expandafter\expandafter\expandafter\@abstract@getbody
    \fi
  \fi}
\def\@abstract@end{\ifnum0=`{\fi}%
  \expandafter\end\expandafter{\@abstract@}}
\renewcommand{\makesignature}{\TBWarning
         {\string\makesignature\space is invalid in proceedings issues}}
\renewcommand\title{\@dblarg\TB@title}
\def\TB@title[#1]#2{\gdef\@title{#2}%
  \bgroup
    \let\thanks\@gobble
    \let\\\ %
    \protected@xdef\rhTitle{#1}%
  \egroup
}
\def\shortTitle #1{\def\rhTitle{#1}}
\newif\ifshortAuthor
\def\shortAuthor #1{\def\rhAuthor{#1}\shortAuthortrue}
\def\ps@TBproctitle{\let\@oddhead\MakeRegistrationMarks
  \let\@evenhead\MakeRegistrationMarks
  \TB@definefeet
}
\def\ps@TBproc{%
  \def\@oddhead{\MakeRegistrationMarks
    {%
      \hfil
      \def\\{\unskip\ \ignorespaces}%
      \rmfamily\rhTitle
    }%
  }%
  \def\@evenhead{\MakeRegistrationMarks
    {%
      \def\\{\unskip\ \ignorespaces}%
      \rmfamily\rhAuthor
      \hfil
    }%
  }%
  \TB@definefeet
}

\advance\footskip8\p@    % for deeper running feet

\def\dopagecommands{\csname @@pagecommands\number\c@page\endcsname}
\def\setpagecommands#1#2{\expandafter\def\csname @@pagecommands#1\endcsname
  {#2}}
\def\TB@definefeet{%
  \def\@oddfoot{\ifpreprint\pfoottext\hfil\Now\hfil\thepage
    \else\rfoottext\hfil\thepage\fi\dopagecommands}%
  \def\@evenfoot{\ifpreprint\thepage\hfil\Now\hfil\pfoottext
    \else\thepage\hfil\rfoottext\fi\dopagecommands}%
}

\def\pfoottext{{\smc Preprint}: Proceedings of the \volyr{} Annual Meeting}
\def\rfoottext{\normalfont\TUB, \volx\Dash
   {Proceedings of the \volyr{} Annual Meeting}}

\pagestyle{TBproc}
\if@proc@numbersec
\else
  \setcounter{secnumdepth}{0}
\fi
\if@proc@numbersec
\else
  \if@proc@sober
    \def\section
           {\TB@nolimelabel
            \TB@startsection{{section}%
                             1%
                             \z@%
                             {-8\p@\@plus-2\p@\@minus-2\p@}%
                             {6\p@}%
                             {\normalsize\bfseries\raggedright}}}
  \else
    \def\section
           {\TB@nolimelabel
            \TB@startsection{{section}%
                             1%
                             \z@%
                             {-8\p@\@plus-2\p@\@minus-2\p@}%
                             {6\p@}%
                             {\large\bfseries\raggedright}}}
  \fi
  \def\subsection
           {\TB@nolimelabel
            \TB@startsection{{subsection}%
                             2%
                             \z@%
                             {6\p@\@plus 2\p@\@minus2\p@}%
                             {-5\p@\@plus -\fontdimen3\the\font}%
                             {\normalsize\bfseries}}}
  \def\subsubsection
           {\TB@nolimelabel
            \TB@startsection{{subsubsection}%
                             3%
                             \parindent%
                             \z@%
                             {-5\p@\@plus -\fontdimen3\the\font}%
                             {\normalsize\bfseries}}}
\fi
%%
\flushbottom % <--tp
\parskip0pt plus.5pt % <--tp
\endinput
%%
%% End of file `ltugproc.cls'.
