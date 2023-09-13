(function() {
  $(function() {
    if ($('div.albums_index').length > 0) {
      $('select#genre').on('change', function(e) {
        const genre = e.target.value;
        location.href = "albums?genre=" + genre
      });
    }
  });
}).call(this);
