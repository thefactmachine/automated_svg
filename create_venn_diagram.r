
library(xml2)
library(dplyr)

node_svg <- read_xml("<svg />")

xml_attrs(node_svg) <-
  c(version = "1.1", 
    id = "Layer_1",
    xmlns ="http://www.w3.org/2000/svg",
    x ="0px", 
    y ="0px", 
    viewBox="0 0 1341 520", 
    style = "enable-background:new 0 0 1341 520;")

xml_attr(node_svg, "xmlns:xlink") <- "http://www.w3.org/1999/xlink" 
xml_attr(node_svg, "xml:space") <- "preserve"

# ===== style


node_style <- read_xml("<style />")

str_styles <- 
  c("\n", 
    ".st0{fill:#2E7CB6;}", 
    ".st1{fill:#56B070;}", 
    ".st2{fill:#0033CC;}", 
    ".st3{fill:#1D354C;}", 
    ".st4{font-family:'Helvetica-Light';}", 
    ".st6{font-family:'Helvetica';}",
    ".st7{font-size:25px;}",
    ".st8{fill:#FFFFFF;stroke:#000000;stroke-miterlimit:10;}",
    ".st9{fill:#FFFFFF;stroke:#000000;stroke-width:2;stroke-miterlimit:10;}"
    "\n") %>%
  paste0(collapse = "\n")

xml_text(node_style) <- str_styles
xml_attr(node_style, "type") <- "text/css"


# ===== add to svg ====

xml_add_child(node_svg , node_style)


# ===== add to svg ====

node_group_venn <- read_xml("<g />")
xml_attr(node_group_venn, "id") <- "main_venn_diagram" 

# make the start circle
node_circle_st <- read_xml("<circle />") 
xml_attrs(node_circle_st) <- c(id = "main_start_circle", class = "st1", 
                               cx = "244.8", cy = "262.8", r = "239.2")


# make the end circle
node_circle_end <- read_xml("<circle />") 
xml_attrs(node_circle_end) <- c(id = "main_end_circle", class = "st0", 
                                cx ="392.2", cy = "262.8", r = "239.2")

# make the intersection
node_path_is <- read_xml("<path />") 
xml_attr(node_path_is, "id") <- "main_intersection" 
xml_attr(node_path_is, "class") <- "st2" 
str_path <- "M484,262.8c0,106.4-69.5,196.5-165.5,227.6C222.5,459.3,153,369.2,153,262.8S222.5,66.3,318.5,35.2C414.5,66.3,484,156.4,484,262.8z"
xml_attr(node_path_is, "d") <- str_path

# paste the bits together
xml_add_child(node_group_venn , node_circle_st)
xml_add_child(node_group_venn , node_circle_end)
xml_add_child(node_group_venn , node_path_is)

xml_add_child(node_svg , node_group_venn)

# =========================================
# legend ==================================
#  ========================================

node_group_legend <- read_xml("<g />")
xml_attr(node_group_legend, "id") <- "legend" 


# make the intersection
node_path_ldg_is <- read_xml("<path />") 
xml_attr(node_path_ldg_is, "id") <- "legend_intersection" 
xml_attr(node_path_ldg_is, "class") <- "st3" 
str_path <- "M726.9,230c-9.2,2.5-16,11-16,21c0,9.3,5.9,17.3,14.1,20.4c9.2-2.5,16-11,16-21C741.1,241.1,735.2,233.1,726.9,230z"
xml_attr(node_path_ldg_is, "d") <- str_path

# make the start circle
node_circle_lgd_st <- read_xml("<circle />") 
xml_attrs(node_circle_lgd_st) <- c(id = "legend_start_circle", class = "st1", 
                               cx = "724.3", cy = "115", r = "20")

# make the end circle
node_circle_lgd_end <- read_xml("<circle />") 
xml_attrs(node_circle_lgd_end) <- c(id = "legend_end_circle", class = "st0", 
                                   cx = "755.3", cy = "185", r = "20")

