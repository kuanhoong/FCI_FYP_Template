# FCI FYP Template

This is an *unofficial* template for FCI FYP Report. 

This current version is based on the [FCI FYP Guideline from 2016/17 session](https://github.com/kuanhoong/FCI_FYP_Template/files/804514/85091_Final.Year.Project.Guidelines_V4_20160706.pdf). Please check the latest guideline for potential changes in copyright, declaration, formattings, and etc.

*This template is modified from IPS Postgraduate Thesis template. (Credit to: Lim Lian Tze)*

## Recommended: Overleaf

Instead of installing a local version of LaTeX (can be as big as 3GB), consider to just use [Overleaf](https://www.overleaf.com) - like Google Docs for LaTeX. It's free as long as you have <= 60 files (just delete sample images you should be fine).

## For Windows

1. Install [MikTex](http://miktex.org/download) and Install [TexMaker](http://www.xm1math.net/texmaker/download.html) 
2. Open and edit thesis.tex file. Edit the `\author`, `\title`, `\submissionyear`, `\submissionmonth`, `\degree`, `\major`, `\session` accordingly.
3. Edit the rest of the files accordingly.
4. To include a new chapter, simply create a new `.tex` file and make sure you include the link to the file to `thesis.tex` by including the command `\include{newchapter}`

## For Debian/Ubuntu

1. Install texlive-full with apt-get (approx 3GB) and [TexMaker] (http://www.xm1math.net/texmaker/download.html#linux):

  ```
  $ sudo apt-get install texlive-full
  $ sudo apt-get install texmaker
  ```

## For macOS

1. Install [MacTex](https://tug.org/mactex/) (approx 3GB) and [TexMaker](http://www.xm1math.net/texmaker/download.html#macosx) (31.2MB).

## Compiling with Makefile

Provided you have CMake and pdflatex + bibtex commands properly installed. You can run `make` in the directory and it will generate `thesis.pdf`.

On Mac, it will open the PDF upon completion. Sublime Text users can just build it inside the editor (cmd + b for mac).

  ```
  $ cd path/to/your-tex-project
  $ make
  ```

Contact kuanhoong AT gmail DOT com if you have any questions or assistance or feedback. Reply may be delayed, thus patience is required!
