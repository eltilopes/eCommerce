import React from 'react';
import api from '../services/api';

const Home = () => {
 
 return (
   <div>
     <figure class="bg-gray-100 rounded-xl p-8 dark:bg-gray-800">
      <img class="w-48 h-48 rounded-full mx-auto" src="https://www.suaimagem.med.br/img/service/3.jpg" alt="" width="384" height="512"/>
      <div class="pt-6 space-y-4">
        <h1 className="text-green-800 text-4xl">Welcome to the Homepage</h1>
        <blockquote>
          <p class="text-lg font-medium">
            “Tailwind CSS is the only framework that I've seen scale
            on large teams. It’s easy to customize, adapts to any design,
            and the build size is tiny.”
          </p>
        </blockquote>
        <figcaption class="font-medium">
          <div class="text-sky-500 dark:text-sky-400">
            Sarah Dayan
          </div>
          <div class="text-gray-700 dark:text-gray-500">
            Staff Engineer, Algolia
          </div>
        </figcaption>
      </div>
    </figure>
   </div>
 );
};
export default Home;