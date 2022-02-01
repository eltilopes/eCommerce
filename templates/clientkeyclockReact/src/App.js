import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Nav from "./components/Nav";
import WelcomePage from "./pages/Homepage";
import SecuredPage from "./pages/Securedpage";
import UsersList from "./pages/user/UsersList";
import keycloak from "./Keycloak"
import CreateUser from "./pages/user/CreateUser";
import UploadFiles from "./pages/upload/UploadFile";
import UpdateUser from "./pages/user/UpdateUser";
import { ReactKeycloakProvider } from "@react-keycloak/web";
import PrivateRoute from "./helpers/PrivateRoute";

function App() {
 return (
   <div>
     <ReactKeycloakProvider authClient={keycloak}>
      <BrowserRouter>
        <Nav />
          <Routes>  
            <Route exact path="/" element={<WelcomePage />} />
            <Route exact path="/users" element={<UsersList />} />
            <Route exact path='/create' element={<CreateUser />} />
            <Route exact path='/update/:id' element={<UpdateUser />}/>
            <Route exact path='/uploadFile' element={<UploadFiles />}/>
            <Route
                path="/secured"
                element={
                  <PrivateRoute>
                    <SecuredPage />
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