import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor() {
    super()
    this.state = {
      data: {}
    }
    this.getPerson    = this.getPerson.bind(this)
    // this.getFilm      = this.getFilm.bind(this)
    // this.getPlanet    = this.getPlanet.bind(this)
    // this.getSpecies   = this.getSpecies.bind(this)
    // this.getStarship  = this.getStarship.bind(this)
    // this.getVehicle   = this.getVehicle.bind(this)
  }
  componentDidMount() {
    this.getPerson(1)
  }

  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    })
  }

  getPerson (id) {
    this.fetch(`api/people/#{id}`)
    .then(data => this.setState({data}))
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        {console.log(this.state.data[0])}
      </div>
    );
  }
}

export default App;
