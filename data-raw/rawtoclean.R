
# ============================= BIBLE =================================== #
# from http://www.sacred-texts.com/bib/osrc/
bible <- readLines("kjvdat.txt")
kingjamesraw <- bible # keep raw

# remove tilda
bible <- gsub(".~", ".", bible)

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
  meta(corpus[[i]], tag = "Book.Number") <- all$Book.Number[i]
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

# ===============

middle_english_stopwords <- c("and", "that", "to", "i", "for", "of", "the", "in", "he", "his",
                              "this", "hir", "a", "as", "it", "so", "al", "is", "him", "but",
                              "she", "with", "me", "ye", "my", "was", "be", "now", "wel", "on",
                              "shal", "yow", "or", "herte", "god", "may", "love", "gan", "thou",
                              "not", "no", "if", "y", "thus", "which", "what", "by", "ther",
                              "seyde", "thy", "have", "myn", "ful", "right", "quod", "your",
                              "they", "eek", "how", "here", "hem", "nought", "whan", "o", "thee",
                              "at", "wolde", "wol", "were", "out", "thing", "more", "shall",
                              "unto", "upon", "hath", "came", "come", "one", "also", "shalt",
                              "let", "made", "went", "even", "saith", "hast", "say", "thine",
                              "forth", "art", "yea")

middle_english_stopwords <- sort(middle_english_stopwords)

pos_words <- c("holy", "heaven", "peace", "grace", "valour", "gladness",
               "amydable", "anfald", "beste", "bilewit", "blisful", "courteys",
               "curteis", "ethel", "athel", "faire", "fous", "freendly",
               "fremful", "fus", "goodly", "goodlich", "heuenly", "holde",
               "holi", "honeste", "hooly", "mensk", "mighty", "noble",
               "pleasaunt", "pleyn", "quemeful", "quemful", "repentaunt",
               "sacre", "shone", "smiker", "sote", "trewe", "trewely",
               "trouthe", "truth", "truthe", "verray", "verre", "vertuous",
               "virtue")
neg_words <- c("evil", "devil", "sin", "filth", "judah", "canaan", "heathen",
               "blemish", "pharaoh", "a-ferd", "abaist", "abawed", "adrad",
               "adred", "aferd", "angry", "earm", "bittre", "clene", "cruel",
               "dedly", "desirous", "drasty", "fayr", "feble", "forolded",
               "horrible", "leene", "lewede", "loth", "mansed", "newsome",
               "grievous", "povr", "schatered", "sorwful", "sorrow",
               "miserable", "sad", "untrewe", "welke")

negative_terms <- sort(neg_words)
positive_terms <- sort(pos_words)

king_james_df <- kingjamesdf
king_james_tm <- kingjamestm
king_james_books <- kingjamesbooks

apocrypha_df <- apocryphadf
apocrypha_tm <- apocryphatm
apocrypha_books <- apocryphabooks

devtools::use_data(king_james_df, king_james_tm, king_james_books,
                   apocrypha_df, apocrypha_tm, apocrypha_books,
                   middle_english_stopwords,
                   negative_terms, positive_terms,
                   overwrite = TRUE)
