hal-builder
===========

[![Build Status](https://travis-ci.org/pghalliday/hal-builder.png)](https://travis-ci.org/pghalliday/hal-builder)
[![Dependency Status](https://gemnasium.com/pghalliday/hal-builder.png)](https://gemnasium.com/pghalliday/hal-builder)

Tools to generate HAL APIs

## Installation

```
npm install hal-builder
```

## Usage



## Roadmap

`hal-builder` should do something like this

```coffeescript
express = require 'express'
HalBuilder = require 'hal-builder'

# create an express application
app = express()
app.use express.bodyParser()

shop = 
  products: [
    name: 'Widget'
    price: '15'
  ,
    name: 'Doodad'
    price: '25'
  ,
    name: 'Whatchamacallit'
    price: '30'
  ]
  accounts: [
    name: 'Tom'
    basket: []
    orders: []
  ,
    name: 'Dick'
    basket: []
    orders: []
  ,
    name: 'Harry'
    basket: []
    orders: []
  ]

# pass the express application to a new HalBuilder instance so that it can add
# routes and specify the entry point for the new API and its docs
shopAPI = HalBuilder(
  app: app
  href: '/shop'
  relationshipCuries: [
    name: 'shop'
    href: '/docs/{relationship}'
  ]
)

shopAPI.get(
  description: 'Returns the root of the shop API with links to the accounts and the products'
  resolve: (request, response, resource) =>
    # read the params and populate the resource
    # in this case the 2 links will already be set
    response.send resource
  links: [
    shopAPI.createLink(
      relationship: 'shop:products'
      description: 'Get the list of products'
      href: '/shop/products'
    )
    .get(
      description: 'Returns the list of products'
      resolve: (request, response, resource) =>
        for product in shop.products
          resource.collection['shop:product'].add
            name: product.name
            title: product.name
        response.send resource
      links: [
        shopAPI.createCollection(
          relationship: 'shop:product'
          description: 'An aray of product links'
          href: '/shop/products/{name}'        
        )
      ]
    )
    .post(
      description: 'Add a product'
      resolve: (request, response, resource) =>
        shop.products.push
          name: request.body.name
        response.send resource
      links: [
        shopAPI.createCollection(
          relationship: 'shop:product'
          description: 'An aray of product links'
          # TODO: resolve this conflict!!
          href: '/shop/products/{name}'        
        )
      ]
    )
  ,
    shopAPI.createLink(
      relationship: 'shop:accounts'
      description: 'Get the list of accounts'
      href: '/shop/accounts'        
    )
    .get(
      description: 'Returns the list of accounts'
      resolve: (request, response, resource) =>
        for account in shop.accounts
          resource.collection['shop:account'].add
            name: account.name
            title: account.name
        response.send resource
      links: [
        shopAPI.createCollection(
          relationship: 'shop:account'
          description: 'An aray of account status links'
          href: '/shop/accounts/{name}'        
        )
      ]
    )
  ]
)

# start the express server
app.listen 3000
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

Run tests with

```
$ npm test
```

## License
Copyright &copy; 2013 Peter Halliday  
Licensed under the MIT license.