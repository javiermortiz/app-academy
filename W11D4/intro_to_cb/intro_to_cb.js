class Clock {
    constructor() {
        // 1. Create a Date object.
        let date = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.date_hours = date.getHours();
        this.date_minutes = date.getMinutes();
        this.date_seconds = date.getSeconds();
        // 3. Call printTime.
        this.printTime(this.date_hours, this.date_minutes, this.date_seconds);
        // 4. Schedule the tick at 1 second intervals.
        const interval = setInterval(this._tick.bind(this), 1000);
    }

    printTime(hours, minutes, seconds) {
        // Format the time in HH:MM:SS
        let time = `${hours}:${minutes}:${seconds}`;
        // Use console.log to print it.
        console.log(time);
    }

    _tick() {
        // 1. Increment the time by one second.
        this.date_seconds += 1;
        if (this.date_seconds === 60) {
            this.date_minutes += 1;
            this.date_seconds = 0;
        }
        if (this.date_minutes === 60) {
            this.date_hours += 1;
            this.date_minutes = 0;
        }
        if (this.date_hours === 24) {
            this.date_hours = 0;
            this.date_minutes = 0;
            this.date_seconds = 0;
        }
        // 2. Call printTime.
        this.printTime(this.date_hours, this.date_minutes, this.date_seconds);
    }
}

const clock = new Clock();