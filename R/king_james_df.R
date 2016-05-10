#' King James Bible dataframe.
#'
#' A dataset containing all verses of the King James Bible, includes all 66
#' books, one verse per row.
#'
#' @format A data frame with 31102 rows and 8 variables:
#' \describe{
#'   \item{Book.Abbreviation}{Abbreviation of book title}
#'   \item{King.James.Bible}{Book title in King James Bible}
#'   \item{Vulgate}{Book title in Vulgate}
#'   \item{Douay.Rheims}{Book title in Douay Rheims version}
#'   \item{Full.Title.Auth.V}{Book title in authorized version}
#'   \item{Testament}{Testament to which book belongs}
#'   \item{Book.Number}{Book number as appear in Bible, starts with Genesis #1}
#'   \item{Verse}{Verse}
#'   \item{Text}{Text of verse}
#' }
#' @source \url{http://www.sacred-texts.com/bib/osrc/}
"king_james_df"
