import React from "react";
import ReactDOM from "react-dom";
import Kannzenshouri from "./images/kannzennshouri_uzakichan.jpg";
import Megane from "./images/megane_uzakichan.jpg"
import Ukkari from "./images/ukkari_uzakichan.jpg"
import Niyaniya from "./images/niyaniya_uzakichan.jpg"


export const App: React.FC = () => {
  return <div>
    hello world!!!!
    <img src={Kannzenshouri} />
    <img src={Megane} />
    <img src={Ukkari} />
    <img src={Niyaniya} />
  </div>
}

ReactDOM.render(
  <App />,
  document.getElementById("root")
);
