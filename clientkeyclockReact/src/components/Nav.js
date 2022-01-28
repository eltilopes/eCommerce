import React from "react";
import { useKeycloak } from "@react-keycloak/web";
import KeyclockUtils from "../utils/KeyclockUtils";
import { NavLink } from "react-router-dom";


const Nav = () => {
const { keycloak } = useKeycloak();
KeyclockUtils.validToken(keycloak)
 return (
   <div>
     <div className="top-0 w-full flex flex-wrap">
       <section className="x-auto">
         <nav className="flex justify-between bg-gray-200 text-blue-800 w-screen">
           <div className="px-5 xl:px-12 py-6 flex w-full items-center">
             <h1 className="text-3xl font-bold font-heading">
               {process.env.REACT_APP_TITLE}
             </h1>
             {!!keycloak.authenticated && (
                  <ul className="hidden md:flex px-4 mx-auto font-semibold font-heading space-x-12">
                  <li>     
                    <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/'>Home</NavLink>
                  </li>
                  <li>
                    <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/secured'>Secured Page</NavLink>
                  </li> 
                  <li>
                    <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/users'>Users</NavLink>
                  </li>
                  <li>
                    <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/uploadFile'>Upload File</NavLink>
                  </li>
                </ul>
             )}
             
             <div className="hidden mx-auto xl:flex items-center space-x-25">
               <div className="hover:text-gray-200">
                 {!keycloak.authenticated && (
                   <button
                     type="button"
                     className="text-blue-800"
                     onClick={() => keycloak.login()}
                   >
                     Login/Register
                   </button>
                 )}

                 {!!keycloak.authenticated && (
                   <button
                     type="button"
                     className="text-blue-800"
                     onClick={() => keycloak.logout()}
                   >
                     Logout ({keycloak.tokenParsed.preferred_username})
                   </button>
                 )}
               </div>
             </div>
           </div>
         </nav>
       </section>
     </div>
   </div>
 );
};

export default Nav;