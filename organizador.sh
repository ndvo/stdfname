base=$1
# TXT files:
readtxt(){
  nome=$(head -1 "$1/$2" );
  nome_limpo=$(cleanup $nome);
  echo ${nome_limpo:0:50}"___"$2| sed -e "s/.txt/$(replaceextension $1 $2)/"
}


# PDF files:
readpdf(){
  echo $( pdfinfo "$1/$2" | awk -f "awk/pdfinfo.awk")$2;
}

readImage(){
  exiftool "$1/$2"| awk -f "awk/exiftoow.awk";
}

cleandate(){
  return $1 | sed -e 's/ .*//' | sed -e 's/:/-/g'
}

cleanup(){
  echo "$1" | sed -re 's/\W+/_/g' 
}

replaceextension(){
  filetest=$(file -b "$1/$2");
  regex_txt="^(UTF-8 Unicode text|ASCII text|ISO-8859 text|Non-ISO extended-ASCII tex).*"
  regex_python="^Python script.*$" 
  regex_c="^C source.*$" 
  regex_cpp="^C\+\+ source.*$" 
  regex_html="^HTML document.*"
  regex_ppd="^PPD file.*"
  regex_svg="^SVG Scalable Vector Graphics image.*"
  regex_gmo="^GNU gettext message catalogue.*"
  regex_sgml="^exported SGML document.*"
  regex_sh="^(Bourne-Again shell script|POSIX shell script).*"
  regex_pod="^Perl POD document.*"
  regex_pm="^Perl5 module source.*"
  regex_sla="^Scribus Document.*"
  regex_pem="^PEM certificate.*"
  regex_xml="^XML documen.*"
  regex_java="^Java source.*"
  regex_tex="^TeX document.*"

  if [[ "${filetest}" =~ $regex_txt ]]; then
    extension=".txt";
  elif [[ "${filetest}" =~ $regex_python ]]; then 
    extension=".py";
  elif [[ "${filetest}" =~ $regex_c ]]; then 
    extension=".c";
  elif [[ "${filetest}" =~ $regex_cpp ]]; then 
    extension=".cpp";
  elif [[ "${filetest}" =~ $regex_html ]]; then 
    extension=".html";
  elif [[ "${filetest}" =~ $regex_ppd ]]; then 
    extension=".ppd";
  elif [[ "${filetest}" =~ $regex_svg ]]; then 
    extension=".svg";
  elif [[ "${filetest}" =~ $regex_gmo ]]; then 
    extension=".gmo";
  elif [[ "${filetest}" =~ $regex_sgml ]]; then 
    extension=".sgml";
  elif [[ "${filetest}" =~ $regex_pod ]]; then 
    extension=".pod";
  elif [[ "${filetest}" =~ $regex_pm ]]; then 
    extension=".pm";
  elif [[ "${filetest}" =~ $regex_sla ]]; then 
    extension=".sla";
  elif [[ "${filetest}" =~ $regex_pem ]]; then 
    extension=".pem";
  elif [[ "${filetest}" =~ $regex_xml ]]; then 
    extension=".xml";
  elif [[ "${filetest}" =~ $regex_sh ]]; then 
    extension=".sh";
  elif [[ "${filetest}" =~ $regex_java ]]; then 
    extension=".java";
  elif [[ "${filetest}" =~ $regex_tex ]]; then 
    extension=".tex";
  else
    extension=".txt";
  fi
  echo $extension
}

echo "Diretório a partir do qual recuperar nomes de arquivos: "$base
for d in $(ls $base); do 
  echo "Analisando diretório $d"
  for f in $( ls $base$d ) ; do
    extension=${f: -4};
    newdir=$(echo $extension| sed -re 's/.*\.//')
    #extract -VVVVVVVVVV "$base$d/$f"
    case $extension in
      ".pdf")
        readpdf "$base$d" "$f"
        break
        ;;
      ".txt")
        newname=$(readtxt "$base$d" $f);
        break
        ;;
      ".png")
        newname=$(readImage "$base$d" $f)
        break
        ;;
      ".jpg")
        newname=$(readImage "$base$d" $f)
        break
        ;;
      *)
        newname=$f
        ;;
    esac
    echo "mv \"$d/$f\" \"$newdir/$newname\""
	done
done





#Title:          Notas de lançamento do Debian 8 (jessie), PC 64 bits
#Creator:        DBLaTeX-0.3.5-2
#Producer:       XeTeX 0.99992
#CreationDate:   Sat May 14 13:56:30 2016 -03
#Tagged:         no
#UserProperties: no
#Suspects:       no
#Form:           none
#JavaScript:     no
#Pages:          53
#Encrypted:      no
#Page size:      595.28 x 841.89 pts (A4)
#Page rot:       0
#File size:      312341 bytes
#Optimized:      no
#PDF version:    1.5
#Tagged:         no
#UserProperties: no
#Suspects:       no
#Form:           none
#JavaScript:     no
#Pages:          6
#Encrypted:      no
#Page size:      558.071 x 789.272 pts
#Page rot:       0
#File size:      86936 bytes
#Optimized:      no
#PDF version:    1.4
