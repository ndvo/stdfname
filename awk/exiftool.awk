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
