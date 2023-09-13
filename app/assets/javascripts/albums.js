(function() {
  $(function() {
    const filter_by = function(genre, label) {
      location.href = `albums?genre=${genre}&label=${label}`
    };

    if ($('div.albums_index').length > 0) {
      let genre = $('#genre')[0].value;
      let label = $('#label')[0].value;

      $('#genre_select').on('change', function(e) {
        genre = e.target.value;
        filter_by(genre, label)
      });

      $('#label_select').on('change', function(e) {
        label = e.target.value;
        filter_by(genre, label)
      });
    }
  });
}).call(this);
