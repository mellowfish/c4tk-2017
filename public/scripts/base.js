"use strict";

(function () {
  "use strict";

  var $$utilities$$API_ENDPOINT = "http://c4tk.somamou.org/songs.json";
  var $$utilities$$API_SONG_ENDPOINT = $$utilities$$API_ENDPOINT.slice(0, -5);
  var $$utilities$$QUERY_KEY = "?q=";
  var $$utilities$$DEBOUNCE_WAIT = 150;
  var $$utilities$$SEARCH_RESULTS_LIST = ".SearchResults-list";
  var $$utilities$$SEARCH_RESULTS_INFO = ".SearchResults-info";
  var $$utilities$$resultsList = document.querySelector("" + $$utilities$$SEARCH_RESULTS_LIST);
  var $$utilities$$resultsInfo = document.querySelector("" + $$utilities$$SEARCH_RESULTS_INFO);
  var $$utilities$$docFrag = null;

  var $$utilities$$debounce = function $$utilities$$debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this,
          args = arguments;
      var later = function later() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  function $$utilities$$getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }

  function $$utilities$$fetchSongs(query, callback) {
    var endPoint = "" + $$utilities$$API_ENDPOINT + $$utilities$$QUERY_KEY + query;

    if (query === "") {
      $$utilities$$resetResults();
    } else {
      axios.get(endPoint).then(function (response) {
        if (response.data.length) {
          callback(response.data, query);
        } else {
          $$utilities$$drawNoResultsInfo(query);
        }
      })
      // .catch(function (error) {
      //   console.log(error);
      // })
      ;
    }
  }

  function $$utilities$$fetchSong(id, callback) {
    var endPoint = $$utilities$$API_SONG_ENDPOINT + "/" + id + ".json";

    if (typeof id !== "undefined") {
      axios.get(endPoint).then(function (response) {
        callback(response.data);
      });
      // .catch(function (error) {
      //   console.log(error);
      // })
    }
  }

  function $$utilities$$drawSongDetail(_ref) {
    var lyrics = _ref.lyrics,
        video_url = _ref.video_url,
        title = _ref.title,
        artist = _ref.artist,
        general_references = _ref.general_references;

    var video = document.querySelector(".DetailVideo");

    if (video_url !== null) {
      video.setAttribute("src", video_url);
    } else {
      video.style.display = "none";
    }

    if (general_references !== null) {
      document.querySelector(".DetailContent-verses").innerHTML = $$utilities$$createVerseHTML(general_references);
    }

    if (lyrics !== null) {
      var lyrics_with_title = "<p class=\"u-margin-btm-5\"><strong>Lyrics</strong></p>" + lyrics;
      document.querySelector(".DetailContent-lyrics").innerHTML = lyrics_with_title;
    }

    document.querySelector(".DetailContent-title").innerHTML = title;
    document.querySelector(".DetailContent-artist").innerHTML = artist;
  }

  function $$utilities$$createVerseHTML(verseArray) {
    var htmlString = "";

    verseArray.forEach(function (verse) {
      if (verse.verse_text.length) {
        htmlString += "<p class=\"u-margin-btm-neg\"><strong>" + verse.verse_reference + "</strong><p>" + verse.verse_text + "</p>";
      }
    });

    return htmlString;
  }

  function $$utilities$$drawSongs(songs, query) {
    $$utilities$$docFrag = document.createDocumentFragment();

    if (songs.constructor === Array) {
      songs.forEach($$utilities$$pushToSongsList);
      $$utilities$$drawResultsInfo(query, songs.length);
    } else {
      $$utilities$$pushToSongsList(songs);
      $$utilities$$drawResultsInfo(query, 1);
    }
    $$utilities$$resultsList.appendChild($$utilities$$docFrag);
    $$utilities$$docFrag = null;
  }

  function $$utilities$$pushToSongsList(_ref2) {
    var id = _ref2.id,
        title = _ref2.title,
        artist = _ref2.artist;

    var tempDiv = document.createElement('div');

    tempDiv.innerHTML = "<li class=\"SearchResults-listItem u-fadein\" data-song-id=\"" + id + "\"><a href=\"/song.html?q=" + id + "\" class=\"SearchResults-listLink\">" + title + " - " + artist + "</a></li>";
    $$utilities$$docFrag.appendChild(tempDiv.firstChild);
  }

  function $$utilities$$drawResultsInfo(query, count) {
    var resultsInfo = document.querySelector("" + $$utilities$$SEARCH_RESULTS_INFO);

    $$utilities$$resultsList.innerHTML = "";
    resultsInfo.innerHTML = count + " search results for: \"" + query + "\"";
  }

  function $$utilities$$drawNoResultsInfo(query) {
    $$utilities$$resultsList.innerHTML = "";
    $$utilities$$resultsInfo.innerHTML = "0 search results for: \"" + query + "\"";
  }

  function $$utilities$$resetResults() {
    $$utilities$$resultsList.innerHTML = "";
    $$utilities$$resultsInfo.innerHTML = "";
  }

  var src$partials$js$song_detail$$detailSearchBarTerm = document.querySelector(".DetailSearchBar");
  var src$partials$js$song_detail$$detailSearchBar = document.querySelector(".DetailSearchBar-icon");

  if (window.location.pathname.match("song.html$")) {
    $$utilities$$fetchSong($$utilities$$getParameterByName("q"), $$utilities$$drawSongDetail);
  }

  if (src$partials$js$song_detail$$detailSearchBar !== null) {
    src$partials$js$song_detail$$detailSearchBar.addEventListener("click", $$utilities$$debounce(function (e) {
      window.location.href = "/index.html?term=" + src$partials$js$song_detail$$detailSearchBarTerm.value;
    }, $$utilities$$DEBOUNCE_WAIT));
  }
}).call(undefined);
"use strict";

