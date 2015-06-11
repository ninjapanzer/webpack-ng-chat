var webpack = require("webpack");
var path = require("path");
var SaveAssetsJson = require('assets-webpack-plugin');
var bower_dir = __dirname + '/bower_components';
var resolveBowerPath = function(componentPath) {
    return path.join(bower_dir, componentPath);
};
webpackConfig = {
  entry: './app/app.coffee',
  devtool: "source-map",
  output: {
    path: './dist',
    filename: 'chat-[hash].min.js'
  },
  externals: ['angular', 'jQuery', '$'],
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.scss$/, loader: "style!css!sass" },
      { test: /\.png$/, loader: "url-loader?limit=100000" }
    ]
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({minimize: true}),
    new SaveAssetsJson()
  ],
  resolve: {
    extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
  }
};

if(process.env.WEBPACK !== undefined){
  webpackConfig.output.path = './build';
  webpackConfig.output.filename = 'chat.min.js';
}
function escapeRegExpString(str) { return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"); }
function pathToRegExp(p) { return new RegExp("^" + escapeRegExpString(p)); }
module.exports = webpackConfig;
