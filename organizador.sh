
# TXT files:



# PDF files:
readpdf(){
read -d '' awkscript << 'EOF'
BEGIN {
  FS=":\s*"
  OFS="__"
}
{
  if ($1 == "Title"){
    title=$2
  }
  if ($1 == "Creator"){
    author=$2
  }
  if ($1 == "CreationDate"){
    creation=$2
  }
}
END{
  gsub(/^[ \t]+/, "", title);
  gsub(/[ \t]+/, "_", title);
  gsub(/^[ \t]+/, "", author);
  gsub(/[ \t]+/, "_", author);
  gsub(/^[ \t]+/, "", creation);
  gsub(/[ \t]+/, "_", creation);
  print title, author, creation
}
EOF
echo $( pdfinfo "$1/$2" | awk  -e "$awkscript" )$2;
}

readImage(){
read -d '' awkscript << 'EOF'
function clean_date(d){
  gsub(/ .*/, "", d)
  gsub(/:/, "-", d)
  return d
}
BEGIN{
  FS="  *:  *"
  OFS="_" } {
  if ($1 ~ "Software\s*"){
    software=$2
  }
  if ($1 ~ "Create Date\s*"){
    create_date=$2
  }
  if ($1 ~ "Categories\s*"){
    categories=$2
  }
  if ($1 ~ "File Source\s*"){
    file_source=$2
  }
  if ($1 ~ "Make\s*"){
    make=$2
  }
  if ($1 ~ "Camera Model Name\s*"){
    camera_model_name=$2
  }
  if ($1 ~ "Scene Capture Type\s*"){
    scene_capture_type=$2
  }
  if ($1 ~ "Date/Time Original\s*" ){
    datetime = $2
  }
  if ($1 ~ "Image Size\s*" ){
    size = $2
  }
  if ($1 ~ "File Type\s*" ){
    type = $2
  }
  if ($1 ~ "Creator Tool\s*"){
    tool = $2
  }
}
END{
  if (create_date == ""){
    date = datetime
  }else{
    date = create_date
  }
  if (camera_model_name == ""){
    origin="image/"
  }else{
    origin="photo/"
  }
  if (camera_model_name == ""){
    tool = tool
  }else{
    tool = file_source+"_"+make+"_"+camera_model_name+"_"+scene_capture_type
  }
  #categories
  print origin, clean_date(date), tool, size, type
}
EOF
#identify -verbose "$1/$2"| awk -e "$awkscript";
exiftool "$1/$2"| awk -e "$awkscript" ;
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
