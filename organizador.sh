
# TXT files:



# PDF files:
readpdf(){
echo $( pdfinfo "$1/$2" | awk -f "awk/pdfinfo.awk")$2;
}

readImage(){
exiftool "$1/$2"| awk -f "awk/exiftoow.awk";
}

cleandate(){
  echo $1 | sed -e 's/ .*//' | sed -e 's/:/-/g'
}

cleanup(){
  echo "$1" | sed -e 's/[ )(\/\$<>!\W:]/_/g' 
}

cleanup "Nelson do Vale / &$< Teste";
for d in *; do 
  for f in $( ls $d) ; do
    extension=${f: -4};
    case $extension in
      #".pdf")
      #  readpdf "$d" "$f"
      #  break
      #  ;;
      #".txt")
      #  nome=$(head -1 $d/$f| sed -e 's/[\/ \W<>!\$)(#\"] */_/g')
      #  echo ${nome:0:50}$f
      #  break
      #  ;;
      ".png")
        readImage $d $f
        break
        ;;
      ".jpg")
        readImage $d $f
        break
        ;;
      *)
        ;;
    esac
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