(function () {
  "use strict";

  var $$utilities$$ = {
    get API_ENDPOINT() {
      return $$utilities$$API_ENDPOINT;
    },

    get API_SONG_ENDPOINT() {
      return $$utilities$$API_SONG_ENDPOINT;
    },

    get QUERY_KEY() {
      return $$utilities$$QUERY_KEY;
    },

    get DEBOUNCE_WAIT() {
      return $$utilities$$DEBOUNCE_WAIT;
    },

    get debounce() {
      return $$utilities$$debounce;
    },

    get getParameterByName() {
      return $$utilities$$getParameterByName;
    },

    get fetchSongs() {
      return $$utilities$$fetchSongs;
    },

    get fetchSong() {
      return $$utilities$$fetchSong;
    },

    get drawSongDetail() {
      return $$utilities$$drawSongDetail;
    },

    get drawSongs() {
      return $$utilities$$drawSongs;
    },

    get pushToSongsList() {
      return $$utilities$$pushToSongsList;
    }
  };

  var $$utilities$$API_ENDPOINT = "http://c4tk.somamou.org/songs.json";
  var $$utilities$$API_SONG_ENDPOINT = $$utilities$$API_ENDPOINT.slice(0, -5);
  var $$utilities$$QUERY_KEY = "?q=";
  var $$utilities$$DEBOUNCE_WAIT = 150;
  var $$utilities$$SEARCH_RESULTS_LIST = ".SearchResults-list";
  var $$utilities$$SEARCH_RESULTS_INFO = ".SearchResults-info";
  var $$utilities$$resultsList = document.querySelector("" + $$utilities$$SEARCH_RESULTS_LIST);
  var $$utilities$$resultsInfo = document.querySelector("" + $$utilities$$SEARCH_RESULTS_INFO);
  var $$utilities$$docFrag = null;

  var $$utilities$$debounce = function $$utilities$$debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this,
          args = arguments;
      var later = function later() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  function $$utilities$$getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }

  function $$utilities$$fetchSongs(query, callback) {
    var endPoint = "" + $$utilities$$API_ENDPOINT + $$utilities$$QUERY_KEY + query;

    if (query === "") {
      $$utilities$$resetResults();
    } else {
      axios.get(endPoint).then(function (response) {
        if (response.data.length) {
          callback(response.data, query);
        } else {
          $$utilities$$drawNoResultsInfo(query);
        }
      })
      // .catch(function (error) {
      //   console.log(error);
      // })
      ;
    }
  }

  function $$utilities$$fetchSong(id, callback) {
    var endPoint = $$utilities$$API_SONG_ENDPOINT + "/" + id + ".json";

    if (typeof id !== "undefined") {
      axios.get(endPoint).then(function (response) {
        callback(response.data);
      });
      // .catch(function (error) {
      //   console.log(error);
      // })
    }
  }

  function $$utilities$$drawSongDetail(_ref) {
    var lyrics = _ref.lyrics,
        video_url = _ref.video_url,
        title = _ref.title,
        artist = _ref.artist,
        general_references = _ref.general_references;

    var video = document.querySelector(".DetailVideo");

    if (video_url !== null) {
      video.setAttribute("src", video_url);
    } else {
      video.style.display = "none";
    }

    if (general_references !== null) {
      document.querySelector(".DetailContent-verses").innerHTML = $$utilities$$createVerseHTML(general_references);
    }

    if (lyrics !== null) {
      var lyrics_with_title = "<p class=\"u-margin-btm-5\"><strong>Lyrics</strong></p>" + lyrics;
      document.querySelector(".DetailContent-lyrics").innerHTML = lyrics_with_title;
    }

    document.querySelector(".DetailContent-title").innerHTML = title;
    document.querySelector(".DetailContent-artist").innerHTML = artist;
  }

  function $$utilities$$createVerseHTML(verseArray) {
    var htmlString = "";

    verseArray.forEach(function (verse) {
      if (verse.verse_text.length) {
        htmlString += "<p class=\"u-margin-btm-neg\"><strong>" + verse.verse_reference + "</strong><p>" + verse.verse_text + "</p>";
      }
    });

    return htmlString;
  }

  function $$utilities$$drawSongs(songs, query) {
    $$utilities$$docFrag = document.createDocumentFragment();

    if (songs.constructor === Array) {
      songs.forEach($$utilities$$pushToSongsList);
      $$utilities$$drawResultsInfo(query, songs.length);
    } else {
      $$utilities$$pushToSongsList(songs);
      $$utilities$$drawResultsInfo(query, 1);
    }
    $$utilities$$resultsList.appendChild($$utilities$$docFrag);
    $$utilities$$docFrag = null;
  }

  function $$utilities$$pushToSongsList(_ref2) {
    var id = _ref2.id,
        title = _ref2.title,
        artist = _ref2.artist;

    var tempDiv = document.createElement('div');

    tempDiv.innerHTML = "<li class=\"SearchResults-listItem u-fadein\" data-song-id=\"" + id + "\"><a href=\"/song.html?q=" + id + "\" class=\"SearchResults-listLink\">" + title + " - " + artist + "</a></li>";
    $$utilities$$docFrag.appendChild(tempDiv.firstChild);
  }

  function $$utilities$$drawResultsInfo(query, count) {
    var resultsInfo = document.querySelector("" + $$utilities$$SEARCH_RESULTS_INFO);

    $$utilities$$resultsList.innerHTML = "";
    resultsInfo.innerHTML = count + " search results for: \"" + query + "\"";
  }

  function $$utilities$$drawNoResultsInfo(query) {
    $$utilities$$resultsList.innerHTML = "";
    $$utilities$$resultsInfo.innerHTML = "0 search results for: \"" + query + "\"";
  }

  function $$utilities$$resetResults() {
    $$utilities$$resultsList.innerHTML = "";
    $$utilities$$resultsInfo.innerHTML = "";
  }

  var src$partials$js$song_search$$searchBar = document.querySelector(".SearchBar");
  var src$partials$js$song_search$$searchResults = document.querySelector(".SearchResults-listItem");
  var src$partials$js$song_search$$termParam = $$utilities$$.getParameterByName("term");

  if (src$partials$js$song_search$$searchBar !== null) {
    src$partials$js$song_search$$searchBar.addEventListener("keyup", $$utilities$$.debounce(function (e) {
      $$utilities$$.fetchSongs(src$partials$js$song_search$$searchBar.value, $$utilities$$.drawSongs);
    }, $$utilities$$.DEBOUNCE_WAIT));
  }

  if (src$partials$js$song_search$$termParam !== null && src$partials$js$song_search$$termParam.length) {
    $$utilities$$.fetchSongs(src$partials$js$song_search$$termParam, $$utilities$$.drawSongs);
  }
}).call(undefined);
"use strict";

