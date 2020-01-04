Function.prototype.inherits = function(SuperClass) {
  function Surrogate() {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject() { }

MovingObject.prototype.test = function() {
  console.log('Test passed');
}

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);
Asteroid.prototype.test2 = function () {
    console.log('Asteroid method')
}

asteroid = new Asteroid();
ship = new Ship();
window.ship = ship;
movingObject = new MovingObject();
// asteroid.test();
// ship.test2(); 
asteroid.test2();
// movingObject.test2();
console.log(ship.__proto__.prototype instanceof MovingObject);
console.log(asteroid.prototype instanceof MovingObject);

Function.prototype.inherits = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype);
    this.prototype.constructor = this;
}