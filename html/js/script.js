var up = false;

function polaroidshow(source, film) {
    if(!up){
        $('#popup').fadeIn('slow');
        $('.popupclass').fadeIn('slow');
        $('<img class="image2" src='+source+' style = "position: absolute; width:44.7em; height: 38.5em;">').appendTo('.popupclass')
        $('<img class="image1" src="./img/film'+film+'.png" style = "width:53.2em; height: 53.2em;"/>').appendTo('.popupclass')
        up = true
    }
}

function polaroidhide() { 
    if(up){
        $('#popup').fadeOut('slow');
        $('.popupclass').fadeOut('slow');
        $('.popupclass').html("");
        up = false
        $.post('https://rt-polaroid/Close', JSON.stringify({}));
    }
}


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESCAPE
        polaroidhide()
            break;
    }
});

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "Show":
                polaroidshow(event.data.photo, event.data.film);
                break;
        }
    })
});