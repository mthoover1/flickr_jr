$(document).ready(function() {
  $('.next').click(function(event) {
    event.preventDefault;

    var photo_id_string = document.forms[0].photo_id.value;
    var album_id_string = document.forms[0].album_id.value;
    var id_string = document.forms[0].album_photo_ids.value;

    var photo_id = Number(photo_id_string);
      parseInt(photo_id, 10);
      parseFloat(photo_id);
      +photo_id;

    var album_id = Number(album_id_string);
      parseInt(album_id, 10);
      parseFloat(album_id);
      +album_id;

    var id_reduced = id_string.replace("[", "").replace("]", "").split(", ")

    var album_photo_ids = []

    for (id in id_reduced) {
      var int = Number(id_reduced[id]);
      parseInt(int, 10);
      parseFloat(int);
      +int;
      album_photo_ids.push(int);
    }

    var length = album_photo_ids.length;

    var position = album_photo_ids.indexOf(photo_id);

    if (position > -1) {
      $.post("/albums/" + album_id_string + "/" + id_reduced[position+1], function(response){
        $('body').html(response);
      });
    }
    else {
      $.post("/albums/" + album_id + "/" + album_photo_ids[0]);
    };
  });
});
