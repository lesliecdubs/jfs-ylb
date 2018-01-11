# Canvas Middleman Template

 [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

 This is the template for building Middleman static sites.

 ##Dependencies

 ### Yarn
 ```brew install yarn```

 ### Imageoptim

 ```brew install advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant jonof/kenutils/pngout```

```yarn install -g svgo```

#### Local Dev
```
middleman s
```

## Deployment

#### Staging
```
middleman build
```

#### Production
```
TARGET=production middleman build
```
