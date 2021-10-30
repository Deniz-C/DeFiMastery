import _ from 'loadash';
import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import YTSearch from 'youtube-api-search';
import SearchBar from './components/search_bar';
import VideoList from './components/video_list';
import VideoDetail from './components/video_detail';
const API_KEY = 'AIzaSyBuh5Up7PHkizmJ71ObeT4Pix0OsIqC7ZY';

// component to produce HTML
class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      videos: [],
      selectedVideo: null
    };

    this.videoSearch('trending');
  }

  videoSearch(term) {
    YTSearch({ key: API_KEY, term: term},(videos) => {
      this.setState({
        videos:videos,
        selectedVideo: videos[0]
       });
    });
  }

  render() {
    const videoSearch = _.debounce((term) => { this.videoSearch(term) }, 500);

    return (
      <div>
        <SearchBar onSearchTermChange = {videoSearch}/>
        <VideoDetail video={this.state.selectedVideo} />
        <VideoList
         onVideoSelect={selectedVideo => this.setState({selectedVideo})}
         videos={this.state.videos} />
      </div>
    );
  }
}

// need a instance of the component, wrap with jsx tag
//Take this generated HTML and put it in the DOM
//reference to container
ReactDOM.render(<App />, document.querySelector('.container'));