(function () {
  "use strict";

  var src$partials$js$utilities$$API_ENDPOINT = "http://c4tk.somamou.org/songs.json";
  var src$partials$js$utilities$$API_SONG_ENDPOINT = src$partials$js$utilities$$API_ENDPOINT.slice(0, -5);
  var src$partials$js$utilities$$QUERY_KEY = "?q=";
  var src$partials$js$utilities$$DEBOUNCE_WAIT = 150;
  var src$partials$js$utilities$$SEARCH_RESULTS_LIST = ".SearchResults-list";
  var src$partials$js$utilities$$SEARCH_RESULTS_INFO = ".SearchResults-info";
  var src$partials$js$utilities$$resultsList = document.querySelector("" + src$partials$js$utilities$$SEARCH_RESULTS_LIST);
  var src$partials$js$utilities$$resultsInfo = document.querySelector("" + src$partials$js$utilities$$SEARCH_RESULTS_INFO);
  var src$partials$js$utilities$$docFrag = null;

  var src$partials$js$utilities$$debounce = function src$partials$js$utilities$$debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this,
          args = arguments;
      var later = function later() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  function src$partials$js$utilities$$getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }

  function src$partials$js$utilities$$fetchSongs(query, callback) {
    var endPoint = "" + src$partials$js$utilities$$API_ENDPOINT + src$partials$js$utilities$$QUERY_KEY + query;

    if (query === "") {
      src$partials$js$utilities$$resetResults();
    } else {
      axios.get(endPoint).then(function (response) {
        if (response.data.length) {
          callback(response.data, query);
        } else {
          src$partials$js$utilities$$drawNoResultsInfo(query);
        }
      })
      // .catch(function (error) {
      //   console.log(error);
      // })
      ;
    }
  }

  function src$partials$js$utilities$$fetchSong(id, callback) {
    var endPoint = src$partials$js$utilities$$API_SONG_ENDPOINT + "/" + id + ".json";

    if (typeof id !== "undefined") {
      axios.get(endPoint).then(function (response) {
        callback(response.data);
      });
      // .catch(function (error) {
      //   console.log(error);
      // })
    }
  }

  function src$partials$js$utilities$$drawSongDetail(_ref) {
    var lyrics = _ref.lyrics,
        video_url = _ref.video_url,
        title = _ref.title,
        artist = _ref.artist,
        general_references = _ref.general_references;

    var video = document.querySelector(".DetailVideo");

    if (video_url !== null) {
      video.setAttribute("src", video_url);
    } else {
      video.style.display = "none";
    }

    if (general_references !== null) {
      document.querySelector(".DetailContent-verses").innerHTML = src$partials$js$utilities$$createVerseHTML(general_references);
    }

    if (lyrics !== null) {
      var lyrics_with_title = "<p class=\"u-margin-btm-5\"><strong>Lyrics</strong></p>" + lyrics;
      document.querySelector(".DetailContent-lyrics").innerHTML = lyrics_with_title;
    }

    document.querySelector(".DetailContent-title").innerHTML = title;
    document.querySelector(".DetailContent-artist").innerHTML = artist;
  }

  function src$partials$js$utilities$$createVerseHTML(verseArray) {
    var htmlString = "";

    verseArray.forEach(function (verse) {
      if (verse.verse_text.length) {
        htmlString += "<p class=\"u-margin-btm-neg\"><strong>" + verse.verse_reference + "</strong><p>" + verse.verse_text + "</p>";
      }
    });

    return htmlString;
  }

  function src$partials$js$utilities$$drawSongs(songs, query) {
    src$partials$js$utilities$$docFrag = document.createDocumentFragment();

    if (songs.constructor === Array) {
      songs.forEach(src$partials$js$utilities$$pushToSongsList);
      src$partials$js$utilities$$drawResultsInfo(query, songs.length);
    } else {
      src$partials$js$utilities$$pushToSongsList(songs);
      src$partials$js$utilities$$drawResultsInfo(query, 1);
    }
    src$partials$js$utilities$$resultsList.appendChild(src$partials$js$utilities$$docFrag);
    src$partials$js$utilities$$docFrag = null;
  }

  function src$partials$js$utilities$$pushToSongsList(_ref2) {
    var id = _ref2.id,
        title = _ref2.title,
        artist = _ref2.artist;

    var tempDiv = document.createElement('div');

    tempDiv.innerHTML = "<li class=\"SearchResults-listItem u-fadein\" data-song-id=\"" + id + "\"><a href=\"/song.html?q=" + id + "\" class=\"SearchResults-listLink\">" + title + " - " + artist + "</a></li>";
    src$partials$js$utilities$$docFrag.appendChild(tempDiv.firstChild);
  }

  function src$partials$js$utilities$$drawResultsInfo(query, count) {
    var resultsInfo = document.querySelector("" + src$partials$js$utilities$$SEARCH_RESULTS_INFO);

    src$partials$js$utilities$$resultsList.innerHTML = "";
    resultsInfo.innerHTML = count + " search results for: \"" + query + "\"";
  }

  function src$partials$js$utilities$$drawNoResultsInfo(query) {
    src$partials$js$utilities$$resultsList.innerHTML = "";
    src$partials$js$utilities$$resultsInfo.innerHTML = "0 search results for: \"" + query + "\"";
  }

  function src$partials$js$utilities$$resetResults() {
    src$partials$js$utilities$$resultsList.innerHTML = "";
    src$partials$js$utilities$$resultsInfo.innerHTML = "";
  }
}).call(undefined);