import React, { Component } from 'react';
import './App.css';

class App extends Component {
  constructor() {
    super()
    this.state = {}
    this.getEntry = this.getEntry.bind(this)
  }

  componentWillMount() {
    this.getEntry('https://swapi.co/api/people/1/')
  }

  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }

  getEntry (url) {
    console.log('url inside getEntry')
    console.log(url)
    this.fetch(url)
    .then(data => this.setState({data}))
  }

  divList (data) {
    const urlRegex = /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/ig

    if (data) {
      return (
        <div>
          <h1>{data['url'].split('/').slice(-3,-2)}</h1>
            {Object.keys(data).map(function(keyName, keyIndex) {
              if (Array.isArray(data[keyName])) {
                return (
                  <div className="list-container" key={keyIndex}>
                    <b>{keyName}:</b>
                    {Object.keys(data[keyName]).map(function(nestedKey, nestedKeyIndex) {
                      console.log('data[keyName][nestedKey]')
                      console.log(data[keyName][nestedKey])
                      return (
                        <div className="list-item-container">
                          <button className="ui button" onClick={this.getEntry(data[keyName][nestedKey])} key={nestedKeyIndex}>
                            {data[keyName][nestedKey]}
                          </button>
                          <br />
                        </div>
                      )
                    })}
                  </div>
                )
              }else if (urlRegex.test(data[keyName]) && data[keyName]){
                console.log('data[keyName]')
                console.log(data[keyName])
                return (
                  <div>
                    <b>{keyName}</b>: &nbsp;
                    <button className="ui button" onClick={this.getEntry(data[keyName])} key={keyIndex}>
                      {data[keyName]}
                    </button>
                  </div>
                )
              }else {
                return (
                  <div key={keyName}>
                    <b>{keyName}</b>: {data[keyName]}
                  </div>
                )
              }
            })}
        </div>
      )
    }
  }

  render() {
    return (
      <div className="App">
        <header>
          <h1 className="App-title">Star Wars API</h1>
        </header>
          {this.divList(this.state.data)}
      </div>
    );
  }
}

export default App;
