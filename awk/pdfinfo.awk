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
