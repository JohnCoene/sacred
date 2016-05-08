
# ============================= BIBLE =================================== #
# from http://www.sacred-texts.com/bib/osrc/
bible <- readLines("kjvdat.txt")
kingjamesraw <- bible # keep raw
# extract verse
verse <- regmatches(bible, gregexpr("^[[:alnum:]]+\\|[0-9]+\\|[0-9]+\\|",
                                   bible))
books <- regmatches(bible, gregexpr("^[[:alnum:]]+",bible)) # get book abbrv
table <- data.frame(Verse = as.vector(do.call("rbind", verse)),
                    book.abbrev = as.vector(do.call("rbind", books)),
                    stringsAsFactors = FALSE)
# remove verses for clean version
kingjamesclean <- gsub("^[A-Z][a-z][a-z]+\\|[0-9]+\\|[0-9]+\\| ", "",
                       kingjamesraw)

# books
wb <- XLConnect::loadWorkbook("kingjamesbooks.xls")
kingjamesbooks <- XLConnect::readWorksheet(wb, 1)

all <- dplyr::left_join(kingjamesbooks, table,
                        by = c("Book.Abbreviation" = "book.abbrev"))

library(tm)
# to tm::Corpus
x <- data.frame(txt = kingjamesclean)
corpus <- Corpus(VectorSource(x$txt))
# add meta-data
for (i in 1:length(verse)) {
  meta(corpus[[i]], tag = "author") <- NULL
  meta(corpus[[i]], tag = "datetimestamp") <- NULL
  meta(corpus[[i]], tag = "description") <- NULL
  meta(corpus[[i]], tag = "heading") <- NULL
  meta(corpus[[i]], tag = "language") <- NULL
  meta(corpus[[i]], tag = "origin") <- "http://www.sacred-texts.com/bib/osrc/"
  meta(corpus[[i]], tag = "Book.Abbreviation") <- all$Abbreviation[i]
  meta(corpus[[i]], tag = "Verse") <- all$Verse[i]
  meta(corpus[[i]], tag = "King.James.Bible") <- all$King.James.Bible[i]
  meta(corpus[[i]], tag = "Vulgate") <- all$Vulgate[i]
  meta(corpus[[i]], tag = "Douay.Reihms") <- all$Douay.Rheims[i]
  meta(corpus[[i]], tag = "Full.Title.Auth.V") <- all$Full.Title.Auth.V[i]
  meta(corpus[[i]], tag = "Testament") <- all$Testament[i]
}
kingjamestm <- corpus

all$Text <- kingjamesclean

kingjamesdf <- all

# ============================= APOCRYPHA =================================== #
apoc <- readLines("apodat.txt")

apoc <- apoc[which(apoc != "")]

apocrypharaw <- apoc # keep raw
# extract verse
verse <- regmatches(apoc, gregexpr("^[[:alnum:]]+\\|[0-9]+\\|[0-9]+\\|",
                                    apoc))
books <- regmatches(apoc, gregexpr("^[[:alnum:]]+",apoc)) # get book abbrv
table <- data.frame(Verse = as.vector(do.call("rbind", verse)),
                    book.abbrev = as.vector(do.call("rbind", books)),
                    stringsAsFactors = FALSE)
# remove verses for clean version
apocryphaclean <- gsub("^[A-Z][a-z][a-z]+\\|[0-9]+\\|[0-9]+\\| ", "",
                       apocrypharaw)

# books
wb <- XLConnect::loadWorkbook("apocryphabooks.xls")
apocryphabooks <- XLConnect::readWorksheet(wb, 1)

all <- dplyr::left_join(apocryphabooks, table,
                        by = c("Book.Abbreviation" = "book.abbrev"))

library(tm)
# to tm::Corpus
x <- data.frame(txt = apocryphaclean)
corpus <- Corpus(VectorSource(x$txt))
# add meta-data
for (i in 1:length(verse)) {
  meta(corpus[[i]], tag = "author") <- NULL
  meta(corpus[[i]], tag = "datetimestamp") <- NULL
  meta(corpus[[i]], tag = "description") <- NULL
  meta(corpus[[i]], tag = "heading") <- NULL
  meta(corpus[[i]], tag = "language") <- NULL
  meta(corpus[[i]], tag = "origin") <- "http://www.sacred-texts.com/bib/osrc/"
  meta(corpus[[i]], tag = "Book.Abbreviation") <- all$Abbreviation[i]
  meta(corpus[[i]], tag = "Verse") <- all$Verse[i]
  meta(corpus[[i]], tag = "King.James.Bible") <- all$King.James.Bible[i]
  meta(corpus[[i]], tag = "Vulgate") <- all$Vulgate[i]
  meta(corpus[[i]], tag = "Douay.Reihms") <- all$Douay.Rheims[i]
  meta(corpus[[i]], tag = "Full.Title.Auth.V") <- all$Full.Title.Auth.V[i]
}
apocryphatm <- corpus

all$Text <- apocryphaclean

apocryphadf <- all

devtools::use_data(kingjamesdf, kingjamestm, kingjamesbooks,
                   apocryphadf, apocryphatm, apocryphabooks,
                   overwrite = TRUE)
