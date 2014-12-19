polymer-rails-forms
===================


##What this gem does

This gem depends on emcee and adds to your vendor/assets/components directory
the rails-form element. Which, unsurprisingly, let's you create rails compatible 
forms in polymer by simply defining a form's structure and optionally data via 
javascript. 

##Installation

first follow the installation instructions for emcee

```
	gem install polymer-rails-form
	rake polymer_rails_forms:install
```

then in your /app/assets/components/application.html file add

```
	*= require rails-forms/rails-form
```

##Basic example
This is what a simple login form could look like using this gem

```html
<rails-form id='sign_in_form' action="/users/sign_in" methos="POST" scope="user" submitText="Sign In"></rails-form>
<script>
	document.getElementById("sign_in_form").setAttribute("structure", JSON.stringify({
		email: { type: 'string', label: "Email Address" },
    	password: { type: 'password' }
    }))
</script>
```
