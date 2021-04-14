library(git2r)

library(dplyr)
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
    viewBox="0 0 1000 400", 
    style = "enable-background:new 0 0 1000 400;")

xml_attr(node_svg, "xmlns:xlink") <- "http://www.w3.org/1999/xlink" 
xml_attr(node_svg, "xml:space") <- "preserve"

# ==========================================================================
node_style <- read_xml("<style />")
str_styles <- 
  c("\n", 
    ".sz0{fill:#FFFFFF;}",
    ".sz1{font-family:'Helvetica-Light';}",
    ".sz2{font-size:55px;}",
    ".sz3{letter-spacing:1;}",
    ".sz4{font-size:23px;}",
    ".sz5{fill:#999999;}",
    ".sz6{font-size:36px;}",
    ".sz7{fill:#FF3300;}",
    ".sz8{fill:#666666;}",
    ".sz9{font-size:11px;}",
    ".sz10{fill:#E9C52B;}",
    ".sz11{fill:#1D1F1E;}",
    ".sz12{fill:#CC0C2E;}",
    ".sz13{fill:#11799F;}",
    ".sz14{fill:#FFFFFF;stroke:#000000;stroke-width:2;stroke-miterlimit:10;}",
    ".sz15{fill:#FFFFFF;stroke:#000000;stroke-miterlimit:10;}",
    ".sz13{fill:#000000;}",
    "\n") %>%
  paste0(collapse = "\n")

xml_text(node_style) <- str_styles
xml_attr(node_style, "type") <- "text/css"

# ==========================================================================
# background rectangle
node_grp_bg <- read_xml("<g />")
xml_attr(node_grp_bg, "id") <- "bg_rectangle"
node_bg_rect <- read_xml("<rect />")
xml_attrs(node_bg_rect) <- 
  c(class = "sz0", x = "0", y = "0", width = "1000", height = "400")
xml_add_child(node_grp_bg , node_bg_rect)
# ==========================================================================
# text bits
node_grp_text <- read_xml("<g />")
xml_attr(node_grp_text, "id") <- "text_items"

# ====
node_text_jer <- read_xml("<text />")
xml_attrs(node_text_jer) <- 
  c(transform = "matrix(1 0 0 1 16.5039 233.9004)",  class = "sz1 sz2 sz3")
xml_text(node_text_jer) <- "JOBKEEPER EMPLOYEE RETENTION"

# ====
node_text_date <- read_xml("<text />")
xml_attrs(node_text_date) <- 
  c(transform = "matrix(1 0 0 1 870.2004 354.2997)",  class = "sz1 sz4")
xml_text(node_text_date) <- "12.04.2021"

# ====
node_text_it <- read_xml("<text />")
xml_attrs(node_text_it) <- 
  c(transform = "matrix(1 0 0 1 13.8187 291.3903)",  class = "sz1 sz5 sz6")
xml_text(node_text_it) <- "INSIGHTS TEAM"

# ====
node_text_iuo <- read_xml("<text />")
xml_attrs(node_text_iuo) <- 
  c(transform = "matrix(1 0 0 1 15.2184 354.3002)",  class = "sz1 sz4 sz7")
xml_text(node_text_iuo) <- "OFFICIAL INTERNAL USE ONLY - DRAFT"

# ====
node_text_cmt <- read_xml("<text />")
xml_attrs(node_text_cmt) <- 
  c(transform = "matrix(1 0 0 1 80.6897 373.6092)",  class = "sz1 sz9 sz8")
xml_text(node_text_cmt) <- "2383934f150ab1fa5b37f50a75fb5bd0fd505a64"

# ====
node_text_git <- read_xml("<text />")
xml_attrs(node_text_git) <- 
  c(transform = "matrix(1 0 0 1 14.9998 373.6088)",  class = "sz1 sz9 sz13")
xml_text(node_text_git) <- "git commit:"

xml_add_child(node_grp_text, node_text_jer)
xml_add_child(node_grp_text, node_text_date)
xml_add_child(node_grp_text, node_text_it)
xml_add_child(node_grp_text, node_text_iuo)
xml_add_child(node_grp_text, node_text_cmt)
xml_add_child(node_grp_text, node_text_git)

# ==========================================================================
#  rectangles colorés
node_grp_rect <- read_xml("<g />")
xml_attr(node_grp_rect, "id") <- "coloured_rectangles"

node_rect_h_a <- read_xml("<rect />")
xml_attrs(node_rect_h_a) <- 
  c(x = "457", y ="97", class = "sz10", width = "72", height = "64")

node_rect_h_b <- read_xml("<rect />")
xml_attrs(node_rect_h_b) <- 
  c(x = "332", y ="97", class = "sz11", width = "72", height = "64")

node_rect_h_c <- read_xml("<rect />")
xml_attrs(node_rect_h_c) <- 
  c(x = "86", y ="97", class = "sz11", width = "72", height = "64")

node_rect_h_d <- read_xml("<rect />")
xml_attrs(node_rect_h_d) <- 
  c(x = "223", y ="97", class = "sz12", width = "72", height = "64")

node_rect_h_e <- read_xml("<rect />")
xml_attrs(node_rect_h_e) <- 
  c(x = "15", y ="97", class = "sz13", width = "72", height = "64")

node_rect_h_f <- read_xml("<rect />")
xml_attrs(node_rect_h_f) <- 
  c(x = "223", y ="20", class = "sz5", width = "72", height = "64")


xml_add_child(node_grp_rect, node_rect_h_a)
xml_add_child(node_grp_rect, node_rect_h_b)
xml_add_child(node_grp_rect, node_rect_h_c)
xml_add_child(node_grp_rect, node_rect_h_d)
xml_add_child(node_grp_rect, node_rect_h_e)
xml_add_child(node_grp_rect, node_rect_h_f)

# ==========================================================================
#  les lignes
node_grp_lines <- read_xml("<g />")
xml_attr(node_grp_lines, "id") <- "les_lignes"

node_line_top <- read_xml("<line />")
xml_attrs(node_line_top) <- 
  c(class = "sz14", x1 = "17.7", y1 = "8.1", x2 = "980.9", y2 = "8.1")

node_line_bottom <- read_xml("<line />")
xml_attrs(node_line_bottom) <- 
  c(class = "sz15", x1 = "17.7", y1 = "394.1",  x2 = "980.9", y2 = "394.1")

xml_add_child(node_grp_lines, node_line_top)
xml_add_child(node_grp_lines, node_line_bottom)
# ==========================================================================
# ==========================================================================



xml_add_child(node_svg , node_style)
xml_add_child(node_svg , node_grp_bg)
xml_add_child(node_svg , node_grp_text)
xml_add_child(node_svg , node_grp_rect)
xml_add_child(node_svg , node_grp_lines)

root <- xml_new_document() 
xml_add_child(root , node_svg)


str_path <- "/Users/zurich/Library/Mobile Documents/com~apple~CloudDocs/ato_pre_employment/automate_svg/header_automate.svg"
xml2::write_xml(root, str_path, options = c("no_declaration", "format") )



  
  

