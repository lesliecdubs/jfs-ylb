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
    extensions: ['.js', '.json', '.scss']
  },
  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/[name].js'
  },
  module: {
    rules: [
      {test: /\.js$/, include: path.join(__dirname, 'source/javascripts'), loader: 'babel-loader' },
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        loader: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: "css-loader!sass-loader"
        })
      }, {
        test: /\.(eot|svg|ttf|woff|woff2)$/,
        loader: 'file?name=public/fonts/[name].[ext]'
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin("stylesheets/application.css")
  ]
};
