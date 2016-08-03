// webpack.config.js
var path    = require("path");
var webpack = require('webpack');

module.exports = {
  entry: {
    site: './source/javascripts/all.js'
  },

  resolve: {
    root: __dirname + '/source/javascripts',
  },

  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/[name].js',
  },

  module: {
    loaders: [
      {
        test: /source\/assets\/javascripts\/.*\.js$/,
        exclude: /node_modules|\.tmp|vendor/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'stage-0']
        }
      },
      {
          test: /\.scss$/,
          exclude: /node_modules/,
          loader: "style-loader!raw-loader!sass-loader?includePaths[]=" + path.resolve(__dirname, "./node_modules/compass-mixins/lib")
      }
    ],
  }

};
