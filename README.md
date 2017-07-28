# URLockBox
* [URLockBox Production](https://vv-m4-final-assessment.herokuapp.com/links)
* [Hot Reads Service Repo](https://github.com/VictoriaVasys/m4-final-hot-links)
* [Hot Reads Service Production](https://vv-m4-final-hot-links.herokuapp.com/) 

## Victoria Vasys Turing Mod 4 Final Assessment
This is the final assessment for Mod 4 of the Turing School of Software and Design. Students were permitted a total of 16 hours across two days to complete authentication, submission and viewing of valid links, editing links, dynamically marking and filtering links, and building a separate service that tracked "hot reads" (see [Application](#application) for more details on use).

## Table of contents

- [Application](#application)
    - [Tech Stack](#tech-stack)
- [Setup](#setup)
- [Testing](#testing)
- [API Endpoints](#api-endpoints)
- [Contributors](#contributors)
- [Links](#links)

## Application

Save a wishlist of links & track whether you've read them or not! The Hot Reads service tracks all user's reads; if your link was the most-read in 24 hours, it'll get the tag "Top Link!" And if your link is in the top-10 most-read links of the day, it'll be marked "Hot!" Feel free to add and edit any link.

### Tech Stack

* Ruby Version 2.2.5
* Rails Version 5.0.0
* RSpec

## Setup

1. Clone down repository: `git clone git@github.com:VictoriaVasys/Final-Assessment.git`
2. From project directory, run the following from the Command Line Interface (CLI) in sequential order:
    1. Install dependencies: 
    ```
    bundle install
    ```
    2. Create & migrate the database: 
    ```
    bin/rails db:{create,migrate}
    ```
    <!-- 3. `rake db:seed` -->
    3. Run the server
    ```
    rails server
    ```
    4. Navigate to http://localhost:3000

## Testing

Tests run via RSpec & Selenium Webdriver

1. Ensure Firefox version 46 is installed (Selenium does not work with all versions of Firefox):
[download here](https://www.softexia.com/windows/web-browsers/firefox-46). 

  If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then turn off wifi & install version 46.
2. Run testing suite from the CLI: 
```
`rspec`
``` 
(In order to run a singular test, run `rspec spec/<file path>`)

## API Endpoints
*  All endpoints are RESTful and all responses are in JSON format. Some important things to note:
* All API endpoints begin with `https://vv-m4-final-assessment.herokuapp.com/api/v1/`
* Requests are case sensitive
* Params for POST and PUT requests should be passed as x-www-form-urlencoded

### Links
|**HTTP Verb/Method**|**URI Path**|**Description**|**Parameters**|
| --- | --- |:---:| --- |
|GET|links|returns an array of up-to 10 most-read links|none|
|POST|links|adds an link (valid URL required) to the database|`?title=<string>&url=<string>`|
|PATCH|links/:id|updates a link|`?read=<boolean>` or `?title=<string>` or `?url=<string>`|
<!-- |GET|foods/:id|returns a food based on `id`|none| -->
<!-- |DELETE|foods/:id|renders a food inactive|`?name=<string>` or `?calories=<integer>`| -->

## Contributors
* Victoria Vasys https://github.com/VictoriaVasys (assessee)
* Nate Allen https://githubb.com/neight-allen (contributed to starter kit)
* Andrew Carmer https://githubb.com/Carmer (contributed to starter kit)

## Links
* [URI Lockbox Production](https://vv-m4-final-assessment.herokuapp.com/)
* [Hot Reads Service Repo](https://github.com/VictoriaVasys/m4-final-hot-links)
* [Hot Reads Service Production](https://vv-m4-final-hot-links.herokuapp.com/) 
* [VV's Waffle Project Managment](https://waffle.io/VictoriaVasys/Final-Assessment)
* [Issue Reporting](https://github.com/VictoriaVasys/Final-Assessment/issues)
* [Turing Starter Kit](https://github.com/turingschool/m4-final-starter)
* [Turing Assessment Spec](https://gist.github.com/neight-allen/4cb05991a97ac9970dc1620d1f1734fb)
* [Nate Allen's Walkthrough & Expectations](https://vimeo.com/198611383)
