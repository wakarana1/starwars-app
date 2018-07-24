import React, { Component } from 'react';
import './App.css';

class App extends Component {
  constructor() {
    super()
    this.state = {}
  }

  componentWillMount() {
    this.getEntry('https://swapi.co/api/people/1')
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
    this.fetch(`api/landing?url=${url}`)
    .then(data => this.setState({data}))
  }

  divList (data) {
    const urlRegex = /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/ig

    if (data) {
      return (
        <div>
          <h1>{data['url'].split('/').slice(-3,-2)}</h1>
            {Object.keys(data).map((keyName, keyIndex) => {
              if (Array.isArray(data[keyName])) {
                return (
                  <div className="list-container" key={keyIndex}>
                    <b>{keyName}:</b>
                    {Object.keys(data[keyName]).map((nestedKey, nestedKeyIndex) => {
                      return (
                        <div className="list-item-container" key={nestedKeyIndex}>
                          <button className="ui button" onClick={() => this.getEntry(data[keyName][nestedKey])} >
                            {data[keyName][nestedKey]}
                          </button>
                          <br />
                        </div>
                      )
                    })}
                  </div>
                )
              }else if (data[keyName] && urlRegex.test(data[keyName])){
                return (
                  <div key={keyIndex}>
                    <b>{keyName}</b>: &nbsp;
                    <button className="ui button" onClick={() => this.getEntry(data[keyName])} >
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
    } else {
      return (
        <div>Loading...</div>
      )
    }
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">Star Wars API</h1>
        </header>
          {this.divList(this.state.data)}
      </div>
    );
  }
}

export default App;
