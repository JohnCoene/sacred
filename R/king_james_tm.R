#' King James Bible as corpus from tm package.
#'
#' A corpus containing all verses of the King James Bible, includes all 66
#' books. Each document in corpus constitute a verse.
#'
#' @format A corpus with 31102 documents and 7 variables:
#' \describe{
#'   \item{id}{Document (Verse) id}
#'   \item{Verse}{Verse}
#'   \item{King.James.Bible}{Book title in King James Bible}
#'   \item{Vulgate}{Book title in Vulgate}
#'   \item{Douay.Rheims}{Book title in Douay Rheims version}
#'   \item{Full.Title.Auth.V}{Book title in authorized version}
#'   \item{Testament}{Testament to which book belongs}
#' }
#' @source \url{http://www.sacred-texts.com/bib/osrc/}
"king_james_tm"
