# Geolocation API

This is an API to store Geolocation data from `https://ipstack.com`

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Ruby 3.0.3
* Bundler
* Rails 7.0.3

### Running the API App
1. Clone the repository using the following command
   ```
   git clone https://github.com/shariful-alam/test-geolocation-api.git
   ```
   or
   ```
   git clone git@github.com:shariful-alam/test-geolocation-api.git
   ```

2. Install dependency by running `bundle install`


3. Create database.yml file using the following command
    ```
    cp config/database.sample.yml config/database.yml
    ```
4. Create and migrate database
   ```
   rake db:create
   rake db:migrate
   ```

5. Start the server at default port 3000 by running `rails s`

## API Documentation

### Create Geolocation
Create Geolocation using `ip` or `url`
* **URL** `/geolocations`
  

* **Method:** `POST`
  

* **Payload**
   ```json
   {
       "geolocation": {
           "ip": "123.456.789.111"
       }
   }
   ```
   OR
   ```json
   {
       "geolocation": {
           "url": "www.google.com"
       }
   }
   ```

### Fetch Geolocation Data
Get existing Geolocation data
* **URL** `/geolocations`


* **Method:** `GET`


* **Payload**
   ```json
   {
       "geolocation": {
           "ip": "123.456.789.111"
       }
   }
   ```
  OR
   ```json
   {
       "geolocation": {
           "url": "www.google.com"
       }
   }
   ```
  
### Delete Geolocation
Delete an existing Geolocation data
* **URL** `/geolocations`


* **Method:** `DELETE`


* **Payload**
   ```json
   {
       "geolocation": {
           "ip": "123.456.789.111"
       }
   }
   ```
  OR
   ```json
   {
       "geolocation": {
           "url": "www.google.com"
       }
   }
   ```
  