import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Nav from "./components/Nav";
import Homepage from "./pages/Homepage";
import SecuredPage from "./pages/Securedpage";
import UsersList from "./pages/user/UsersList";
import keycloak from "./Keycloak"
import CreateUser from "./pages/user/CreateUser";
import CreateProduct from "./pages/product/CreateProduct";
import ProductList from "./pages/product/ProductList";
import UpdateUser from "./pages/user/UpdateUser";
import { ReactKeycloakProvider } from "@react-keycloak/web";
import PrivateRoute from "./helpers/PrivateRoute";
import SignInForm from "./pages/product/SignInForm";
function App() {
 return (
   <div>
     <ReactKeycloakProvider authClient={keycloak}>
      <BrowserRouter>
        <Nav />
          <Routes>  
            <Route exact path="/" element={<Homepage />} />
            <Route exact path="/users" element={<UsersList />} />
            <Route exact path='/create' element={<CreateUser />} />
            <Route exact path='/update/:id' element={<UpdateUser />}/>
            <Route exact path='/products' element={<ProductList />}/>
            <Route exact path='/sign' element={<SignInForm />}/>
            <Route
                path="/secured"
                element={
                  <PrivateRoute>
                    <SecuredPage />
                  </PrivateRoute>
                }
              />
            <Route
                path="/product/create"
                element={
                  <PrivateRoute>
                    <CreateProduct />
                  </PrivateRoute>
                }
              />
          </Routes>
      </BrowserRouter>
     </ReactKeycloakProvider>
   </div>
 );
}

export default App;