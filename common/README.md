# R Shiny Unimelb Template

This is a template for you to insert your own R code.  It will be in University of Melbourne format.

Note that ideally this would use the file https://d2h9b02ioca40d.cloudfront.net/v8.0.1/uom.js.  However, this file clashes quite severely with the R shiny functionality.  

Therefore, certain aspects of the code are hacked on - e.g. the footer (without search form) is added manually.  The header bar also does not behave perfectly 
(does not shrink in height but remain visible after scrolling down).

## To run in development mode

1. Install R on your machine.  This app needs at least version 3.6.0.  Check your R version with `R --version`
2. Git clone this template onto your machine
3. Change to that directory
4. Run it by typing "R" in a terminal
5. Install some packages:
```
install.packages('shiny')
```
6. `library(shiny)`
7. `runApp('.')`  This should automatically open your browser and display the app.

After you have installed and run this for the first time, only steps 3, 4, and 6, 7 will be required.

## To Modify Your Already Written App

There is also a directory and some templates to insert into your already written app. For example, in your ui.R:

```
shinyUI(
        fluidPage( 

	<Your amazing R app code>
	)
)
```

Wrap the University branding around your code like:

```
shinyUI(
        fluidPage( 
		theme="https://d2h9b02ioca40d.cloudfront.net/v8.0.1/uom.css",
		tags$head(includeHTML("common/unset_shiny.html")),

		htmlTemplate("common/uomheader.html",
               		title = "My Research Page",
			apptitle = "My Amazing App",
			subapptitle = "An app, that is very cool (This must be defined, but can be an empty string if your app doesn't need a subtitle)"
               	),


		<Your amazing R app code>, # Make sure you put this comma in at the end of your code

		htmlTemplate("common/uomfooter.html")
        )
)
```

This assumes that you have places the `common` directory in the same directory as your app. You can place the common directory anywhere in your project, just be sure to update the relative path. 

The `common` directory contains:

1. `uomheader.html` - The University branded header code.
2. `uomfooter.html` - The University branded footer code.
3. `unset_shiny.html` - Some hacks to get around conflicts between the University branded css and some style settings in the Shiny style settings. 
