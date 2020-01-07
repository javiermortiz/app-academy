function MovingObject(options){
    this.pos = options["pos"]; // this.pos = [x, y]
    this.vel = options["vel"];
    this.radius = options["radius"];
    this.color = options["color"];
    this.game = options["game"];
}

MovingObject.prototype.draw = function(ctx){
    ctx.beginPath();
    ctx.arc(this.pos[0],this.pos[1],this.radius,0,2*Math.PI,true);
    ctx.strokeStyle = this.color;
    ctx.stroke();
};

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0]; // [x, y]
    this.pos[1] += this.vel[1];
    [this.pos[0], this.pos[1]] = this.game.wrap(this.pos);

}

MovingObject.prototype.isCollideWith = function (otherObject) {
    //if the distance between their center points is less than the sum of their radii.
    //Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
    let distance = Math.sqrt((this.pos[0] - otherObject.pos[0])**2 + (this.pos[1] - otherObject.pos[1])**2);
    if (distance < (this.radius + otherObject.radius)) {
        return true; 
    } else {
        return false;
    }
};

module.exports = MovingObject;