const AllWhiskeys = (props) => {
var whiskeys = props.whiskeys.map((whiskey) => {
    return(
      <div key={whiskey.id}>
        <h1>{whiskey.title}</h1>
        <p>{whiskey.description}</p>
        <p> Taste:{whiskey.taste}
        &nbsp; Color:{whiskey.color}
        &nbsp;Smokiness:{whiskey.smokiness}</p>
      </div>
    )
  })
return(
      <div>
        {whiskeys}
      </div>
    )
}