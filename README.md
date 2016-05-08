
[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/bibler.svg?branch=master)](https://travis-ci.org/JohnCoene/bibler)
[![Coverage Status](https://img.shields.io/coveralls/JohnCoene/bibler.svg)](https://coveralls.io/r/JohnCoene/bibler?branch=master)

bibler
======

Include 6 datasets related to the Bible:

1.  `kingjamesdf` The King James Bible as data.frame
2.  `kingjamestm` The King James Bible as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
3.  `kingjamesbooks` List of books that constitute the King James Bible
4.  `apocryphadf` The Apocrypha as data.frame
5.  `apocryphatm` The Apocrypha as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
6.  `apocryphabooks` List of books that constitute the Apocrypha

King James
----------

### Books

``` r
knitr::kable(head(kingjamesbooks, 3)) 
```

| Book.Abbreviation | King.James.Bible | Vulgate   | Douay.Rheims | Full.Title.Auth.V                         | Testament     |
|:------------------|:-----------------|:----------|:-------------|:------------------------------------------|:--------------|
| Gen               | Genesis          | Genesis   | Genesis      | The First Book of Moses, called Genesis   | Old Testament |
| Exo               | Exodus           | Exodus    | Exodus       | The Second Book of Moses, called Exodus   | Old Testament |
| Lev               | Leviticus        | Leviticus | Leviticus    | The Third Book of Moses, called Leviticus | Old Testament |

### Data frame

``` r
knitr::kable(head(kingjamesdf, 3)) 
```

| Book.Abbreviation | King.James.Bible | Vulgate | Douay.Rheims | Full.Title.Auth.V                       | Testament     | Verse    | Text                                                                                                                                            |
|:------------------|:-----------------|:--------|:-------------|:----------------------------------------|:--------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------|
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|1| | In the beginning God created the heaven and the earth.~                                                                                         |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|2| | And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.~ |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|3| | And God said, Let there be light: and there was light.~                                                                                         |

### Corpus

``` r
library(tm)
```

    ## Loading required package: NLP

``` r
meta(kingjamestm[[1]])
```

    ##   id               : 1
    ##   origin           : http://www.sacred-texts.com/bib/osrc/
    ##   Verse            : Gen|1|1|
    ##   King.James.Bible : Genesis
    ##   Vulgate          : Genesis
    ##   Douay.Reihms     : Genesis
    ##   Full.Title.Auth.V: The First Book of Moses, called Genesis
    ##   Testament        : Old Testament

Apocrypha
---------

### Books

``` r
knitr::kable(head(apocryphabooks, 3))
```

| Book.Abbreviation | King.James.Bible | Vulgate  | Douay.Rheims | Full.Title.Auth.V         |
|:------------------|:-----------------|:---------|:-------------|:--------------------------|
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras  |
| Es2               | 2 Esdras         | 4 Esdrae | 4 Esdras     | The Second Book of Esdras |
| Tob               | Tobit            | Tobiae   | Tobias       | Tobit                     |

### Data frame

``` r
knitr::kable(head(apocryphadf, 3))
```

| Book.Abbreviation | King.James.Bible | Vulgate  | Douay.Rheims | Full.Title.Auth.V        | Verse    | Text                                                                                                                                                                                                              |
|:------------------|:-----------------|:---------|:-------------|:-------------------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|1| | Es1|1|1|And Josias held the feast of the passover in Jerusalem unto his Lord, and offered the passover the fourteenth day of the first month;                                                                     |
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|2| | Es1|1|2|Having set the priests according to their daily courses, being arrayed in long garments, in the temple of the Lord.                                                                                       |
| Es1               | 1 Esdras         | 3 Esdrae | 3 Esdras     | The First Book of Esdras | Es1|1|3| | Es1|1|3|And he spake unto the Levites, the holy ministers of Israel, that they should hallow themselves unto the Lord, to set the holy ark of the Lord in the house that king Solomon the son of David had built: |

### Corpus

``` r
library(tm)
meta(apocryphatm[[1]]) # Aprocrypha
```

    ##   id               : 1
    ##   origin           : http://www.sacred-texts.com/bib/osrc/
    ##   Verse            : Es1|1|1|
    ##   King.James.Bible : 1 Esdras
    ##   Vulgate          : 3 Esdrae
    ##   Douay.Reihms     : 3 Esdras
    ##   Full.Title.Auth.V: The First Book of Esdras

Project Vault
=============

See my other projects at <http://johncoene.github.io/projects/>
