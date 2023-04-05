var notify = document.getElementById("page");
notify.volume = 0.5;

$(document).ready(function() {
    notify.currentTime = 0
    console.log("Page loaded")
    notify.play();
});