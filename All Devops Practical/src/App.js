import React, { useState } from "react";
import ProductList from "./components/ProductList";
import Cart from "./components/Cart";
import Checkout from "./components/Checkout";
import "./App.css";

function App() {
  const [cartItems, setCartItems] = useState([]);

  const addToCart = (product) => {
    setCartItems([...cartItems, product]);
  };

  const removeFromCart = (index) => {
    const newCart = [...cartItems];
    newCart.splice(index, 1);
    setCartItems(newCart);
  };

  return (
    <div className="app">
      <header>
        <h1>eCommerce Site</h1>
      </header>
      <main>
        <ProductList addToCart={addToCart} />
        <Cart cartItems={cartItems} removeFromCart={removeFromCart} />
        <Checkout cartItems={cartItems} />
      </main>
    </div>
  );
}

export default App;
