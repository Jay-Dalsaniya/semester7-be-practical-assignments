import React from "react";

const Checkout = ({ cartItems }) => {
  const handleCheckout = () => {
    alert("Checkout completed!");
  };

  return (
    <div className="checkout">
      <h2>Checkout</h2>
      <ul>
        {cartItems.map((item, index) => (
          <li key={index}>
            {item.name} - ${item.price}
          </li>
        ))}
      </ul>
      <button onClick={handleCheckout}>Complete Purchase</button>
    </div>
  );
};

export default Checkout;