# make the end only
node_path_ldg_end_only <- read_xml("<path />") 
xml_attr(node_path_ldg_end_only, "id") <- "legend_end_only" 
xml_attr(node_path_ldg_end_only, "class") <- "st0" 
str_path <- "M741.2,438.2c-2.3,0-4.5,0.3-6.5,0.9c8.9,3.1,15.4,11.6,15.4,21.5c0,10.3-6.9,19-16.3,21.8c2.3,0.8,4.8,1.2,7.4,1.2c12.6,0,22.8-10.2,22.8-22.8S753.7,438.2,741.2,438.2z"
xml_attr(node_path_ldg_end_only, "d") <- str_path


# make the start only
node_path_ldg_s_only <- read_xml("<path />") 
xml_attr(node_path_ldg_s_only, "id") <- "legend_start_only" 
xml_attr(node_path_ldg_s_only, "class") <- "st1" 
str_path <- "M721.5,398.7c0-9.5,5.1-17.5,12.1-20.1c-1.7-0.7-3.6-1.1-5.5-1.1c-9.3,0-16.9,9.4-16.9,21s7.6,21,16.9,21c1.7,0,3.3-0.3,4.8-0.9C726.3,415.7,721.5,407.9,721.5,398.7z"
xml_attr(node_path_ldg_s_only, "d") <- str_path

# staple things together

xml_add_child(node_group_legend , node_path_ldg_is)
xml_add_child(node_group_legend , node_circle_lgd_st)
xml_add_child(node_group_legend , node_circle_lgd_end)
xml_add_child(node_group_legend , node_path_ldg_end_only)
xml_add_child(node_group_legend , node_path_ldg_s_only)

root <- xml_new_document() 

xml_add_child(root , node_svg)
xml_add_child(root , node_group_legend)

# ==========================================================================
# text pieces ==============================================================
# ==========================================================================


fn_create_text <- function(y_pos, str_text)  {
  node_txt <- read_xml("<text />") 
  str_mat_stem <- "matrix(1 0 0 1 821.5898"
  str_mat_fin <- paste0(str_mat_stem, " ", y_pos, ")")
  xml_attr(node_txt, "transform") <- str_mat_fin
  xml_attr(node_txt, "class") <- "st4 st5"
  xml_text(node_txt) <- str_text
  return(node_txt)
}

# Bolt these onto the root element
fn_create_text(120.223, "Start") %>% xml_add_child(root, .)
fn_create_text(189.481, "Finish") %>% xml_add_child(root, .)
fn_create_text(255.120, "Start and finish") %>% xml_add_child(root, .)
fn_create_text(402.499, "Start only") %>% xml_add_child(root, .)
fn_create_text(466.626, "Finish only") %>% xml_add_child(root, .)

fn_create_number <- function(y_pos, str_text)  {
  node_txt <- read_xml("<text />") 
  str_mat_stem <- "matrix(1 0 0 1 1180"
  str_mat_fin <- paste0(str_mat_stem, " ", y_pos, ")")
  xml_attr(node_txt, "text-anchor") <- "end"
  xml_attr(node_txt, "transform") <- str_mat_fin
  xml_attr(node_txt, "class") <- "st4 st5"
  xml_text(node_txt) <- str_text
  return(node_txt)
}


fn_create_number(120.223, "11,496,977") %>% xml_add_child(root, .)
fn_create_number(189.481, "12,337,477") %>% xml_add_child(root, .)
fn_create_number(255.120, "8,232,398") %>% xml_add_child(root, .)
fn_create_number(402.499, "3,264,579") %>% xml_add_child(root, .)
fn_create_number(466.626, "4,105,079") %>% xml_add_child(root, .)




str_path <- "/Users/zurich/Library/Mobile Documents/com~apple~CloudDocs/ato_pre_employment/automate_svg/r_test.svg"

xml2::write_xml(root, str_path)

