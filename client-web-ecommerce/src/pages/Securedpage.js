import React from 'react';
import api from '../services/api';

const Secured = () => {
  
  console.log("Lalaland" );
  
  api.get("comum/uuid")
  .then((response) => 
    console.log(response))
  .catch((err) => {
    console.log("ops! ocorreu um erro" + err);
  });
 return (
   <div>
     <h1 className="text-black text-4xl">Welcome to the Protected Page.</h1>
   </div>
 );
};

export default Secured;