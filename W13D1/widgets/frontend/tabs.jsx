import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { selected: 0 }
        this.changePane = this.changePane.bind(this);
    }

    changePane (e, idx) {
        // const key = e.currentTarget.attribute("idx");
        this.setState({ selected: idx });
    }
    
    render() {
        const article = <article>{this.props.data[this.state.selected].content}</article>
        const lis = this.props.data.map((el, idx) => {
            return <li onClick={ (e) => this.changePane(e, idx)} key={ idx }>{el.title}</li> 
        })
        console.log(lis);
        return <div>
            <ul>
                {lis}
                </ul>
                { article }
            </div>
    }
}

export default Tabs;


// const breeds = [
//     'Alaskan Malamute',
//     'Greater Swiss Mountain Dog',
//     'Bernese',
//     'Labrador'
// ];

// const breedLis = breeds.map(
//     (breed, i) => <DogDetail
//         key={i}
//         breed={breed}
//         vote={this.vote}
//         totalVotes={this.state.votes}
//     />
// );


// const DogDetail = ({ vote, breed, totalVotes }) => {
//     return <li onClick={vote}>
//         {breed}. Total votes: {totalVotes}
//     </li>;
// };

{/* <input onChange={ (e) => this.handleChange(e, "name") } type="text" ></input>
<input onChange={(e) => this.handleChange(e, "email")} type="email" ></input>
<input onChange={(e) => this.handleChange(e, "password")} type="password" ></input>

function handleChange(e, field) {
    this.setState({field: e.currentTarget.value})
} */}