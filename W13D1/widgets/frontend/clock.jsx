import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { date: new Date() };
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({date: new Date()});

    }

    componentDidMount() {
        this.interval = setInterval(this.tick, 1000 );
    }

    componentWillUnmount () {
        clearInterval(this.interval);
    }

    render() {
        const {date} = this.state;
        return <div>
            <h1>Time: { date.getHours() }:{ date.getMinutes() }:{ date.getSeconds() }</h1>
            <h1>Date: { date.toDateString() }</h1>
        </div>
    }

}



export default Clock;