var pshow = false;

function polaroidshow(source, film) {
    if(!pshow){
        $('#polaroid').fadeIn('slow');
        $('.polaroidshow').fadeIn('slow');
        $('<img class="picture" src='+source+' style = "position: absolute; width:44.7em; height: 38.5em;">').appendTo('.polaroidshow')
        $('<img class="borderfilm" src="./img/film'+film+'.png" style = "width:53.2em; height: 53.2em;"/>').appendTo('.polaroidshow')
        pshow = true
    }
}

function polaroidhide() { 
    if(pshow){
        $('#polaroid').fadeOut('slow');
        $('.polaroidshow').fadeOut('slow');
        $('.polaroidshow').html("");
        pshow = false
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