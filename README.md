
[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/bibler.svg?branch=master)](https://travis-ci.org/JohnCoene/bibler) [![Build status](https://ci.appveyor.com/api/projects/status/fgqivf16f1u7jrug/branch/master?svg=true)](https://ci.appveyor.com/project/JohnCoene/bibler/branch/master)

![wordcloud](http://john-coene.com/img/bibler.png)

bibler
======

Include 6 datasets related to the Bible:

1.  `king_james_df` The King James Bible as data.frame
2.  `king_james_tm` The King James Bible as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
3.  `king_james_books` List of books that constitute the King James Bible
4.  `apocrypha_df` The Apocrypha as data.frame
5.  `apocrypha_tm` The Apocrypha as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
6.  `apocrypha_books` List of books that constitute the Apocrypha

Install
=======

``` r
devtools::install_github("JohnCoene/bibler")
```

Examples & Docs
========

Vignette~ish document and examples can be found [here](https://john-coene.com/post/bibler/)

King James
----------

#### Books

``` r
knitr::kable(head(king_james_books, 3)) 
```

| Book.Abbreviation | King.James.Bible | Vulgate   | Douay.Rheims | Full.Title.Auth.V                         | Testament     |  Book.Number|
|:------------------|:-----------------|:----------|:-------------|:------------------------------------------|:--------------|------------:|
| Gen               | Genesis          | Genesis   | Genesis      | The First Book of Moses, called Genesis   | Old Testament |            1|
| Exo               | Exodus           | Exodus    | Exodus       | The Second Book of Moses, called Exodus   | Old Testament |            2|
| Lev               | Leviticus        | Leviticus | Leviticus    | The Third Book of Moses, called Leviticus | Old Testament |            3|

#### Data frame

``` r
knitr::kable(head(king_james_df, 3)) 
```

| Book.Abbreviation | King.James.Bible | Vulgate | Douay.Rheims | Full.Title.Auth.V                       | Testament     |  Book.Number| Verse    | Text                                                                                                                                           |
|:------------------|:-----------------|:--------|:-------------|:----------------------------------------|:--------------|------------:|:---------|:-----------------------------------------------------------------------------------------------------------------------------------------------|
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament |            1| Gen|1|1| | In the beginning God created the heaven and the earth.                                                                                         |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament |            1| Gen|1|2| | And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters. |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament |            1| Gen|1|3| | And God said, Let there be light: and there was light.                                                                                         |

#### Corpus

``` r
library(tm)
```

    ## Loading required package: NLP

``` r
meta(king_james_tm[[1]])
```

    ##   id               : 1
    ##   origin           : http://www.sacred-texts.com/bib/osrc/
    ##   Verse            : Gen|1|1|
    ##   King.James.Bible : Genesis
    ##   Vulgate          : Genesis
    ##   Douay.Reihms     : Genesis
    ##   Full.Title.Auth.V: The First Book of Moses, called Genesis
    ##   Testament        : Old Testament
    ##   Book.Number      : 1

Apocrypha
---------

#### Books

``` r
knitr::kable(head(apocrypha_books, 3))
```

| Book.Abbreviation | King.James.Bible | Vulgate  | Douay.Rheims | Full.Title.Auth.V         |
|:------------------|:-----------------|:---------|:-------------|:--------------------------|
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras  |
| Es2               | 2 Esdras         | 4 Esdrae | 4 Esdras     | The Second Book of Esdras |
| Tob               | Tobit            | Tobiae   | Tobias       | Tobit                     |

#### Data frame

``` r
knitr::kable(head(apocrypha_df, 3))
```

| Book.Abbreviation | King.James.Bible | Vulgate  | Douay.Rheims | Full.Title.Auth.V        | Verse    | Text                                                                                                                                                                                                              |
|:------------------|:-----------------|:---------|:-------------|:-------------------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|1| | Es1|1|1|And Josias held the feast of the passover in Jerusalem unto his Lord, and offered the passover the fourteenth day of the first month;                                                                     |
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|2| | Es1|1|2|Having set the priests according to their daily courses, being arrayed in long garments, in the temple of the Lord.                                                                                       |
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|3| | Es1|1|3|And he spake unto the Levites, the holy ministers of Israel, that they should hallow themselves unto the Lord, to set the holy ark of the Lord in the house that king Solomon the son of David had built: |

#### Corpus

``` r
library(tm)
meta(apocrypha_tm[[1]]) # Aprocrypha
```

    ##   id               : 1
    ##   origin           : http://www.sacred-texts.com/bib/osrc/
    ##   Verse            : Es1|1|1|
    ##   King.James.Bible : 1 Esdras
    ##   Vulgate          : 3 Esdrae
    ##   Douay.Reihms     : 3 Esdras
    ##   Full.Title.Auth.V: The First Book of Esdras

Utils
-----

#### Stopwords

``` r
head(middle_english_stopwords, 15)
```

    ##  [1] "a"    "al"   "also" "and"  "art"  "as"   "at"   "be"   "but"  "by"  
    ## [11] "came" "come" "eek"  "even" "for"

#### Lexicons

``` r
head(middle_english_negative, 10) # negative
```

    ##  [1] "a-ferd"  "abaist"  "abawed"  "adrad"   "adred"   "aferd"   "angry"  
    ##  [8] "bittre"  "blemish" "canaan"

``` r
tail(middle_english_positive, 10) # positive
```

    ##  [1] "trewe"    "trewely"  "trouthe"  "truth"    "truthe"   "valour"  
    ##  [7] "verray"   "verre"    "vertuous" "virtue"

