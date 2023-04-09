import confetti from "https://cdn.skypack.dev/canvas-confetti@1.4.0";

const confettiBtn = document.querySelector(".canvas-confetti-btn");
let exploding = false;

const defaults = {
    particleCount: 500,
    spread: 80,
    angle: 50,
};

const fire = (particleRatio, opts) => {
    confetti(
        Object.assign({}, defaults, opts, {
            particleCount: Math.floor(defaults.particleCount * particleRatio),
            origin: {
                x: 0,
                y: 0
            },
            angle: -40,
            //   spread: 180
        })
    );

    confetti(
        Object.assign({}, defaults, opts, {
            particleCount: Math.floor(defaults.particleCount * particleRatio),
            origin: {
                x: 1,
                y: 0
            },
            angle: 220,
            //   spread: 180
        })
    );
};

// var notify = document.getElementById("page");
// notify.volume = 0.5;

// $(document).ready(function() {
//     notify.currentTime = 0
//     notify.play();
// });

function shootConfetti() {
    window.setTimeout(() => {
        fire(0.25, {
            spread: 26,
            startVelocity: 55,
        });
        fire(0.2, {
            spread: 60,
        });
        fire(0.35, {
            spread: 100,
            decay: 0.91,
            scalar: 0.8,
        });
        fire(0.1, {
            spread: 120,
            startVelocity: 25,
            decay: 0.92,
            scalar: 1.2,
        });
        fire(0.1, {
            spread: 120,
            startVelocity: 45,
        });

        window.setTimeout(() => {
            exploding = false;
        }, 300);
    }, 300);
}

function Trophy(title, description, difficult, confeti, sound) {
    this.title = title;
    this.description = description;
    this.difficult = difficult;
    this.confeti = confeti;
    this.sound = sound;
    this.Show = function () {
        $("#achievementTitle").html(this.title);
        $("#achievementDescription").html(this.description);
        $("#achievementContainer").css("display", "block")
        if(this.confeti)
            $("#achievementSound")[0].play()
        if(this.sound)
            shootConfetti();
    }
}
$(document).ready(function(){
    window.addEventListener("message", function(event){
        switch(event.data.action){
            case "NewTrophy":
                const a = event.data;
                let trophy = new Trophy(a.title, a.description, a.difficult, a.confetti, a.sound)
                trophy.Show();
        }
    })
});