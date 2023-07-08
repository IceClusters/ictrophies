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

function Trophy(title, description, type, confeti, sound) {
    this.title = title;
    this.description = description;
    this.type = type;
    this.confeti = confeti;
    this.sound = sound;
    this.Show = function () {
        $("#achievementTitle").html(this.title);
        $("#achievementDescription").html(this.description);
        $("#achievementContainer").css("display", "block")
        if (this.sound)
            $("#achievementSound")[0].play()
        if (this.confeti)
            shootConfetti();

        setTimeout(() => {
            $("#achievementContainer").css("display", "none")
        }, 10000);
    }
}
$(document).ready(function () {
    // let trophy = new Trophy("title", "description", "professional", true, true);
    // trophy.Show();
    window.addEventListener("message", function (event) {


        switch (event.data.action) {
            case "NewTrophy":
                const a = event.data;
                let trophy = new Trophy(a.title, a.description, a.type, a.confetti, a.sound)
                trophy.Show();
        }
    })
});



document.addEventListener("DOMContentLoaded", () => {
    const name = "KDex"
    const nombre = name.split(" ").map((word) => word.charAt(0).toUpperCase()).join("");
    const imgUrl = `http://via.placeholder.com/100x100&text=${nombre}`
    const userPhoto = document.getElementById("logo_user");
    userPhoto.innerHTML = `<img src="${imgUrl}">`;

});