---
layout: post
title: Format Paper for ACM Publish
category : skills
tagline:
tags : [font, acm]
---
{% include JB/setup %}

I submitted a paper to ACM for publish two days ago. The editor replied to me
with some formating errors. ACM has strict rules for font types. In specific,
the paper must only contain embedded Type 1 or TrueType fonts. I googled for
quite a while to find out a solution for my case.

I use TexStudio with pdflatex
from texlive to edit and compile papers. Power Point is used to draw
flow charts and matplotlib is used to plot experiment figures.


### Check font types
I found two approaches to check the font types.

On Windows systems, open the paper using Adobe. Go to file properties and the
font tab. It will list all fonts used in the paper. If some fonts are not
allowed, you can locate the pages where these fonts appear by splitting the
whole file and checking the fonts of each page one by one. (not sure any better
way to check the locations).

On linux system, the command

    pdffonts paper.pdf

will list all fonts used in the paper.


### Correct font types in figures

The fonts of text are fine with the ACM requirements. But the fonts in the
figures usually have type 3 or truetype CID. Next I will share some tools (or
methods) I used to replace the type 3 and truetype CID fonts.

For the figures generated from Power Point, the type 3 or truetype CID fonts
often come from formulas. Instead of using the built-in formula editor, I
found a free plug-in to add formulas in slides, called
[IguanaTex](http://www.jonathanleroux.org/software/iguanatex/download.html). It
is easy to install---just download and open with Power Point. Formulas are
added as in a latex editor.


<img src="{{ BASE_PATH }}/assets/image/iguanatex.png" width="400px"/>

For the figures generated from matplotlib, the following code should be set
at the beginning of your script,

    # tell matplotlib to use type 1 fonts
    matplotlib.rcParams['ps.useafm']=True
    matplotlib.rcParams['pdf.use14corefonts']=True
    matplotlib.rcParams['text.usetex']=True

### Embed fonts

ACM requires that all fonts should be embedded. I also found two approaches,
one for Windows systems and one for linux systems. But the
[solution](http://blogs.adobe.com/acrobatforlifesciences/2008/09/reembedding_fonts_in_a_pdf/) using Adobe
on Windows systems would embed some fonts to truetype CID. Hence I only
introduce the way for linux systems.

My colleague shared a script (copied somewhere) with me to do the embedding,

    #!/bin/bash
    set -x
    gs -sDEVICE=pdfwrite -sOutputFile=<output.pdf> -dBATCH -dNOPAUSE \
    -sPAPERSIZE=letter -dEmbedAllFonts=true -dPDFSETTINGS=/prepress \
    -dOPTIMIZE=true -dCompatibilityLevel=1.4 <input.pdf>

Just replace the `<input.pdf>` and `<output.pdf>` with your paths. After executing
this script, you can run `pdffonts` to check the fonts again.
