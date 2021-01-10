const NewWhiskey = (props) => {
  let formFields = {}
 
  return(
    <form onSubmit={ (e) => { 
          e.preventDefault();
          props.handleFormSubmit(
            formFields.title.value,
            formFields.description.value,
            formFields.taste.value,
            formFields.color.value,
            formFields.smokiness.value
          ); 
          e.target.reset();}
      }>
      <input ref={input => formFields.title = input} placeholder='Enter the title of the item'/>
      <input ref={input => formFields.description = input} placeholder='Enter a description' />
      <input ref={input => formFields.taste = input} placeholder='Enter the taste' />
      <input ref={input => formFields.color = input} placeholder='Enter the color' />
      <input ref={input => formFields.smokiness = input} placeholder='Enter the smokiness' />
      <button>Submit</button>
    </form>
    )
}