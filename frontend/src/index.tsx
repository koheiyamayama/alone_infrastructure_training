import React from "react";
import ReactDOM from "react-dom";
import Kannzenshouri from "./images/kannzennshouri_uzakichan.jpg";
import Megane from "./images/megane_uzakichan.jpg"

export const App: React.FC = () => {
  return <div>
    hello world!
    <img src={Kannzenshouri} />
    <img src={Megane} />
  </div>
}

ReactDOM.render(
  <App />,
  document.getElementById("root")
);
