const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: process.env.NODE_ENV,
  entry: "./src/index.tsx",
  output: {
    path: path.resolve(__dirname, "./dist"),
    publicPath: "assets",
    filename: "build.js",
  },
  module: {
    rules: [
      {
        test: /\.(ts|tsx)$/,
        use: [
          {
            loader: "ts-loader",
          },
        ],
      },
      {
        test: /\.(css)$/,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.(png|jpg)$/,
        use: ["file-loader"],
      },
    ],
  },
  resolve: {
    extensions: [".ts", ".js", ".tsx"],
  },
  devServer: {
    contentBase: "/",
    publicPath: "/assets",
    port: 3500,
    compress: true,
    hot: true,
    host: "0.0.0.0",
    allowedHosts: ["localhost"],
  },
  plugins: [new HtmlWebpackPlugin({ template: "./src/index.html" })],
};
