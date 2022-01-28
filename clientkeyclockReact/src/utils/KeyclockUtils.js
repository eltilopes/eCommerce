
class KeyclockUtils {
    validToken(keycloak) {
        console.log("KeyclockService keycloak")   
        console.log(keycloak) 

        if(keycloak.authenticated){
            localStorage.setItem("token", keycloak.token); //set keycloak token to localStorag
            localStorage.setItem("uuidUser", keycloak.idTokenParsed.sub); //set uuidUser to localStorag
            //setJWTToken(keycloak.token) //set to axios Authorization Bearer 
        }
       
        keycloak.onTokenExpired = () => {
         console.log('token expired', keycloak.token);
         keycloak.updateToken(30).success(() => {
             console.log('successfully get a new token', keycloak.token);
             localStorage.setItem("token", keycloak.token); //set keycloak token to localStorag
             localStorage.setItem("uuidUser", keycloak.idTokenParsed.sub); //set uuidUser to localStorag
         }).error(() => {console.log("error keycloak.updateToken")});
        }
       
        console.log('uuidUser ', localStorage.getItem("uuidUser")); 
    }
  
 
  }
  
  export default new KeyclockUtils();
  