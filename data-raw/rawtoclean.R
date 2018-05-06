# source: http://www.sacred-texts.com/bib/osrc/
library(dplyr)

# define function
sacred_to_tibble <- function(path){
  bible <- readLines(path, encoding = "UTF-8")
  
  bible <- bible[which(bible != "")]
  
  # remove tilda
  bible <- gsub(".~", ".", bible)
  
  # extract verse
  verse <- regmatches(
    bible, 
    gregexpr("^[[:alnum:]]+\\|[0-9]+\\|[0-9]+\\|", bible)
  )
  
  # get book abbrv
  books <- regmatches(
    bible, 
    gregexpr("^[[:alnum:]]+", bible)
  )
  
  verses <- gsub("^[[:alnum:]]+\\|[0-9]+\\|[0-9]+\\|", "", bible)
  verses <- iconv(verses, to = "UTF-8")
  verses <- stringi::stri_trans_general(verses, "Latin-ASCII")
  verses <- tolower(verses)
  
  id <- gsub("\\|[[:digit:]]+\\|$", "", verse)
  psalm <- gsub("[[:alpha:]]+|[[:punct:]]+", "", id)
  verse <- gsub("^[[:alnum:]]+\\|[[:digit:]]+\\|", "", verse)
  verse <- gsub("\\|", "", verse)
  
  df <- tibble::tibble(
    book = tolower(as.vector(do.call("rbind", books))),
    psalm = psalm,
    verse = verse,
    text = trimws(verses)
  )
  
  book.num <- tibble(
    book = unique(df$book),
    book.num = 1:length(unique(df$book))
  )
  
  df <- df %>% 
    left_join(book.num, by = "book") %>% 
    select(
      book.num, book, psalm, verse, text
    )
  
  df
}

# ============================= BIBLE =================================== #

king_james_version <- sacred_to_tibble("./data-raw/kjvdat.txt")

# ============================= APOCRYPHA =================================== #

apocrypha <- sacred_to_tibble("./data-raw/apodat.txt")

# ============================= SEPTUAGINT =================================== #

septuagint <- sacred_to_tibble("./data-raw/sept.txt")

# ============================= GREEK NEW TESTAMENT =================================== #

greek_new_testament <- sacred_to_tibble("./data-raw/ugntdat.txt")

# ============================= TANACH =================================== #

tanach <- sacred_to_tibble("./data-raw/t3utfdat.txt")

# ============================= VULGATE =================================== #

vulgate <- sacred_to_tibble("./data-raw/vuldat.txt")

