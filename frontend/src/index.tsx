import React from "react";
import ReactDOM from "react-dom";
import Kannzenshouri from "./images/kannzennshouri_uzakichan.jpg";

export const App: React.FC = () => {
  return <div>
    hello world!
    <img src={Kannzenshouri} />
  </div>
}

ReactDOM.render(
  <App />,
  document.getElementById("root")
);
