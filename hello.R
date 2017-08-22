# クラス定義
setClass(
  "Person",
  representation(
    name = "character",
    birth = "Date"
  ),
  prototype = list(
    name = as.character(NULL),
    birth = as.Date(as.character(NULL))
  )
)

ogiwara <- new("Person", name = "ogiwara", birth = as.Date("1999-05-30"))

print(ogiwara@name)

