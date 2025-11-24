var documenterSearchIndex = {"docs":
[{"location":"#PlantUML-package","page":"Description","title":"PlantUML package","text":"Allows to render PlantUML diagrams with Julia","category":"section"},{"location":"#Usage","page":"Description","title":"Usage","text":"using PlantUML\n\numl1 = puml\"A->B\"  # string handy syntax\numl2 = PUML(\"A->B\") # Dynamic creation of the object\n\nsvg = repr(MIME(\"image/svg+xml\", uml1))\npng = repr(MIME(\"image/png\", uml2))","category":"section"}]
}
