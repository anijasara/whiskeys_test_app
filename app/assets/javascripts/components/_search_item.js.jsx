const SearchWhiskeys = (props) => {
  let formFields = {}
 
  return(
    <form onKeyPress={ (e) => { 
        if (e.which == 13) {
          e.preventDefault();
          props.searchWhiskeys(
            formFields.term.value
          ); 
          e.target.reset();}
        }
      }>
      <input ref={input => formFields.term = input} placeholder='Enter the search param'/>&nbsp;
      Based on taste, color or smokiness get the whiskeys list!
    </form>
    )
}
