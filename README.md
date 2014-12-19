polymer-rails-forms
===================


##What this gem does

This gem depends on emcee and adds to your vendor/assets/components directory
the rails-form element. Which, unsurprisingly, let's you create complex rails compatible 
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

This syntax, however short is a bit clunky, a better way of using this gem is to create forms by creating a 
polymer element that extends rails-form. Here's the same login form


```html
<link rel="import" href="../rails-forms/rails-form.html" >
<polymer-element name="login-form" extends='rails-form'>
  <shadow></shadow>
  
  <script>
    Polymer({
      action: "/users/sign_in",
      method: "POST",
      scope: "user",
      submitText: "Sign In",

      ready: function(){
        this.structure = {
          email: { type: 'string', label: "Email Address" },
          password: { type: 'password' },
        }               
      }
    });
  </script>
</polymer-element>
```

This syntax gives you the flexibility to add encapulated methods and styles. It's a lot 
better for complex forms. 

Nested attributes are supported (otherwise what's the point right?). This is that login form 
again, but this time with nested location attributes

```html
<link rel="import" href="../rails-forms/rails-form.html" >
<polymer-element name="login-form" extends='rails-form'>
  <shadow></shadow>
  
  <script>
    Polymer({
      action: "/users/sign_in",
      method: "POST",
      scope: "user",
      submitText: "Sign In",

      ready: function(){
        this.structure = {
	      email: { type: 'string', label: "Email Address" },
	      password: { type: 'password' },
	      location: { type: 'nest', allowAdd: false, multiple: false, structure: {
	          address: { type: "string" },
    		  city: { type: "string" },
    		  state: { type: "string" },
    		  zip: { type: "string" }
	      	}
	      }
        }               
      }
    });
  </script>
</polymer-element>
```

This would give the location input the name ```user[location_attributes][city]```. If you were 
to set ```multiple: true``` the name would become ```user[location_attributes][0][city]```. And if 
you were to set ```allowAdd: true``` the inputs would be in a list with the option to create more. 


####Note:

If you're going to use the domReady function in your custom form element, be sure to call
```this.super()``` at the top of the function to run the form's default domReady functionality 
(which includes appending all the inputs so... kind of important). If you don't want the default 
functionality though, just make sure you run the ```this.appendInputs()``` so the inputs get added. 

###XHR

To make the form ajaxy just include the form element's ```xhr='true'``` param 
and override the ```handleXhrCallback``` function. 

##What's supported what's not

###So far the field types that are supported are:

* string
* password
* hidden
* textarea
* email
* url
* integer
* date (uses pickaday.js)
* location (uses google places API, which you'll have to include separately)
* image (works, but CSS is messed up)
* checkbox
* json (limted, only basic objects are supported so far, not nested arrays and objects)

###What's not supported 

* radio buttons
* selects
* ranges
* everything else

Support for radio buttons, ranges (sliders), and selects will hopefully be coming shortly. 
Everything else, who knows. This is still a very early release. 

