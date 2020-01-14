import React from 'react'

class Clock extends React.Component {
    constructor (props) {
        super(props);
        this.state = { time: new Date ()};
        this.tick = this.tick.bind(this);
    }

    tick () {
        this.setState({ time: new Date ()});
    }

    componentDidMount () {
        this.interval = setInterval(this.tick, 1000);
    }

    componentWillUnmount () {
        clearInterval(this.interval);
    }

    render () {
        const hours = this.state.time.getHours();
        const minutes = this.state.time.getMinutes();
        const seconds = this.state.time.getSeconds();
        
        return (<div className="clock">
            <h1>Date: { this.state.time.toDateString() }</h1>
            <h1>Time: { hours }:{ minutes }:{ seconds }</h1>
        </div>)
    }
};

export default Clock;