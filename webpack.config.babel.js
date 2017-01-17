import webpack           from 'webpack';
import path              from 'path';
import ExtractTextPlugin from 'extract-text-webpack-plugin';

export default {
  entry: {
    application: [
      './source/stylesheets/application.scss',
      './source/javascripts/application.js'
    ],
    vendor: ['babel-polyfill'],
  },
  resolve: {
    extensions: ['', '.js', '.scss']
  },
  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/[name].js'
  },
  module: {
    loaders: [
      {test: /\.js$/, include: path.join(__dirname, 'source/javascripts'), loader: 'babel' },
      {test: /\.scss$/, loader: ExtractTextPlugin.extract('style', "css!sass?sourceMap&includePaths[]=" + __dirname + "/node_modules")}
    ]
  },
  plugins: [
      new ExtractTextPlugin("stylesheets/application.css")
  ]
};