# ============================= MIDDLE ENGLISH SW =================================== #

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
                              "forth", "art", "yea", "thy", "thee", "upon", "thine", "thou",
                              'and',
                              'on',
                              'þonne',
                              'wið', 
                              'to',
                              'þæt',
                              'þe',
                              'ne',
                              'ic',
                              'me',
                              'heo',
                              'him',
                              'he',
                              'swa',
                              'þis',
                              'mid',
                              'þu',
                              'ofer',
                              'his',
                              'þriwa',
                              'seo',
                              'hit',
                              'se',
                              'þas',
                              'cweð',
                              'þæs',
                              'in',
                              'sy',
                              'ða',
                              'ðy',
                              'ær',
                              'ðonne',
                              'næfre',
                              'þone',
                              'ge',
                              'ðas',
                              'þære',
                              'þam',
                              'is' ,
                              'of',
                              'gif',
                              'þæm',
                              'nu',
                              'under',
                              'wiþ',
                              'geond',
                              'æfter',
                              'ðis',
                              'do',
                              'hwæt',
                              'her',
                              'þurh',
                              'þus',
                              'lytel',
                              'æt',
                              'ðin',
                              'willian',
                              'cume',
                              'þeos',
                              'þara',
                              'are',
                              'cuman',
                              'com',
                              'ænig',
                              'þon',
                              'for',
                              'us',
                              'ac',
                              'bot',
                              'ende',
                              'wæs',
                              'wǣre',
                              'wes',
                              'wǣron',
                              'wǣren',
                              'wesað',
                              'ic',
                              'wit',
                              'wē',
                              'mīn',
                              'uncer',
                              'ūser',
                              'ūre',
                              'mē',
                              'unc',
                              'ūs',
                              'mec',
                              'uncit',
                              'ūsic',
                              'ðū',
                              'git',
                              'gē',
                              'ðīn',
                              'incer',
                              'ēower', 
                              'ēowre',
                              'ðē',
                              'inc',
                              'ēow',
                              'ðec',
                              'incit',
                              'ēowic',
                              'hē',
                              'hēo', 
                              'hīe',
                              'hit', 
                              'hyt',
                              'hī', 
                              'hȳ',
                              'hire',
                              'hira', 
                              'heora', 
                              'hiera',
                              'heom',
                              'hine',
                              'nǣr',
                              'nǣfre',
                              'nǣnig',
                              'nolde',
                              'noldon',
                              'be',
                              'beforan',
                              'betweox',
                              'for',
                              'from',
                              'fram',
                              'mid',
                              'tō',
                              'geond',
                              'oð',
                              'þurh',
                              'ofer',
                              'under',
                              'bēo',
                              'bist',
                              'biþ',
                              'bēoþ',
                              'bēon',
                              'ēom',
                              'sīe',
                              'eart',
                              'sī',
                              'is',
                              'sēo',
                              'sindon',
                              'sint',
                              'nēom',
                              'neart',
                              'nis',
                              'sīo',
                              'ðæt', 
                              'tæt',
                              'ðæs',
                              'ðǣre',
                              'ðǣm', 
                              'ðām',
                              'ðone',
                              'ðā',
                              'ðȳ', 
                              'ðē', 
                              'ðon',
                              'ðāra', 
                              'ðǣra',
                              'ðes',
                              'ðēos',
                              'ðisse', 
                              'ðeosse',
                              'ðises',
                              'ðisses',
                              'ðisum',
                              'ðissum',
                              'ðisne',
                              'ðās',
                              'ðīs',
                              'ðȳs',
                              'ðissa', 
                              'ðeossa',
                              'ðeosum',
                              'ðeossum',
                              'twēgen',
                              'twā',
                              'tū',
                              'twēgra',
                              'twǣm',
                              'þrīe',
                              'þrēo',
                              'þrēora',
                              'þrīm',
                              'endlefan',
                              'twelf',
                              'twēntig',
                              'þrēotīene',
                              'þrītig',
                              'fēower',
                              'fēowertīene',
                              'fēowertig',
                              'fīf',
                              'fīftīene',
                              'fīftig',
                              'siex',
                              'siextīene',
                              'siextig',
                              'seofon',
                              'seofontīene',
                              'seofontig',
                              'eahta',
                              'eahtatīene',
                              'eahtatig',
                              'nigon',
                              'nigontīene',
                              'nigontig',
                              'tīen',
                              'hund',
                              'gā',
                              'gǣst',
                              'gǣð',
                              'gāð',
                              'gān',
                              'gānde',
                              'gangende',
                              'gegān',
                              'ēode',
                              'ēodest',
                              'ēodon',
                              'ēoden')

middle_english_stopwords <- sort(unique(middle_english_stopwords))
middle_english_stopwords <- iconv(middle_english_stopwords, to = "utf8")

middle_english_stopwords <- tibble::tibble(
  word = middle_english_stopwords,
  lexicon = "MIDDLE ENGLISH"
)

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
               "miserable", "sad", "untrewe", "welke", "profane")

middle_english_negative <- sort(iconv(neg_words, to = "utf8"))
middle_english_positive <- sort(iconv(pos_words, to = "utf8"))

middle_english_sentiments <- tibble::tibble(
  word = c(
    middle_english_positive, middle_english_negative
  ),
  sentiment = c(
    rep("positive", length(middle_english_positive)),
    rep("negative", length(middle_english_negative))
  ),
  score = c(
    rep(1, length(middle_english_positive)),
    rep(-1, length(middle_english_negative))
  )
)

devtools::use_data(
  king_james_version,
  apocrypha,
  septuagint,
  greek_new_testament,
  tanach,
  vulgate,
  middle_english_stopwords,
  middle_english_sentiments,
  overwrite = TRUE
)
