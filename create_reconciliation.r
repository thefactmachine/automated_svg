
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
    ".sa14{fill:#FFFFFF;stroke:#000000;stroke-miterlimit:10;}",
    ".sa18{font-size:21px;}",
    ".sa19{fill:#CC0000;}",
    ".sa20{fill:#000000;}",
    ".sa30{fill:#999999;}",
    ".sa31{font-size:16px;}",
    ".sa32{font-size:39px;}",
    ".sa33{fill:none;}",
    ".sa34{font-size:20px;}",
    ".sa35{fill:#666666;}",
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
  c(transform = "matrix(1 0 0 1 775.6534  505.9075)" , class = "sa0 sa7 sa13")
xml_text(node_text_step3_red) <-  "423 K"

# ====
node_text_step4_blue <- read_xml("<text />")
xml_attrs(node_text_step4_blue) <- 
  c(transform = "matrix(1 0 0 1 474.5903 712.2468)" , class = "sa0 sa7 sa13")
xml_text(node_text_step4_blue) <-  "896 K"

# ====
node_text_step4_red <- read_xml("<text />")
xml_attrs(node_text_step4_red) <- 
  c(transform = "matrix(1 0 0 1 660.252 712.2469)", class = "sa0 sa7 sa13")
xml_text(node_text_step4_red) <-  "449 K"






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
# down arrows

node_grp_down_arrows <- read_xml("<g />")
xml_attr(node_grp_down_arrows, "id") <- "down_arrows"


node_arrow_line_1 <- read_xml("<line />")
xml_attrs(node_arrow_line_1) <- 
  c(class="sa14", x1 = "770.2",  y1 = "565.6",  x2 = "770.2",  y2 = "632.4")

node_arrow_pg_1 <- read_xml("<polygon />")
xml_attrs(node_arrow_pg_1) <- 
  c(class = "sa20", points = "765.2, 629.9 770.2, 638.6 775.2, 629.9")


node_arrow_line_2 <- read_xml("<line />")
xml_attrs(node_arrow_line_2) <- 
  c(class = "sa14", x1 = "881.5", y1 = "357.8",  x2 = "881.5",  y2 = "424.6")

node_arrow_pg_2 <- read_xml("<polygon />")
xml_attrs(node_arrow_pg_2) <- 
  c(class = "sa20", points="876.5, 422.1, 881.5, 430.8 886.5, 422.1")

xml_add_child(node_grp_down_arrows , node_arrow_line_1)
xml_add_child(node_grp_down_arrows , node_arrow_pg_1)
xml_add_child(node_grp_down_arrows , node_arrow_line_2)
xml_add_child(node_grp_down_arrows , node_arrow_pg_2) 

# ==========================================================================
# rectangle comments

node_text_rect_comments <- read_xml("<g />")
xml_attr(node_text_rect_comments, "id") <- "rectangle_comments"

# ====
node_text_a <- read_xml("<text />")
xml_attrs(node_text_a) <- 
  c(transform="matrix(1 0 0 1 411.8057 379.6733)", class="sa5 sa18")
xml_text(node_text_a) <- "STP record in December"

# ====
node_text_b <- read_xml("<text />")
xml_attrs(node_text_b) <- 
  c(transform = "matrix(1 0 0 1 894.6696 379.6734)" , class="sa5 sa18 sa19")
xml_text(node_text_b) <- "No STP record in December"

# ====
node_text_c <- read_xml("<text />")
xml_attrs(node_text_c) <- 
  c(transform = "matrix(1 0 0 1 776.8792 590.0461)", class="sa5 sa18")
xml_text(node_text_c) <- "Multiple jobs"

# ====
node_text_d <- read_xml("<text />")
xml_attrs(node_text_d) <- 
  c(transform = "matrix(1 0 0 1 413.3852 590.0463)", class="sa5 sa18")
xml_text(node_text_d) <- "One job in both periods"

# ====
node_text_e <- read_xml("<text />")
xml_attrs(node_text_e) <- 
  c(transform = "matrix(1 0 0 1 413.0571 797.5519)", class="sa5 sa18")
xml_text(node_text_e) <- "Industry changers"

# ====
node_text_f <- read_xml("<text />")
xml_attrs(node_text_f) <- 
  c(transform = "matrix(1 0 0 1 652.5934 797.5519)",  class="sa5 sa18")
