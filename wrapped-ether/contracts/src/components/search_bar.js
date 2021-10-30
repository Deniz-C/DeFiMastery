import React, { Component } from 'react';

// const SearchBar = () => {
//   return <input />;
// };

class SearchBar extends Component {
  constructor(props) {
    //parent method
    super(props);
    // property search term record, and update the state
    this.state = { term: '' };
}

  render() {
    return (
      <div className='search-bar'>
        <input
        //controlled component, change the input val
          value={this.state.term}
          onChange={ (event) => this.onInputChange(event.target.value)}/>
      </div>
    );
  }

  onInputChange(term) {
    this.setState({term});
    this.props.onSearchTermChange(term);
  }
  //event handler
}

export default SearchBar;
