import React from "react";
import { useKeycloak } from "@react-keycloak/web";
import KeyclockUtils from "../utils/KeyclockUtils";
import { NavLink } from "react-router-dom";
import Constaints from "../utils/Constaints";


const Nav = () => {
  const { keycloak }  = useKeycloak();
  const isFornecedor = localStorage.getItem(Constaints.FORNECEDOR)
  KeyclockUtils.validToken(keycloak)

  function logout() {
    KeyclockUtils.setUserInfosEmpty()
    keycloak.logout()
  }
  return (
    <div>
      <div className="top-0 w-full flex flex-wrap">
        <section className="x-auto">
          <nav className="flex justify-between bg-yellow-200 text-blue-800 w-screen">
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
                      <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/products'>Products</NavLink>
                    </li>
                    <li>
                      <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/sign'>Sign</NavLink>
                    </li>
                    <li  hidden={isFornecedor==="false"}>
                      <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/product/create'>New Product</NavLink>
                    </li>
                    <div className="navbar-brand">
                      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-400" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                      </svg>
                    </div>
                    <div className="navbar-brand">
                      <NavLink exact={true} className="navbar-brand" activeClassName='active' to='/products'> 
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-400" fill="none" viewBox="0 0 24 24"  stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round"  d="M12.075,10.812c1.358-0.853,2.242-2.507,2.242-4.037c0-2.181-1.795-4.618-4.198-4.618S5.921,4.594,5.921,6.775c0,1.53,0.884,3.185,2.242,4.037c-3.222,0.865-5.6,3.807-5.6,7.298c0,0.23,0.189,0.42,0.42,0.42h14.273c0.23,0,0.42-0.189,0.42-0.42C17.676,14.619,15.297,11.677,12.075,10.812 M6.761,6.775c0-2.162,1.773-3.778,3.358-3.778s3.359,1.616,3.359,3.778c0,2.162-1.774,3.778-3.359,3.778S6.761,8.937,6.761,6.775 M3.415,17.69c0.218-3.51,3.142-6.297,6.704-6.297c3.562,0,6.486,2.787,6.705,6.297H3.415z" />
                        </svg>
                      </NavLink>
                    </div>
                  </ul>
              )}
              
              <div className="hidden mx-auto xl:flex items-right space-x-25">
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
                      onClick={() => logout()}
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