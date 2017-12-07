/**
 * Created by Nicolas Crelier on 2017-04-10.
 */


const timerId = setInterval(countdown, 1000);

let timeLeft;

timeLeft = 29;


const elem = document.getElementById('timer');
function countdown() {
    if (timeLeft === 0) {
        clearTimeout(timerId);
        doSomething();
    } else {
        // elem.innerHTML = '<strong>Attention : </strong>Cette page va se rafraichir dans ${timeLeft} secondes !';
        timeLeft--;
    }
}

setTimeout(function () {
    location.reload();
}, 30000);