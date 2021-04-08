
library(xml2)
library(dplyr)

# ==========================================================================
# svg container
node_svg <- read_xml("<svg />")

xml_attrs(node_svg) <-
  c(version = "1.1", 
    xmlns ="http://www.w3.org/2000/svg",
    x ="0px", 
    y ="0px", 
    viewBox="0 0 1223.1 905.8", 
    style = "enable-background:new 0 0 1223.1 905.8;")

xml_attr(node_svg, "xmlns:xlink") <- "http://www.w3.org/1999/xlink" 
xml_attr(node_svg, "xml:space") <- "preserve"

# ==========================================================================
# styles
node_style <- read_xml("<style />")

str_styles <- 
  c("\n", 
    ".sa0{fill:#FFFFFF;}", 
    ".sa1{fill:none;stroke:#000000;stroke-width:0.3732;stroke-miterlimit:10;}", 
    ".sa2{fill:#FFF933;stroke:#000000;stroke-width:0.571;stroke-miterlimit:10;}", 
    ".sa3{stroke:#000000;stroke-width:0.571;stroke-miterlimit:10;}", 
    ".st4{font-family:'Helvetica-Light';}", 
    ".st5{font-size:22px;}",
    ".st6{font-family:'Helvetica';}",
    ".st7{font-size:25px;}",
    ".st8{fill:#FFFFFF;stroke:#000000;stroke-miterlimit:10;}",
    ".st9{fill:#FFFFFF;stroke:#000000;stroke-width:2;stroke-miterlimit:10;}",
    ".st10{fill:#DDDDDD;}",
    "\n") %>%
  paste0(collapse = "\n")

xml_text(node_style) <- str_styles
xml_attr(node_style, "type") <- "text/css"

# ==========================================================================


# background rectangle
node_grp_bg <- read_xml("<g />")
xml_attr(node_grp_bg, "id") <- "background_rectangle"

node_bg_rect <- read_xml("<rect />")

xml_attrs(node_bg_rect) <- 
  c(class = "sa0", x = "0", y = "0", width = "1223.1", height = "905.8")

xml_add_child(node_grp_bg , node_bg_rect)
# ==========================================================================
# warning symbol
node_grp_warning <- read_xml("<g />")
xml_attr(node_grp_warning, "id") <- "warning_symbol"

# ====
node_path_warning_a <- read_xml("<path />")
xml_attr(node_path_warning_a, "class") <- "sa1"

str_path <- 
  paste0("M27,853.8L27,853.8c-6.8,11.5,1.7,25.9,15.3,25.9l0,0c13.5,", 
  "0,22-14.4,15.3-25.9l0,0C50.6,842.3,33.7,842.3,27,853.8z")

xml_attr(node_path_warning_a, "d") <- str_path
# ====
node_path_warning_b <- read_xml("<path />")
xml_attr(node_path_warning_b, "class") <- "sa2"

str_path <- 
  paste0("M36.5,830.2l-25.6,43.5c-2.5,4.3,0.6,9.7,5.7,9.7h51.1c5.1,0,", 
  "8.2-5.4,5.7-9.7l-25.6-43.5C45.3,825.9,39,825.9,36.5,830.2z")

xml_attr(node_path_warning_b, "d") <- str_path  
# ====
node_path_warning_c <- read_xml("<path />")
xml_attr(node_path_warning_c, "class") <- "sa3"

str_path <- 
  paste0("M42.4,875.9h-0.8c-1.6,0-3-1.3-3-2.9l0,0c0-1.6,1.3-2.9,", 
  "3-2.9h0.8c1.6,0,3,1.3,3,2.9l0,0C45.3,874.5,44,875.9,42.4,875.9z")

xml_attr(node_path_warning_c, "d") <- str_path
# ====
node_path_warning_d <- read_xml("<path />")
xml_attr(node_path_warning_d, "class") <- "sa3"

str_path <- paste0("M42,867.9L42,867.9c-1.9,0-3.5-1.5-3.5-3.4V844c0-1.9,", 
  "1.5-3.4,3.5-3.4l0,0c1.9,0,3.5,1.5,3.5,3.4v20.5C45.3,866.4,43.8,867.9,42,867.9z")

xml_attr(node_path_warning_d, "d") <- str_path
# ====
# add paths to group
xml_add_child(node_grp_warning , node_path_warning_a)
xml_add_child(node_grp_warning , node_path_warning_b)
xml_add_child(node_grp_warning , node_path_warning_c)
xml_add_child(node_grp_warning , node_path_warning_d)

# ==========================================================================


