import React, { useEffect, useState } from "react";
import { createPortal } from "react-dom";
import api from "../../services/api";
import apiService from "../../services/ApiService";
import { mascaraMonetaria } from "../../utils/Util";

export default function ProductList() {
  const [products, setProducts] = useState([]);

  async function getProdutos() {
      try {
        fetch(process.env.REACT_APP_API + "/product", apiService.getHeader())
        .then(res => res.json())
        .then(
          (result) => {
            console.log(result)
            setProducts(result.result)   
          }
        )         
      } catch (error) {
          console.log(error)
      }
  }

  useEffect(() => {
    getProdutos();
  }, []);

  return (
    <div class="flex flex-col">
        <div class="-my-2 overflow-x-auto">
            <div class="p-10 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-4 gap-5">
                {products && products.map((product) => (
                  <div class="max-w-sm rounded overflow-hidden shadow-lg">
                    <img class="w-full" src={product.image} alt=""/>
                    <div class="px-6 py-4">
                      <div class="font-bold text-xl mb-2">{product.name}</div>
                      <p class="text-gray-700 text-base">
                        {product.description}
                      </p>
                    </div>
                    <div class="px-6 pt-4 pb-2">
                      <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">{mascaraMonetaria(product.price)}</span>
                      <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2">{product.createDate}</span>
                      <input class="form-check-input appearance-none h-4 w-4 border border-gray-300 rounded-sm bg-white checked:bg-blue-600 
                        checked:border-blue-600 focus:outline-none transition duration-200 my-1 align-top bg-no-repeat bg-center bg-contain float-right cursor-pointer" 
                        type="checkbox" value=""  id="flexCheckDefault3" />
                    </div>
                  </div>
                ))}
                 {products && products.map((product) => (
                  <div class="max-w-xs mx-4 mb-2 rounded-lg shadow-lg">
                    <img class="w-full" src={product.image} alt=""/>
                    <div class="px-6 py-4">
                      <div class="flex mb-2">
                        <span class="px-4 py-0.5 text-sm bg-red-500 rounded-full text-red-50">{product.createDate}</span>
                      </div>
                      <h4 class="mb-3 text-xl font-semibold tracking-tight text-green-600 uppercase">{product.name}</h4>
                      <p class="leading-normal text-gray-700">{product.description}</p>
                    </div>
                    <div class="flex items-center justify-between p-4">
                      <button class="px-4 py-2 bg-green-600 text-green-50">Order Now</button>
                      <span class="text-xl text-green-600">R${mascaraMonetaria(product.price)}</span>
                    </div>
                  </div>

                ))}
            </div>         
        </div>
    </div>        
  );
}