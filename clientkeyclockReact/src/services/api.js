import axios from "axios";
import Constaints from "../utils/Constaints";


const api = axios.create({
  baseURL: process.env.REACT_APP_API,
});

api.interceptors.request.use(async config => {
    const token = localStorage.getItem(Constaints.TOKEN);
    const uuid = localStorage.getItem(Constaints.UUID_USER);
    
    api.defaults.headers.UUID_USER = uuid;
    if (token) {
      api.defaults.headers.authorization = `Bearer ${token}`;
    }
  
    return config;
  });
export default api;