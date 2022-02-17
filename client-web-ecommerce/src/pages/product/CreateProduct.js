import React, { useState } from "react";
import apiService from "../../services/ApiService";

function CreateProduct() {
  
    async function saveProduto(body) {
      try {

        fetch(process.env.REACT_APP_API + "/product", apiService.postHeaderMultiPartForm(body))
        .then(res => res.json())
        .then(
          (result) => {
            console.log(result)
            console.log("cuida no Salvar o Produto")
          }
        )         
      } catch (error) {
          console.log(error)
      }
   }

   const handleSubmit = event => {
     let file = selectedFiles[0]
     event.preventDefault();
     var product = {
       'name': name,
       'description': description,
       'price': price,
       'image': file.name
     }
     let formData = new FormData();
     formData.append("file", selectedFiles[0], JSON.stringify(product));
     saveProduto(formData)
   }

   const selectFile = event => {
      setSelectedFiles( event.target.files)
   }

   const [name, setName] = useState('');
   const [description, setDescription] = useState('');
   const [price, setPrice] = useState(Number);
   const [image, setImage] = useState('');
   const [progress, setProgress] = useState(0);
   const [selectedFiles, setSelectedFiles] = useState();
   
 
   return (
       <form class="w-full max-w-lg mx-auto my-20" accept-charset="utf-8" onSubmit={handleSubmit}>
       
       <div class="flex flex-wrap mx-3 mb-1">
           <div class="w-full px-3">
           <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-image">
               Nome
           </label>
           <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-image" type="text"
           placeholder="Nome"
           label="Nome"
           onChange={(e) => setName(e.target.value)}
           />
           </div>
       </div>
       <div class="flex flex-wrap mx-3 mb-1">
           <div class="w-full px-3">
           <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-image">
               Descrição
           </label>
           <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-image" type="text"
           placeholder="Descrição"
           label="Descrição"
           onChange={(e) => setDescription(e.target.value)}
           />
           </div>
       </div>
       <div class="flex flex-wrap mx-3 mb-1">
           <div class="w-full px-3">
           <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-image">
               Preço
           </label>
           <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-image" type="text"
           placeholder="Preço"
           label="Preço"
           onChange={(e) => setPrice(e.target.value)}
           />
           </div>
       </div>
       <div class="flex flex-wrap mx-3 mb-1">
           <div class="w-full px-3">
           <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-image">
               Imagem
           </label>
           <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-image" type="text"
           placeholder="Imagem"
           label="Imagem"
           onChange={(e) => setImage(e.target.value)}
           />
           </div>
       </div>
       <div class="flex flex-wrap mx-3 mb-1">
          <div class="w-full px-3"> 
              <label className="inline-flex items-center justify-center px-7 py-2 text-base font-bold rounded leading-6 text-white bg-gray-200 md:w-auto hover:text-blue-800 focus:outline-none">
                <input class="inline-flex items-center justify-center px-6 py-2 text-base font-bold leading-6 text-white bg-gray-200 md:w-auto hover:text-blue-800 focus:outline-none" 
                    type="file" 
                    accept=".jpg, .jpeg, .png"
                    onChange={selectFile} />
              </label>
              <div className="progress">
                  <div
                    className="progress-bar progress-bar-info progress-bar-striped"
                    role="progressbar"
                    aria-valuenow={progress}
                    aria-valuemin="0"
                    aria-valuemax="100"
                    style={{ width: progress + "%" }}
                  >
                    {progress}%
                </div>
              </div>

          </div>    
       </div>   
       <button 
          type="submit" 
          disabled={!selectedFiles} 
          class="inline-flex items-center ml-8 px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
           SALVAR
       </button>
      
       </form>
   )
}
 
export default CreateProduct;