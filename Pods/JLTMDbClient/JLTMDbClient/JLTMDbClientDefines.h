//
//    JLTMDbClientDefines.h
//    JLTMDbClient
//
//    Copyright (c) 2013 Javi Lorbada (http://javilorbada.me/)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#pragma mark - API URL
static NSString * const kJLTMDbAPISSL = @"https";
static NSString * const kJLTMDbAPINoSSL = @"http";
static NSString * const kJLTMDbAPIBaseURL = @"://api.themoviedb.org/";
static NSString * const kJLTMDbAPIVersion = @"3/";

#pragma mark - Configuration
//Documentation: http://docs.themoviedb.apiary.io/#configuration
static NSString * const kJLTMDbConfiguration = @"configuration";

#pragma mark - Movies
//Documentation: http://docs.themoviedb.apiary.io/#movies
static NSString * const kJLTMDbMovie = @"movie/{id}";
static NSString * const kJLTMDbMovieAlternativeTitle = @"movie/{id}/alternative_titles";
static NSString * const kJLTMDbMovieCasts = @"movie/{id}/casts";
static NSString * const kJLTMDbMovieImages = @"movie/{id}/images";
static NSString * const kJLTMDbMovieKeywords = @"movie/{id}/keywords";
static NSString * const kJLTMDbMovieReleases = @"movie/{id}/releases";
static NSString * const kJLTMDbMovieTrailers = @"movie/{id}/trailers";
static NSString * const kJLTMDbMovieTranslations = @"movie/{id}/translations";
static NSString * const kJLTMDbMovieSimilar = @"movie/{id}/similar_movies";
static NSString * const kJLTMDbMovieReviews = @"movie/{id}/reviews";
static NSString * const kJLTMDbMovieLists = @"movie/{id}/lists";
static NSString * const kJLTMDbMovieChanges = @"movie/{id}/changes";
static NSString * const kJLTMDbMovieLatest = @"movie/latest";
static NSString * const kJLTMDbMovieUpcoming = @"movie/upcoming";
static NSString * const kJLTMDbMovieNowPlaying = @"movie/now_playing";
static NSString * const kJLTMDbMoviePopular = @"movie/popular";
static NSString * const kJLTMDbMovieTopRated = @"movie/top_rated";

#pragma mark - People
//Documentation: http://docs.themoviedb.apiary.io/#people
static NSString * const kJLTMDbPerson = @"person/{id}";
static NSString * const kJLTMDbPersonCredits = @"person/{id}/credits";
static NSString * const kJLTMDbPersonImages = @"person/{id}/images";
static NSString * const kJLTMDbPersonChanges = @"person/{id}/changes";
static NSString * const kJLTMDbPersonPopular = @"person/popular";
static NSString * const kJLTMDbPersonLatest = @"person/latest";

#pragma mark - Companies
//Documentation: http://docs.themoviedb.apiary.io/#companies
static NSString * const kJLTMDbCompany = @"company/{id}";
static NSString * const kJLTMDbCompanyMovies = @"company/{id}/movies";

#pragma mark - Genres
//Documentation: http://docs.themoviedb.apiary.io/#genres
static NSString * const kJLTMDbGenreList = @"genre/list";
static NSString * const kJLTMDbGenreMovies = @"genre/{id}/movies";

#pragma mark - Keywords
//Documentation: http://docs.themoviedb.apiary.io/#keywords
static NSString * const kJLTMDbKeyword = @"keyword/{id}";
static NSString * const kJLTMDbKeywordMovies = @"keyword/{id}/movies";

#pragma mark - Search
//Documentation: http://docs.themoviedb.apiary.io/#search
static NSString * const kJLTMDbSearchMovie = @"search/movie";
static NSString * const kJLTMDbSearchPerson = @"search/person";
static NSString * const kJLTMDbSearchCompany = @"search/company";