xml_text(node_text_f) <- "Same industry"

# ========================
# pin to group

xml_add_child(node_text_rect_comments , node_text_a)
xml_add_child(node_text_rect_comments , node_text_b)
xml_add_child(node_text_rect_comments , node_text_c)
xml_add_child(node_text_rect_comments , node_text_d)
xml_add_child(node_text_rect_comments , node_text_e)
xml_add_child(node_text_rect_comments , node_text_f)


# ==========================================================================
# disclaimer

node_grp_disclaimer <- read_xml("<g />")
xml_attr(node_grp_disclaimer, "id") <- "disclaimer"

# ====
node_discl_rect <- read_xml("<rect />")
xml_attrs(node_discl_rect) <- 
  c(x="114.2", y="844.4", class="sa4 sa0", width = "735.1", height = "47")

# ====
node_discl_text <- read_xml("<text />")
xml_attrs(node_discl_text) <- 
  c(transform = "matrix(1.0183 0 0 1 114.1582 855.917)")
# ====
str_class_discl <- "sa4 sa30 sa31"

# ====
node_discl_tsp_a <- read_xml("<tspan />")
xml_attrs(node_discl_tsp_a) <- 
  c( x="0", y="0", class = str_class_discl)
xml_text(node_discl_tsp_a) <- 
  paste0("Rounding errors. Some of the totals above may be slightly different ",  
         "to the underlying detail. This is")

# ====
node_discl_tsp_b <- read_xml("<tspan />")
xml_attrs(node_discl_tsp_b) <- 
  c( x="704.2", y="0", class = str_class_discl)
xml_text(node_discl_tsp_b) <- ""

# ====
node_discl_tsp_c <- read_xml("<tspan />")
xml_attrs(node_discl_tsp_c) <- 
  c( x="0", y="19.2", class = str_class_discl)
xml_text(node_discl_tsp_c) <- 
  paste0("because the numbers are displayed using only two decimal places ",  
         "rather than their full precision.")

# ========================
# bolt the three tspan elements to the text element
xml_add_child(node_discl_text , node_discl_tsp_a)
xml_add_child(node_discl_text , node_discl_tsp_b)
xml_add_child(node_discl_text , node_discl_tsp_c)

# now stick the text and rectangle to the group element
xml_add_child(node_grp_disclaimer , node_discl_rect)
xml_add_child(node_grp_disclaimer , node_discl_text)
# ==========================================================================
# step_headings
node_grp_step_headings <- read_xml("<g />")
xml_attr(node_grp_step_headings, "id") <- "step_headings"

str_s_heading_class <- "sa32 sa20"

# ====
node_step_heading_1 <- read_xml("<text />")
xml_attrs(node_step_heading_1) <- 
  c(transform = "matrix(1 0 0 1 7.6582 49.4501)", class = str_s_heading_class)
xml_text(node_step_heading_1) <- "1. Starting point"

# ====
node_step_heading_2 <- read_xml("<text />")
xml_attrs(node_step_heading_2) <- 
  c(transform = "matrix(1 0 0 1 7.6582 256.4501)", class = str_s_heading_class)
xml_text(node_step_heading_2) <- "2. December STP"

# ====
node_step_heading_3 <- read_xml("<text />")
xml_attrs(node_step_heading_3) <- 
  c(transform = "matrix(1 0 0 1 7.6582 463.4501)", class = str_s_heading_class)
xml_text(node_step_heading_3) <- "3. One pair of jobs"

# ====
node_step_heading_4 <- read_xml("<text />")
xml_attrs(node_step_heading_4) <- 
  c(transform = "matrix(1 0 0 1 7.6582 670.4501)" , class = str_s_heading_class)
xml_text(node_step_heading_4) <- "4. Industry changers"

# ========================

xml_add_child(node_grp_step_headings , node_step_heading_1)
xml_add_child(node_grp_step_headings , node_step_heading_2)
xml_add_child(node_grp_step_headings , node_step_heading_3)
xml_add_child(node_grp_step_headings , node_step_heading_4)
# ==========================================================================
# step 1 text
node_grp_step_1_text <- read_xml("<g />")
xml_attr(node_grp_step_1_text, "id") <- "step_1_text"

