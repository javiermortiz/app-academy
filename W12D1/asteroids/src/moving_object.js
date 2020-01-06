function MovingObject(options){
    this.pos = options["pos"]; // this.pos = [x, y]
    this.vel = options["vel"];
    this.radius = options["radius"];
    this.color = options["color"];
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
}

module.exports = MovingObject;