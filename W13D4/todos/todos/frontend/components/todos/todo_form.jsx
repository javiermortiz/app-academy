import React from 'react';
import uniqueId from '../../util/util';

class TodoForm extends React.Component {
    constructor (props) {
        super(props);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.render = this.render.bind(this);
        this.state = {body: "", title: "", done: true};
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
    }

    updateTitle (e) {
        this.setState({ title: e.target.value });
    }

    updateBody (e) {
        this.setState({ body: e.target.value });
    }

    handleSubmit (e) {
        e.preventDefault();
        this.props.dispatchCreateTodo(this.state).then(
            () => this.setState({title: '', body: ''})
        );
        this.setState({title: "", body: ""});
    }

    render () {
        return (
                <form onSubmit={ this.handleSubmit }>
                    <label htmlFor="title-input">
                        Title
                    </label>
                    <input type="text"
                        id="title-input"
                        onChange={this.updateTitle}
                        value={this.state.title} />
                    <label htmlFor="body-input">
                        Body
                    </label>
                    <input type="text"
                        id="body-input"
                        onChange={this.updateBody}
                        value={this.state.body} />
                    <input type="submit" value="Submit"/>
                </form>
        )
    }
}

export default TodoForm;