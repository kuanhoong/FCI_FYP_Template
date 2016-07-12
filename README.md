# FCI FYP Template

This is an *unofficial* template for FCI FYP Report. 

*This template is modified from IPS Postgraduate Thesis template. (Credit to: Lim Lian Tze)*

## For Windows

1. Install [MikTex](http://miktex.org/download) and Install TexMaker 
2. Open and edit thesis.tex file. Edit the `\author`, `\title`, `\submissionyear`, `\submissionmonth`, `\degree`, `\major`, `\session` accordingly.
3. Edit the rest of the files accordingly.
4. To include a new chapter, simply create a new `.tex` file and make sure you include the link to the file to `thesis.tex` by including the command `\include{newchapter}`

## For OSX/macOS

1. Install [MacTex](https://tug.org/mactex/).
2. Use your terminal to compile:
  
  ```
  $ cd path/to/your_fyp
  $ pdflatex thesis.tex
  ```

Contact kuanhoong AT gmail DOT com if you have any questions or assistance or feedback. Reply may be delayed, thus patience is required!