# ====
node_rect_step_1_text  <- read_xml("<rect />") 
xml_attrs(node_rect_step_1_text) <- 
  c(x = "8.5", y = "79", class = "sa33", width = "356.6", height = "79.8")
  
# ====
node_text_step_1_text  <- read_xml("<text />") 
xml_attrs(node_text_step_1_text) <- 
  c(transform = "matrix(1 0 0 1 8.52 93.4038)")

str_ts_step <- "sa4 sa34 sa35"
# ====
node_text_step_1_ts1  <- read_xml("<tspan />") 
xml_attrs(node_text_step_1_ts1) <- 
  c(x="0", y="0", class = str_ts_step)
xml_text(node_text_step_1_ts1) <- "Jobs that existed in February but not in"

# ====
node_text_step_1_ts2  <- read_xml("<tspan />") 
xml_attrs(node_text_step_1_ts2) <- 
  c(x="0", y="24", class = str_ts_step)
xml_text(node_text_step_1_ts2) <- "December. 3.26 million jobs distributed"

# ====
node_text_step_1_ts3  <- read_xml("<tspan />") 
xml_attrs(node_text_step_1_ts3) <- 
  c(x="0", y="48", class = str_ts_step)
xml_text(node_text_step_1_ts3) <- "between 2.96 million people."

# ========================

xml_add_child(node_text_step_1_text , node_text_step_1_ts1)
xml_add_child(node_text_step_1_text , node_text_step_1_ts2)
xml_add_child(node_text_step_1_text , node_text_step_1_ts3)

xml_add_child(node_grp_step_1_text , node_rect_step_1_text)
xml_add_child(node_grp_step_1_text , node_text_step_1_text)
# ==========================================================================
# step 2 text
node_grp_step_2_text <- read_xml("<g />")
xml_attr(node_grp_step_2_text, "id") <- "step_2_text"

# ====
node_rect_step_2_text  <- read_xml("<rect />") 
xml_attrs(node_rect_step_2_text) <- 
  c(x ="8.5", y ="286.3", class ="sa33", width ="356.6", height ="79.8")

# ====
node_text_step_2_text  <- read_xml("<text />") 
xml_attrs(node_text_step_2_text) <- 
  c(transform = "matrix(1 0 0 1 8.52 300.7269)")

str_ts_step <- "sa4 sa34 sa35"
# ====
node_text_step_2_ts1  <- read_xml("<tspan />") 
xml_attrs(node_text_step_2_ts1) <- 
  c(x="0", y="0", class = str_ts_step)
xml_text(node_text_step_2_ts1) <- "Of the 2.96 million people, 1.77 million"

# ====
node_text_step_2_ts2  <- read_xml("<tspan />") 
xml_attrs(node_text_step_2_ts2) <- 
  c(x="0", y="24", class = str_ts_step)
xml_text(node_text_step_2_ts2) <- "had a December STP record."

# ====
node_text_step_2_ts3  <- read_xml("<tspan />") 
xml_attrs(node_text_step_2_ts3) <- 
  c(x="0", y="48", class = str_ts_step)
xml_text(node_text_step_2_ts3) <- "1.20 million had no December record."

# ========================

xml_add_child(node_text_step_2_text , node_text_step_2_ts1)
xml_add_child(node_text_step_2_text , node_text_step_2_ts2)
xml_add_child(node_text_step_2_text , node_text_step_2_ts3)

xml_add_child(node_grp_step_2_text , node_rect_step_2_text)
xml_add_child(node_grp_step_2_text , node_text_step_2_text)
# ==========================================================================
# step 3 text
node_grp_step_3_text <- read_xml("<g />")
xml_attr(node_grp_step_3_text, "id") <- "step_3_text"

# ====
node_rect_step_3_text  <- read_xml("<rect />") 
xml_attrs(node_rect_step_3_text) <- 
  c(x="8.5", y="492.7", class="sa33", width = "373.8",  height = "83.2")

# ====
node_text_step_3_text  <- read_xml("<text />") 
xml_attrs(node_text_step_3_text) <- 
  c(transform = "matrix(1 0 0 1 8.52 507.0745)")

