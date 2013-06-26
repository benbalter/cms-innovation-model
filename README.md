# CMS Innovation Center Model Participants

## [View the geojson map on GitHub](data.geojson)

Converted tabular data on Center for Medicare Studies to geoJSON

From [CMS](http://innovation.cms.gov/initiatives/map/index.html):

> # Where Innovation is Happening

> The Innovation Center develops new payment and service delivery models in accordance with the requirements of section 1115A of the Social Security Act. Additionally, Congress has defined, both through the Affordable Care Act and previous legislation, a number of specific demonstrations to be conducted by CMS. 

## Data

* [Source](https://data.cms.gov/dataset/CMS-Innovation-Center-Model-Participants/x8pc-u7ta) (Socratta)
* [CMS Visualization](http://innovation.cms.gov/initiatives/map/index.html)
* [CMS Visualization source](https://github.com/CMSgov/CMS-GoogleMaps-Socrata-Integration)

## How to convert

* `ruby parse.rb` in the same folder as `data.csv`
* Outputs valid `data.geojson` for use on GitHub (or elsewhere)

## License

* Code: MIT
* Original Tabular Data: US Government Work
* GeoJSON Data: Creative Commons CC-BY-NC