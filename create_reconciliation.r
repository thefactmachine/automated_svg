
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
    ".sa9{fill:#FF0000;}",
    ".sa10{fill:#337DB4;}",
    ".sa12{fill:none;stroke:#FFFFFF;stroke-width:3;stroke-miterlimit:10;}",
    ".sa13{font-size:39px;}",
    ".sa20{fill:#000000;}",
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
# rectangles
node_grp_data_rect <- read_xml("<g />")
xml_attr(node_grp_data_rect, "id") <- "data_rectangles"

# ====
node_rect_s1 <- read_xml("<rect />")

xml_attrs(node_rect_s1) <- 
c(x="413.1", y="23.2", class = "sa20", width = "796.1", height = "120")

# ========================
# step 2
node_rect_s2_blue <- read_xml("<rect />")

xml_attrs(node_rect_s2_blue) <- 
  c(x = "413.1", y = "230.2", class = "sa10", width = "468.7", height = "120")
# ====
node_rect_s2_red <- read_xml("<rect />")

xml_attrs(node_rect_s2_red) <- 
  c(x = "881.3", y = "230.2", class = "sa9", width = "326.4", height = "120")
# ========================
# step 3
node_rect_s3_blue <- read_xml("<rect />")
xml_attrs(node_rect_s3_blue) <- 
  c(x = "413.1", y = "437.2", class = "sa10", width = "357.2", height = "120")
# ====
node_rect_s3_red <- read_xml("<rect />")
xml_attrs(node_rect_s3_red) <- 
  c( x="770.3", y="437.2", class="sa9", width="111.5", height="120")

# ========================
# step 4
node_rect_s4_blue <- read_xml("<rect />")
xml_attrs(node_rect_s4_blue) <- 
  c(x = "413.1",  y = "645.2",  class = "sa10",  width = "237.8", height = "120")

# ====
node_rect_s4_red <- read_xml("<rect />")
xml_attrs(node_rect_s4_red) <- 
  c(x = "649.9",  y = "645.2",  class = "sa9",  width = "120.4",  height = "120")
# ========================
# pin the rectangles to the group
xml_add_child(node_grp_data_rect , node_rect_s1)
xml_add_child(node_grp_data_rect , node_rect_s2_blue)
xml_add_child(node_grp_data_rect , node_rect_s2_red)
xml_add_child(node_grp_data_rect , node_rect_s3_blue)
xml_add_child(node_grp_data_rect , node_rect_s3_red)
xml_add_child(node_grp_data_rect , node_rect_s4_blue)
xml_add_child(node_grp_data_rect , node_rect_s4_red)

# ==========================================================================
# arrows step 1
node_grp_step1_arrows <- read_xml("<g />")
xml_attr(node_grp_step1_arrows, "id") <- "step_1_arrows"

node_arrow_1_left_pg <- read_xml("<polygon />")
xml_attrs(node_arrow_1_left_pg) <- 
  c(class="sa0", points= "459.7, 70.7 439.9, 82.2 459.7, 93.7")

node_arrow_1_left_line <- read_xml("<line />")
xml_attrs(node_arrow_1_left_line) <- 
  c(class="sa12", x1 = "612.1", y1 = "82.2", x2 = "456.5", y2 = "82.2")

node_arrow_1_right_pg <- read_xml("<polygon />")
xml_attrs(node_arrow_1_right_pg) <- 
  c(class="sa0", points = "1168.4, 93.7 1188.3, 82.2 1168.4, 70.7")

node_arrow_1_right_line <- read_xml("<line />")
xml_attrs(node_arrow_1_right_line) <- 
  c(class = "sa12", x1 = "1016.1", y1 = "82.2", x2="1171.8", y2 = "82.2")

xml_add_child(node_grp_step1_arrows , node_arrow_1_left_pg)
xml_add_child(node_grp_step1_arrows , node_arrow_1_left_line)
xml_add_child(node_grp_step1_arrows , node_arrow_1_right_pg)
xml_add_child(node_grp_step1_arrows , node_arrow_1_right_line)

# ==========================================================================
# rectangle text

node_grp_rect_text<- read_xml("<g />")
xml_attr(node_grp_rect_text, "id") <- "rectangle_text"

# ====
node_text_step1 <- read_xml("<text />")
xml_attrs(node_text_step1) <- 
  c(transform = "matrix(1 0 0 1 648.4478 92.5786)", class = "sa0 sa7 sa13")
xml_text(node_text_step1) <-  "2.96 million people"

# ====
node_text_step2_blue <- read_xml("<text />")
xml_attrs(node_text_step2_blue) <- 
  c(transform = "matrix(1 0 0 1 588.5901 296.9075)", class = "sa0 sa7 sa13")
xml_text(node_text_step2_blue) <-  "1.77 M"

# ====
node_text_step2_red <- read_xml("<text />")
xml_attrs(node_text_step2_red) <- 
  c(transform = "matrix(1 0 0 1 985.5903 296.9078)", class = "sa0 sa7 sa13")
xml_text(node_text_step2_red) <-  "1.20 M"

# ====
node_text_step3_blue <- read_xml("<text />")
xml_attrs(node_text_step3_blue) <- 
  c(transform = "matrix(1 0 0 1 532.5903 505.9073)" , class = "sa0 sa7 sa13")
xml_text(node_text_step3_blue) <-  "1.34 M"

# ====
node_text_step3_red <- read_xml("<text />")
xml_attrs(node_text_step3_red) <- 
  c(transform = "matrix(1 0 0 1 791.6534 505.9075)" , class = "sa0 sa7 sa13")
xml_text(node_text_step3_red) <-  "0.42"

# ====
node_text_step4_blue <- read_xml("<text />")
xml_attrs(node_text_step4_blue) <- 
  c(transform = "matrix(1 0 0 1 474.5903 712.2468)" , class = "sa0 sa7 sa13")
xml_text(node_text_step4_blue) <-  "0.89 M"

# ====
node_text_step4_red <- read_xml("<text />")
xml_attrs(node_text_step4_red) <- 
  c(transform = "matrix(1 0 0 1 676.2523 712.2469)", class = "sa0 sa7 sa13")
xml_text(node_text_step4_red) <-  "0.45"

# ========================
# pin to group
xml_add_child(node_grp_rect_text , node_text_step1)

xml_add_child(node_grp_rect_text , node_text_step2_blue)
xml_add_child(node_grp_rect_text , node_text_step2_red)

xml_add_child(node_grp_rect_text , node_text_step3_blue)
xml_add_child(node_grp_rect_text , node_text_step3_red)

xml_add_child(node_grp_rect_text , node_text_step4_blue)
xml_add_child(node_grp_rect_text , node_text_step4_red)

# ==========================================================================
# put humpty dumpty back together....append groups to svg element
# need to work from the branches back to the root

xml_add_child(node_svg , node_style)
xml_add_child(node_svg , node_grp_bg)
xml_add_child(node_svg , node_grp_warning)
xml_add_child(node_svg , node_grp_data_rect)
xml_add_child(node_svg , node_grp_step1_arrows)
xml_add_child(node_svg , node_grp_rect_text)

root <- xml_new_document() 
xml_add_child(root , node_svg)

str_path <- "/Users/markthekoala/Library/Mobile Documents/com~apple~CloudDocs/automated_svg/reconciliation.svg"
xml2::write_xml(root, str_path, options = c("no_declaration", "format") )






