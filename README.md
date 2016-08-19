# FCI FYP Template

This is an *unofficial* template for FCI FYP Report.

*This template is modified from IPS Postgraduate Thesis template. (Credit to: Lim Lian Tze)*

## For Windows

1. Install [MikTex](http://miktex.org/download) and Install [TexMaker](http://www.xm1math.net/texmaker/download.html) 
2. Open and edit thesis.tex file. Edit the `\author`, `\title`, `\submissionyear`, `\submissionmonth`, `\degree`, `\major`, `\session` accordingly.
3. Edit the rest of the files accordingly.
4. To include a new chapter, simply create a new `.tex` file and make sure you include the link to the file to `thesis.tex` by including the command `\include{newchapter}`

## For Debian/Ubuntu

1. Install texlive-full with apt-get (approx 3GB) or [TexMaker] (http://www.xm1math.net/texmaker/download.html#linux):

  ```
  $ sudo apt-get install texlive-full
  ```
  
  or
  
  ```
  $ sudo apt-get install texmaker
  ```

## For OSX/macOS

1. Install [MacTex](https://tug.org/mactex/) (approx 3GB) or [TexMaker](http://www.xm1math.net/texmaker/download.html#macosx) (31.2MB).

## Compiling with Makefile

Provided you have CMake and pdflatex + bibtex commands properly installed. You can run `make` in the directory and it will generate `thesis.pdf`.

On Mac, it will open the PDF upon completion. Sublime Text users can just build it inside the editor (cmd + b for mac).

  ```
  $ cd path/to/your-tex-project
  $ make
  ```

Contact kuanhoong AT gmail DOT com if you have any questions or assistance or feedback. Reply may be delayed, thus patience is required!
