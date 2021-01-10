class Body extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      whiskeys: []
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewWhiskey = this.addNewWhiskey.bind(this)
    this.searchWhiskeys = this.searchWhiskeys.bind(this)

  }
  handleFormSubmit(title, description, taste, color, smokiness){
    let body = JSON.stringify({whiskey: {title: title, description:   description, taste:taste, color:color, smokiness:smokiness} })
    fetch('http://localhost:3000/whiskeys', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: body,
      }).then((response) => {return response.json()})
      .then((whiskey)=>{
        this.addNewWhiskey(whiskey)
    })  
  }
  addNewWhiskey(whiskey){
    this.setState({
      whiskeys: this.state.whiskeys.concat(whiskey)
    })
  }

  searchWhiskeys(term){
    fetch(`/whiskeys/search?term=${term}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        },
      }).then((response) => {return response.json()})
      .then(json => this.setState({whiskeys: json}))
    
  }


  componentDidMount(){
    fetch('/whiskeys')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ whiskeys: data }) });
  }

  render(){
    return(
      <div>
        <NewWhiskey handleFormSubmit={this.handleFormSubmit}/><br />
        <SearchWhiskeys searchWhiskeys={this.searchWhiskeys}  />
        <AllWhiskeys whiskeys={this.state.whiskeys}  />
      </div>
    )
  }
}