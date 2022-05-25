import Constaints from "../utils/Constaints";


class ApiService {
  
  requestOptions(method) {
    const token = localStorage.getItem(Constaints.TOKEN);
    const uuid = localStorage.getItem(Constaints.UUID_USER);
    return{
      method: method,
      headers: { 'Content-Type': 'application/json' , UUIDUSER : uuid , 'Authorization' :  `Bearer ${token}` }
    }  
  };
  
  requestOptionsBody(method, body) {
    const token = localStorage.getItem(Constaints.TOKEN);
    const uuid = localStorage.getItem(Constaints.UUID_USER);
    return{
      method: method,
      headers: { 'Accept-Charset': 'multipart/form-data' , 'Content-Type': 'charset=UTF-8' , UUIDUSER : uuid , 'Authorization' :  `Bearer ${token}` },
      body: JSON.stringify(body)
    }  
  };  

  requestOptionsBodyMultiPartForm(method, body) {
    const token = localStorage.getItem(Constaints.TOKEN);
    const uuid = localStorage.getItem(Constaints.UUID_USER);
    return{
      method: method,
      headers: { UUIDUSER : uuid , 'Authorization' :  `Bearer ${token}` },
      body: body
    }  
  };

  getHeader(){
    return this.requestOptions('GET')
  }
  
  postHeader(body){
    return this.requestOptionsBody('POST', body)
  }

  postHeaderMultiPartForm(body){
    return this.requestOptionsBodyMultiPartForm('POST', body)
  }
}
export default new ApiService();