str_ts_step <- "sa4 sa34 sa35"
# ====
node_text_step_3_ts1  <- read_xml("<tspan />") 
xml_attrs(node_text_step_3_ts1) <- 
  c(x="0", y="0", class = str_ts_step)
xml_text(node_text_step_3_ts1) <- "423 thousand people had multiple jobs in"

# ====
node_text_step_3_ts2  <- read_xml("<tspan />") 
xml_attrs(node_text_step_3_ts2) <- 
  c(x="0", y="24", class = str_ts_step)
xml_text(node_text_step_3_ts2) <- "either February or December and cannot"

# ====
node_text_step_3_ts3  <- read_xml("<tspan />") 
xml_attrs(node_text_step_3_ts3) <- 
  c(x="0", y="48", class = str_ts_step)
xml_text(node_text_step_3_ts3) <- "be associated with a single industry."

# ========================

xml_add_child(node_text_step_3_text , node_text_step_3_ts1)
xml_add_child(node_text_step_3_text , node_text_step_3_ts2)
xml_add_child(node_text_step_3_text , node_text_step_3_ts3)

xml_add_child(node_grp_step_3_text , node_rect_step_3_text)
xml_add_child(node_grp_step_3_text , node_text_step_3_text)

# ==========================================================================
# step 4 text
node_grp_step_4_text <- read_xml("<g />")
xml_attr(node_grp_step_4_text, "id") <- "step_4_text"

# ====
node_rect_step_4_text  <- read_xml("<rect />") 
xml_attrs(node_rect_step_4_text) <- 
  c(x = "8.5", y = "702.2", class = "sa33",  width = "373.8", height ="83.2")

# ====
node_text_step_4_text  <- read_xml("<text />") 
xml_attrs(node_text_step_4_text) <- 
  c(transform = "matrix(1 0 0 1 8.52 716.5844)")

str_ts_step <- "sa4 sa34 sa35"
# ====
node_text_step_4_ts1  <- read_xml("<tspan />") 
xml_attrs(node_text_step_4_ts1) <- 
  c(x="0", y="0", class = str_ts_step)
xml_text(node_text_step_4_ts1) <- "896 thousand people changed industries"

# ====
node_text_step_4_ts2  <- read_xml("<tspan />") 
xml_attrs(node_text_step_4_ts2) <- 
  c(x="0", y="24", class = str_ts_step)
xml_text(node_text_step_4_ts2) <- "while 449 thousand people remained in the"

# ====
node_text_step_4_ts3  <- read_xml("<tspan />") 
xml_attrs(node_text_step_4_ts3) <- 
  c(x="0", y="48", class = str_ts_step)
xml_text(node_text_step_4_ts3) <- "same industry."

# ========================

xml_add_child(node_text_step_4_text , node_text_step_4_ts1)
xml_add_child(node_text_step_4_text , node_text_step_4_ts2)
xml_add_child(node_text_step_4_text , node_text_step_4_ts3)

xml_add_child(node_grp_step_4_text , node_rect_step_4_text)
xml_add_child(node_grp_step_4_text , node_text_step_4_text)




# ==========================================================================
# put humpty dumpty back together....append groups to svg element
# need to work from the branches back to the root

xml_add_child(node_svg , node_style)
xml_add_child(node_svg , node_grp_bg)
xml_add_child(node_svg , node_grp_warning)
xml_add_child(node_svg , node_grp_data_rect)
xml_add_child(node_svg , node_grp_step1_arrows)
xml_add_child(node_svg , node_grp_rect_text)
xml_add_child(node_svg , node_grp_down_arrows)
xml_add_child(node_svg , node_text_rect_comments)
xml_add_child(node_svg , node_grp_disclaimer)
xml_add_child(node_svg , node_grp_step_headings)
xml_add_child(node_svg , node_grp_step_1_text)
xml_add_child(node_svg , node_grp_step_2_text)
xml_add_child(node_svg , node_grp_step_3_text)
xml_add_child(node_svg , node_grp_step_4_text)





root <- xml_new_document() 
xml_add_child(root , node_svg)



str_path <- "/Users/zurich/Library/Mobile Documents/com~apple~CloudDocs/ato_pre_employment/automate_svg/reconciliation.svg"
xml2::write_xml(root, str_path, options = c("no_declaration", "format") )






