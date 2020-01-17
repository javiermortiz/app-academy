import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor (props) {
        super(props);
        this.state = { searchTerm: ""};
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

    componentDidMount() {
        this.props.fetchSearchGiphys('puppy');
    }

    handleChange (e) {
        e.preventDefault();
        this.setState({searchTerm: e.target.value});
    }

    handleSubmit (e) {
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm.split(' ').join('+'));
        this.setState({searchTerm: ""})
    }

    render () {
        return (
            <div>
                <GiphysIndex giphys={this.props.giphys} />
                <form onSubmit={this.handleSubmit}>
                    <input type="text" onChange={this.handleChange} value={this.state.searchTerm}/>
                    <button>Submit</button>
                </form>
            </div>
        )
    }
};

export default GiphysSearch;