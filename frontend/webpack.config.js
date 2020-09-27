const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: process.env.NODE_ENV,
  entry: "./src/index.tsx",
  output: {
    path: path.resolve(__dirname, "./dist"),
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
    watchOptions: {
      poll: true
    }
  },
  plugins: [new HtmlWebpackPlugin({ template: "./src/index.html" })],
};
