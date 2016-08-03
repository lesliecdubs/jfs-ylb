# Canvas Middleman Template

 [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

 This is the template for building Middleman static sites.

 ##Dependencies

 ### Imageoptim

 ```brew install advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant jonof/kenutils/pngout```

```npm install -g svgo```

## Deployment

#### Staging
```
middleman build
```

#### Production
```
TARGET=production middleman build
```
