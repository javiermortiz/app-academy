Function.prototype.myThrottle = function(interval) {
    let tooSoon = false;

    return () => {
        if (!tooSoon) {
            this();
            tooSoon = true;
            global.setTimeout(function () {
                tooSoon = false;
            }, interval);
        }  
    }
}

class Neuron {
    constructor() {
        this.fire = this.fire.myThrottle(2000);
    }

    fire() {
        console.log("Firing!");
    }
}

const neuron = new Neuron();

const interval = setInterval(() => {
    neuron.fire();
}, 10);