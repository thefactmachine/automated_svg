library(xml2)
# https://cran.r-project.org/web/packages/xml2/vignettes/modification.html


# You can avoid this by explicitly selecting the text node.
x <- read_xml("<p>This is some text. This is <b>bold!</b></p>")

text_only <- xml_find_all(x, "//text()")


# xml_text returns a character vector
x <- read_xml("<p>This is some text. This is <b>bold!</b></p>")
xml_text(x)


x <- read_xml("<p>This is some text. This is <b>bold!</b></p>")
xml_structure(x)


# add an attribute
x <- read_xml("<a href='invalid!'>xml2</a>")
xml_attr(x, "href") <- "https://github.com/r-lib/xml2"
xml_attr(x, "href")
cat(as.character(x))

# add many attributes
xml_attrs(x) <- c(id = "xml2", href = "https://github.com/r-lib/xml2")
xml_attrs(x)
cat(as.character(x))

# how to add a name space
xml_attr(x, "xmlns:bar") <- "http://bar"
cat(as.character(x))

# get and set a name
x <- read_xml("<a><b/></a>")
xml_name(x)
xml_name(x) <- "mark"
cat(as.character(x))

# ========================================================

# replace existing nodes
x <- read_xml("<parent><child>1</child><child>2<child>3</child></child></parent>")
cat(as.character(x))

children <- xml_children(x)
cat(as.character(children))

# t1 is child 1
t1 <- children[[1]]
cat(as.character(t1))

t2 <- children[[2]]
cat(as.character(t2))

# t3 is child 3
t3 <- xml_children(children[[2]])[[1]]
cat(as.character(t3))

xml_replace(t1, t3)
# child 1 has become child 3
cat(as.character(x))

# ========================================================
# add a child

x <- read_xml("<parent><child>1</child><child>2<child>3</child></child></parent>")
cat(as.character(x))

children <- xml_children(x)
t1 <- children[[1]]
t2 <- children[[2]]
t3 <- xml_children(children[[2]])[[1]]
cat(as.character(t3))

xml_add_child(t1, t3)
cat(as.character(x))

xml_add_child(t1, read_xml("<test/>"))
# ========================================================

d <- xml_new_root("sld",
                  xmlns = "http://www.o.net/sld",
                  "xmlns:ogc" = "http://www.o.net/ogc",
                  "xmlns:se" = "http://www.o.net/se",
                  version = "1.1.0") %>%
  xml_add_child("layer") %>%
  xml_add_child("se:Name", "My Layer") %>%
  xml_root()

d
cat(as.character(d))








root <- xml_new_document() %>% xml_add_child("svg")




root %>% 
  xml_add_child("a1", x = "1", y = "2") %>% 
  xml_add_child("b") %>% 
  xml_add_child("c") 



root %>% 
  xml_add_child("a2") %>% 
  xml_add_sibling("a3") %>% 
  invisible()
cat(as.character(root))
#> <!--?xml version="1.0"?-->
#> <root><a1 x="1" y="2"><b><c></c></b></a1><a2><a3></a3></a2></root>