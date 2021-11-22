$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        $("#boxStamina").css("height",data.stamina + "%");
        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
        }
    })
})


function updateStatus(status){
    $('#boxHunger').css('height', status[0]+'%')
    $('#boxThirst').css('height', status[1]+'%')
}

$(function() {
    var $voice = $("#boxVoice")
    window.addEventListener('message', function(event){
        $voice.css("height", event.data.voiceheal + "%");
        if (event.data.talking == true) 
        {
            $voice.css("background", "linear-gradient(to bottom, #6600cc 0%, #9933ff 100%)")
        }
        else if (event.data.talking == false)
        {
            $voice.css("background", "rgba(255, 255, 255, 0.4)")
        }
    }); 
});
