import React, { useState } from "react";
import apiService from "../../services/ApiService";
import { Formik, Form, Field, ErrorMessage } from "formik";
import * as Yup from "yup";
import { mascaraMonetaria } from "../../utils/Util";
const createProductSchema = Yup.object().shape({
  name: Yup.string()
  .max(50, "Nome é muito grande")
  .min(5, "Nome é muito pequeno")
  .required("Digite um nome para seu produto!"),
  description: Yup.string()
  .max(500, "Muita coisa escrita")
  .min(20, "Descreva mais sobre seu produto")
  .required("Digite uma descrição para seu produto!"),
  price: Yup.number()
  .required("Digite um preço para seu produto!")
  .min(5, 'Preço m´nimo de 5,00R$')
  .max(5000, 'Preço máximo de 5.000,00R$').test(
    'is-decimal',
    'Digite um valor válido',
    value => (value + "").match(/^\d*\.{1}\d*$/),
  ),
});

const initialValuesProduct = {
  name: "",
  description: "",
  price: 5.0
};

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
    console.log("event")
    console.log(event)
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
      <Formik
        initialValues={initialValuesProduct}
        validationSchema={createProductSchema}
        onSubmit={(values) => {
          handleSubmit();
        }}
      >
        {(formik) => {
        const { errors, touched, isValid, dirty } = formik;
        return (
          <div  class="w-full max-w-lg mx-auto my-20"> 
            <Form>
            <div class="flex flex-wrap mx-3 mb-1" className="form-row">
                <label htmlFor="name" class="block uppercase tracking-wide text-gray-700 text-ms font-bold mb-2" for="grid-image">
                  Nome
                </label>
                <Field
                class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 
                  mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" 
                  placeholder="Digite um nome para o produto!"
                  type="name"
                  name="name"
                  id="name"
                  className={
                    errors.name && touched.name ? "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-red-500" 
                    : "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                  }
                /> 
                <ErrorMessage name="name" component="span" 
                  class="bg-red-100 border border-red-400 text-red-700 rounded " />
              </div>
              <div class="flex flex-wrap mx-3 mb-1" className="form-row">
                <label class="block uppercase tracking-wide text-gray-700 text-ms font-bold mb-2" >
                  Descrição
                </label>
                <Field
                class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 
                  mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" 
                  placeholder="Digite uma descrição para o produto!"
                  type="description"
                  name="description"
                  id="description"
                  className={
                    errors.description && touched.description ? "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-red-500" 
                    : "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                  }
                />
                <ErrorMessage name="description" component="span" 
                 class="bg-red-100 border border-red-400 text-red-700 rounded relative"/>  
              </div>
              
              <div class="flex flex-wrap mx-3 mb-1" className="form-row">
                <label class="block uppercase tracking-wide text-gray-700 text-ms font-bold mb-2" >
                  Preço
                </label>
                <Field
                class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 
                  mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" 
                  placeholder="Digite um preço para o produto!"
                  type="number"
                  name="price"
                  id="price"
                  className={
                    errors.price && touched.price ? "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-red-500" 
                    : "appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                  }
                />
                <ErrorMessage name="price" component="span" 
                 class="bg-red-100 border border-red-400 text-red-700 rounded relative"/>  
              </div>
              
              <div class=" py-3  ">
                <button
                  type="submit"
                  className={!(dirty && isValid) ? "inline-flex items-center px-4 py-2 border border-red-300 rounded-md shadow-sm text-sm font-medium text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" 
                  : "inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"}
                  disabled={!(dirty && isValid)}
                  >
                    Salvar
                </button>
              </div>  
            </Form>
          </div>
        );
      }}
    </Formik>
   )
}
 
export default CreateProduct;