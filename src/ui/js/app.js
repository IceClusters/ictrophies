import confetti from "https://cdn.skypack.dev/canvas-confetti@1.4.0";
let exploding = false;
let isOpen = false;

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
        })
    );
};

$(document).ready(function () {
    notify.currentTime = 0
    notify.play();
});

function shootConfetti(type) {
    switch (type) {
        case 0:
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
            break;
        case 1:
            var duration = 9 * 1000;
            var animationEnd = Date.now() + duration;
            var defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 };

            function randomInRange(min, max) {
                return Math.random() * (max - min) + min;
            }

            var interval = setInterval(function () {
                var timeLeft = animationEnd - Date.now();

                if (timeLeft <= 0) {
                    return clearInterval(interval);
                }

                var particleCount = 50 * (timeLeft / duration);
                // since particles fall down, start a bit higher than random
                confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 } }));
                confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 } }));
            }, 250);
            break;
        case 2:
            var end = Date.now() + (9 * 1000);
            // go Buckeyes!
            var colors = ['#bb0000', '#ffffff'];

            (function frame() {
                confetti({
                    particleCount: 2,
                    angle: 60,
                    spread: 55,
                    origin: { x: 0 },
                    colors: colors
                });
                confetti({
                    particleCount: 2,
                    angle: 120,
                    spread: 55,
                    origin: { x: 1 },
                    colors: colors
                });

                if (Date.now() < end) {
                    requestAnimationFrame(frame);
                }
            }());
            break;
    }

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
            shootConfetti(this.type);

        setTimeout(() => {
            $("#achievementContainer").css("display", "none")
        }, 10000);
    }
}

$(document).ready(function () {
    let trophy = new Trophy("title", "description", 2, true, true).Show();

    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "NewTrophy":
                const a = event.data;
                let trophy = new Trophy(a.title, a.description, a.type, a.confetti, a.sound).Show();
                break;
            case "OpenMenu":
                if (!isOpen) {
                    $(".container__menu").css({ "display": "flex" }).fadeIn(700);
                }
                isOpen = true;
                break;
        }
    })
});

document.addEventListener("keypress", function (event) {
    if (event.keyCode == 27 || event.keyCode == 76) {
        isOpen = false;
        $(".container__menu").css({ "display": "none" }).fadeOut(700);
        $.post("http://ice_trophies/ice_trophies:menuClose", JSON.stringify({}));
    }
});

document.addEventListener("DOMContentLoaded", () => {
    const name = "KDex"
    const nombre = name.split(" ").map((word) => word.charAt(0).toUpperCase()).join("");
    const imgUrl = `http://via.placeholder.com/100x100&text=${nombre}`
    const userPhoto = document.getElementById("logo_user");
    userPhoto.innerHTML = `<img src="${imgUrl}">`;
});