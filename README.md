
bibler
======

Include 6 datasets related to the Bible:

1.  `kingjamesdf` The King James Bible as data.frame
2.  `kingjamestm` The King James Bible as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
3.  `kingjamesbooks` List of books that constitute the King James Bible
4.  `apocryphadf` The Apocrypha as data.frame
5.  `apocryphatm` The Apocrypha as [tm](https://cran.r-project.org/package=tm) corpus (`c("VCorpus", "Corpus"`)
6.  `apocryphabooks` List of books that constitute the Apocrypha

``` r
knitr::kable(head(kingjamesbooks))
```

| Book.Abbreviation | King.James.Bible | Vulgate       | Douay.Rheims | Full.Title.Auth.V                           | Testament     |
|:------------------|:-----------------|:--------------|:-------------|:--------------------------------------------|:--------------|
| Gen               | Genesis          | Genesis       | Genesis      | The First Book of Moses, called Genesis     | Old Testament |
| Exo               | Exodus           | Exodus        | Exodus       | The Second Book of Moses, called Exodus     | Old Testament |
| Lev               | Leviticus        | Leviticus     | Leviticus    | The Third Book of Moses, called Leviticus   | Old Testament |
| Num               | Numbers          | Numeri        | Numbers      | The Fourth Book of Moses, called Numbers    | Old Testament |
| Deu               | Deuteronomy      | Deuteronomium | Deuteronomy  | The Fifth Book of Moses, called Deuteronomy | Old Testament |
| Jos               | Joshua           | Josue         | Josue        | The Book of Joshua                          | Old Testament |

``` r
knitr::kable(head(kingjamesdf))
```

| Book.Abbreviation | King.James.Bible | Vulgate | Douay.Rheims | Full.Title.Auth.V                       | Testament     | Verse    | Text                                                                                                                                            |
|:------------------|:-----------------|:--------|:-------------|:----------------------------------------|:--------------|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------|
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|1| | In the beginning God created the heaven and the earth.~                                                                                         |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|2| | And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.~ |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|3| | And God said, Let there be light: and there was light.~                                                                                         |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|4| | And God saw the light, that it was good: and God divided the light from the darkness.~                                                          |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|5| | And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.~                            |
| Gen               | Genesis          | Genesis | Genesis      | The First Book of Moses, called Genesis | Old Testament | Gen|1|6| | And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.~                               |

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
