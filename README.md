# Canvas Middleman Template

 [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

 This is the template for building Middleman static sites.

 ##Dependencies

 ### Imageoptim

 ```brew install advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant jonof/kenutils/pngout```

```npm install -g svgo```

## Deployment
Deployments use the [middleman-s3_sync](https://github.com/fredjean/middleman-s3_sync) gem to push your ```/build``` folder to Amazon s3.

Deployments use the [middleman-cloudfront](https://github.com/andrusha/middleman-cloudfront) gem to invalidate cloudfront caches after s3_sync completes.

##### NOTE: Cache invalidation could take up to 10-15 minutes to complete.

#### Staging
```
middleman build
middleman sync
```

#### Production
```
TARGET=production middleman build
TARGET=production middleman s3_sync --bucket=PRODUCTION_S3_BUCKET
```
